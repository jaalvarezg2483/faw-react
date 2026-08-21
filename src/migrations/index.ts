import * as migration_20260820_234434_initial_postgres from './20260820_234434_initial_postgres'
import * as migration_20260821_002037_corporate_standard from './20260821_002037_corporate_standard'
import * as migration_20260821_002609_pages_and_blocks from './20260821_002609_pages_and_blocks'

export const migrations = [
  {
    up: migration_20260820_234434_initial_postgres.up,
    down: migration_20260820_234434_initial_postgres.down,
    name: '20260820_234434_initial_postgres',
  },
  {
    up: migration_20260821_002037_corporate_standard.up,
    down: migration_20260821_002037_corporate_standard.down,
    name: '20260821_002037_corporate_standard',
  },
  {
    up: migration_20260821_002609_pages_and_blocks.up,
    down: migration_20260821_002609_pages_and_blocks.down,
    name: '20260821_002609_pages_and_blocks',
  },
]
