import type { CollectionConfig } from 'payload'

import { adminFieldAccess, adminOrSelf, adminsOnly } from '../lib/payload/access'

export const Users: CollectionConfig = {
  slug: 'users',
  admin: {
    useAsTitle: 'email',
  },
  auth: true,
  access: {
    create: adminsOnly,
    read: adminOrSelf,
    update: adminOrSelf,
    delete: adminsOnly,
  },
  fields: [
    {
      name: 'role',
      type: 'select',
      required: true,
      defaultValue: 'editor',
      saveToJWT: true,
      options: [
        { label: 'Administrador', value: 'admin' },
        { label: 'Editor', value: 'editor' },
      ],
      access: {
        create: adminFieldAccess,
        update: adminFieldAccess,
      },
    },
  ],
}
