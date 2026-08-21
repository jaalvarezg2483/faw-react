import type { PaletteOptions } from '@mui/material/styles'

export const palette: PaletteOptions = {
  mode: 'light',
  primary: {
    main: '#003C90',
    dark: '#012C92',
    contrastText: '#FFFFFF',
  },
  secondary: {
    main: '#2F333D',
    contrastText: '#FFFFFF',
  },
  background: {
    default: '#FFFFFF',
    paper: '#F1F4F8',
  },
  text: {
    primary: '#2F333D',
    secondary: '#5D6470',
  },
  error: { main: '#B42318' },
  warning: { main: '#B54708' },
  info: { main: '#175CD3' },
  success: { main: '#027A48' },
}
