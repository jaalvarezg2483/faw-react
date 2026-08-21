import type { Components, Theme } from '@mui/material/styles'

export const components: Components<Theme> = {
  MuiButton: {
    defaultProps: { disableElevation: true },
    styleOverrides: {
      root: { borderRadius: 8, minHeight: 44 },
    },
  },
  MuiTextField: {
    defaultProps: { fullWidth: true, variant: 'outlined' },
  },
  MuiLink: {
    defaultProps: { underline: 'hover' },
  },
  MuiAlert: {
    styleOverrides: {
      root: { borderRadius: 8 },
    },
  },
}
