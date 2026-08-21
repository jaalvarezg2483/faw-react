import { azureStorage } from '@payloadcms/storage-azure'
import type { Plugin } from 'payload'

/** Payload uploads: local disk by default, Azure Blob when explicitly enabled. */
export function getStoragePlugins(): Plugin[] {
  if (process.env.STORAGE_PROVIDER !== 'azure') return []

  const connectionString = process.env.AZURE_STORAGE_CONNECTION_STRING
  const containerName = process.env.AZURE_STORAGE_CONTAINER
  const configuredBaseURL = process.env.AZURE_STORAGE_ACCOUNT_BASEURL

  if (!connectionString || !containerName || !configuredBaseURL) {
    throw new Error(
      'STORAGE_PROVIDER=azure requires AZURE_STORAGE_CONNECTION_STRING, AZURE_STORAGE_CONTAINER, and AZURE_STORAGE_ACCOUNT_BASEURL',
    )
  }

  // Payload appends the container itself. Normalize portal-copied URLs that
  // already include it so generated media URLs never duplicate the path.
  const escapedContainer = containerName.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  const baseURL = configuredBaseURL
    .replace(/\/+$/, '')
    .replace(new RegExp(`/${escapedContainer}$`, 'i'), '')

  return [
    azureStorage({
      collections: { media: true },
      allowContainerCreate: false,
      baseURL,
      connectionString,
      containerName,
    }),
  ]
}
