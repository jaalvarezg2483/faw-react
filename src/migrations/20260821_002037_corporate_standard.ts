import { MigrateUpArgs, MigrateDownArgs, sql } from '@payloadcms/db-postgres'

export async function up({ db, payload: _payload, req: _req }: MigrateUpArgs): Promise<void> {
  await db.execute(sql`
   CREATE TYPE "public"."enum_users_role" AS ENUM('admin', 'editor');
  CREATE TABLE "header" (
	"id" serial PRIMARY KEY NOT NULL,
	"logo_id" integer,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
  );

  CREATE TABLE "header_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"nav_items_id" integer
  );

  CREATE TABLE "footer_social_links" (
	"_order" integer NOT NULL,
	"_parent_id" integer NOT NULL,
	"id" varchar PRIMARY KEY NOT NULL,
	"label" varchar NOT NULL,
	"url" varchar NOT NULL
  );

  CREATE TABLE "footer" (
	"id" serial PRIMARY KEY NOT NULL,
	"legal_text" varchar,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
  );

  CREATE TABLE "home_page" (
	"id" serial PRIMARY KEY NOT NULL,
	"heading" varchar,
	"intro" varchar,
	"seo_meta_title" varchar,
	"seo_meta_description" varchar,
	"seo_canonical_url" varchar,
	"seo_no_index" boolean DEFAULT false,
	"seo_no_follow" boolean DEFAULT false,
	"seo_social_image_id" integer,
	"seo_structured_data" jsonb,
	"updated_at" timestamp(3) with time zone,
	"created_at" timestamp(3) with time zone
  );

  CREATE TABLE "home_page_rels" (
	"id" serial PRIMARY KEY NOT NULL,
	"order" integer,
	"parent_id" integer NOT NULL,
	"path" varchar NOT NULL,
	"models_id" integer
  );

  ALTER TABLE "users" ADD COLUMN "role" "enum_users_role" DEFAULT 'editor' NOT NULL;
  UPDATE "users" SET "role" = 'admin';
  ALTER TABLE "media" ADD COLUMN "title" varchar;
  UPDATE "media" SET "title" = COALESCE(NULLIF("alt", ''), NULLIF("filename", ''), 'Archivo');
  ALTER TABLE "media" ALTER COLUMN "title" SET NOT NULL;
  ALTER TABLE "media" ADD COLUMN "description" varchar;
  ALTER TABLE "models" ADD COLUMN "seo_meta_title" varchar;
  ALTER TABLE "models" ADD COLUMN "seo_meta_description" varchar;
  ALTER TABLE "models" ADD COLUMN "seo_canonical_url" varchar;
  ALTER TABLE "models" ADD COLUMN "seo_no_index" boolean DEFAULT false;
  ALTER TABLE "models" ADD COLUMN "seo_no_follow" boolean DEFAULT false;
  ALTER TABLE "models" ADD COLUMN "seo_social_image_id" integer;
  ALTER TABLE "models" ADD COLUMN "seo_structured_data" jsonb;
  ALTER TABLE "site_settings" ADD COLUMN "seo_meta_title" varchar;
  ALTER TABLE "site_settings" ADD COLUMN "seo_meta_description" varchar;
  ALTER TABLE "site_settings" ADD COLUMN "seo_canonical_url" varchar;
  ALTER TABLE "site_settings" ADD COLUMN "seo_no_index" boolean DEFAULT false;
  ALTER TABLE "site_settings" ADD COLUMN "seo_no_follow" boolean DEFAULT false;
  ALTER TABLE "site_settings" ADD COLUMN "seo_social_image_id" integer;
  ALTER TABLE "site_settings" ADD COLUMN "seo_structured_data" jsonb;
  ALTER TABLE "header" ADD CONSTRAINT "header_logo_id_media_id_fk" FOREIGN KEY ("logo_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."header"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "header_rels" ADD CONSTRAINT "header_rels_nav_items_fk" FOREIGN KEY ("nav_items_id") REFERENCES "public"."nav_items"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "footer_social_links" ADD CONSTRAINT "footer_social_links_parent_id_fk" FOREIGN KEY ("_parent_id") REFERENCES "public"."footer"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "home_page" ADD CONSTRAINT "home_page_seo_social_image_id_media_id_fk" FOREIGN KEY ("seo_social_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "home_page_rels" ADD CONSTRAINT "home_page_rels_parent_fk" FOREIGN KEY ("parent_id") REFERENCES "public"."home_page"("id") ON DELETE cascade ON UPDATE no action;
  ALTER TABLE "home_page_rels" ADD CONSTRAINT "home_page_rels_models_fk" FOREIGN KEY ("models_id") REFERENCES "public"."models"("id") ON DELETE cascade ON UPDATE no action;
  CREATE INDEX "header_logo_idx" ON "header" USING btree ("logo_id");
  CREATE INDEX "header_rels_order_idx" ON "header_rels" USING btree ("order");
  CREATE INDEX "header_rels_parent_idx" ON "header_rels" USING btree ("parent_id");
  CREATE INDEX "header_rels_path_idx" ON "header_rels" USING btree ("path");
  CREATE INDEX "header_rels_nav_items_id_idx" ON "header_rels" USING btree ("nav_items_id");
  CREATE INDEX "footer_social_links_order_idx" ON "footer_social_links" USING btree ("_order");
  CREATE INDEX "footer_social_links_parent_id_idx" ON "footer_social_links" USING btree ("_parent_id");
  CREATE INDEX "home_page_seo_seo_social_image_idx" ON "home_page" USING btree ("seo_social_image_id");
  CREATE INDEX "home_page_rels_order_idx" ON "home_page_rels" USING btree ("order");
  CREATE INDEX "home_page_rels_parent_idx" ON "home_page_rels" USING btree ("parent_id");
  CREATE INDEX "home_page_rels_path_idx" ON "home_page_rels" USING btree ("path");
  CREATE INDEX "home_page_rels_models_id_idx" ON "home_page_rels" USING btree ("models_id");
  ALTER TABLE "models" ADD CONSTRAINT "models_seo_social_image_id_media_id_fk" FOREIGN KEY ("seo_social_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  ALTER TABLE "site_settings" ADD CONSTRAINT "site_settings_seo_social_image_id_media_id_fk" FOREIGN KEY ("seo_social_image_id") REFERENCES "public"."media"("id") ON DELETE set null ON UPDATE no action;
  CREATE INDEX "models_seo_seo_social_image_idx" ON "models" USING btree ("seo_social_image_id");
  CREATE INDEX "site_settings_seo_seo_social_image_idx" ON "site_settings" USING btree ("seo_social_image_id");`)
}

export async function down({ db, payload: _payload, req: _req }: MigrateDownArgs): Promise<void> {
  await db.execute(sql`
   ALTER TABLE "header" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "header_rels" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "footer_social_links" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "footer" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "home_page" DISABLE ROW LEVEL SECURITY;
  ALTER TABLE "home_page_rels" DISABLE ROW LEVEL SECURITY;
  DROP TABLE "header" CASCADE;
  DROP TABLE "header_rels" CASCADE;
  DROP TABLE "footer_social_links" CASCADE;
  DROP TABLE "footer" CASCADE;
  DROP TABLE "home_page" CASCADE;
  DROP TABLE "home_page_rels" CASCADE;
  ALTER TABLE "models" DROP CONSTRAINT "models_seo_social_image_id_media_id_fk";

  ALTER TABLE "site_settings" DROP CONSTRAINT "site_settings_seo_social_image_id_media_id_fk";

  DROP INDEX "models_seo_seo_social_image_idx";
  DROP INDEX "site_settings_seo_seo_social_image_idx";
  ALTER TABLE "users" DROP COLUMN "role";
  ALTER TABLE "media" DROP COLUMN "title";
  ALTER TABLE "media" DROP COLUMN "description";
  ALTER TABLE "models" DROP COLUMN "seo_meta_title";
  ALTER TABLE "models" DROP COLUMN "seo_meta_description";
  ALTER TABLE "models" DROP COLUMN "seo_canonical_url";
  ALTER TABLE "models" DROP COLUMN "seo_no_index";
  ALTER TABLE "models" DROP COLUMN "seo_no_follow";
  ALTER TABLE "models" DROP COLUMN "seo_social_image_id";
  ALTER TABLE "models" DROP COLUMN "seo_structured_data";
  ALTER TABLE "site_settings" DROP COLUMN "seo_meta_title";
  ALTER TABLE "site_settings" DROP COLUMN "seo_meta_description";
  ALTER TABLE "site_settings" DROP COLUMN "seo_canonical_url";
  ALTER TABLE "site_settings" DROP COLUMN "seo_no_index";
  ALTER TABLE "site_settings" DROP COLUMN "seo_no_follow";
  ALTER TABLE "site_settings" DROP COLUMN "seo_social_image_id";
  ALTER TABLE "site_settings" DROP COLUMN "seo_structured_data";
  DROP TYPE "public"."enum_users_role";`)
}
