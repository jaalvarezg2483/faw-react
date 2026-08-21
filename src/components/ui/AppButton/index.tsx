'use client'

import Button, { type ButtonProps } from '@mui/material/Button'

export type AppButtonProps = ButtonProps

export function AppButton({ children, variant = 'contained', ...props }: AppButtonProps) {
  return (
    <Button variant={variant} {...props}>
      {children}
    </Button>
  )
}
