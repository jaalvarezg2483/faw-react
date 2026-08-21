'use client'

import CircularProgress from '@mui/material/CircularProgress'

export function AppLoading({ label = 'Cargando' }: { label?: string }) {
  return <CircularProgress aria-label={label} color="primary" />
}
