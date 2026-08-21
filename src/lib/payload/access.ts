import type { Access, CollectionConfig, FieldAccess, GlobalConfig } from 'payload'

type CmsUser = {
  id: number | string
  role?: 'admin' | 'editor' | null
}

function userFromRequest(user: unknown): CmsUser | null {
  if (!user || typeof user !== 'object' || !('id' in user)) return null
  return user as CmsUser
}

export const authenticated: Access = ({ req }) => Boolean(userFromRequest(req.user))

export const adminsOnly: Access = ({ req }) => userFromRequest(req.user)?.role === 'admin'

export const adminFieldAccess: FieldAccess = ({ req }) =>
  userFromRequest(req.user)?.role === 'admin'

export const adminOrSelf: Access = ({ req }) => {
  const user = userFromRequest(req.user)
  if (!user) return false
  if (user.role === 'admin') return true
  return { id: { equals: user.id } }
}

export const publicContentAccess: NonNullable<CollectionConfig['access']> = {
  read: () => true,
  create: authenticated,
  update: authenticated,
  delete: adminsOnly,
}

export const publicGlobalAccess: NonNullable<GlobalConfig['access']> = {
  read: () => true,
  update: authenticated,
}
