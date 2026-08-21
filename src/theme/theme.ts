'use client'

import { createTheme } from '@mui/material/styles'

import { breakpoints } from './breakpoints'
import { components } from './components'
import { palette } from './palette'
import { typography } from './typography'

export const theme = createTheme({
  cssVariables: true,
  palette,
  typography,
  breakpoints,
  spacing: 8,
  shape: { borderRadius: 8 },
  shadows: [
    'none',
    '0 1px 2px rgb(16 24 40 / 6%)',
    '0 2px 8px rgb(16 24 40 / 8%)',
    '0 4px 12px rgb(16 24 40 / 10%)',
    ...Array(21).fill('0 8px 24px rgb(16 24 40 / 12%)'),
  ] as ReturnType<typeof createTheme>['shadows'],
  components,
})
