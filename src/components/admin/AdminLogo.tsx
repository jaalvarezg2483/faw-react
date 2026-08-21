import Image from 'next/image'

export function AdminLogo() {
  return (
    <Image
      alt="FAW Trucks Grupo Purdy"
      height={80}
      src="/logos/faw-purdy.png"
      style={{ height: 'auto', maxHeight: 42, maxWidth: 240, width: 'auto' }}
      width={240}
    />
  )
}
