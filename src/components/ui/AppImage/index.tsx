import Image from 'next/image'
import type { ComponentProps } from 'react'

type NativeImageProps = Omit<ComponentProps<'img'>, 'height' | 'src' | 'width'>

export type AppImageProps = NativeImageProps & {
  src: string
  width?: number
  height?: number
}

/**
 * Corporate image primitive. It keeps the migrated site's CSS sizing while
 * routing image rendering through Next.js. `unoptimized` preserves external
 * and CMS URLs until the final Azure image loader/CDN policy is available.
 */
export function AppImage({ alt = '', height = 900, src, width = 1600, ...props }: AppImageProps) {
  return <Image alt={alt} height={height} src={src} unoptimized width={width} {...props} />
}
