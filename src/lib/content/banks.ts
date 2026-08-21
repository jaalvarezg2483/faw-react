export type BankOption = {
  id: string
  name: string
  tasa: number
  plazos: number
  comision: number
  prima: number
  order: number
  fixedRateMonths: number
  imageUrl: string
  disclaimer: string
}

export const banks: BankOption[] = [
  {
    id: 'faw_cafsa',
    name: 'CAFSA',
    tasa: 8.5,
    plazos: 8,
    comision: 4.95,
    prima: 30,
    order: 1,
    fixedRateMonths: 96,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/purdy-cotizador.appspot.com/o/Banks%2Ffaw_cafsa%2Fimagen%2FcYMemRPhqVu98vCXEHps-kFXStfY9datbDZ6NQ3vG-cafsa-new-logo.png?alt=media&token=03b49317-9757-43dc-9cef-34e2b3d623f6',
    disclaimer:
      'Cuota corresponde a cálculo realizado en Leasing Operativo en Función Financiera, con tasa fija de CAFSA aplicable para los primeros 48 meses. \n\nPrimas desde el 10% para asalariados y 20% para trabajadores independientes. Cuotas calculadas con seguro aproximado. Las condiciones finales de financiamiento quedan sujetas a las políticas internas del comité de crédito. Aplican condiciones.',
  },
  {
    id: 'faw_facileasing',
    name: 'Facileasing',
    tasa: 9.95,
    plazos: 5,
    comision: 4.95,
    prima: 25,
    order: 2,
    fixedRateMonths: 60,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/purdy-cotizador.appspot.com/o/Banks%2Ffaw_facileasing%2Fimagen%2FWkegOlrqibykAZJpsXAI-facileasing.png?alt=media&token=9aacabdc-d129-4419-950a-24fbdd6b99f8',
    disclaimer:
      '**Cuota corresponde al cálculo realizado con tasa fija de Facileasing aplicable por 3 años valida hasta el 31 de mayo 2026. Esta cuota es un aproximado y no incluye monto de Seguro. Para confirmar la cuota final, podés consultar con un asesor de ventas.',
  },
  {
    id: 'faw_bn',
    name: 'Banco Nacional',
    tasa: 10.7,
    plazos: 8,
    comision: 3.25,
    prima: 20,
    order: 3,
    fixedRateMonths: 96,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/purdy-cotizador.appspot.com/o/Banks%2Ffaw_bn%2Fimagen%2Fz7I6EaDPuwqRwHCwTjK7-bn.png?alt=media&token=33f7f682-bf06-4000-bbbf-46a99302c13f',
    disclaimer:
      '* Los precios aquí indicados son únicamente de referencia. No incluyen el costo del seguro, el cual podrá variar según las condiciones de cada modelo o cliente. Consultá con nuestros asesores para obtener un presupuesto final.',
  },
  {
    id: 'faw_bac',
    name: 'BAC',
    tasa: 9.25,
    plazos: 8,
    comision: 3.5,
    prima: 20,
    order: 4,
    fixedRateMonths: 96,
    imageUrl:
      'https://firebasestorage.googleapis.com/v0/b/purdy-cotizador.appspot.com/o/Banks%2Ffaw_bac%2Fimagen%2FFKfGEPbHOvUvfYyeC119-BAC.png?alt=media&token=3d04180e-19f6-41f1-b15f-c8deaccce1c7',
    disclaimer:
      '* Los precios aquí indicados son únicamente de referencia. No incluyen el costo del seguro, el cual podrá variar según las condiciones de cada modelo o cliente. Consultá con nuestros asesores para obtener un presupuesto final.',
  },
]

export function formatMoney(value: number): string {
  const rounded = Math.round(value)
  return `$${rounded.toString().replace(/\B(?=(\d{3})+(?!\d))/g, '.')}`
}

export function formatQuota(value: number): string {
  const safe = Number.isFinite(value) ? value : 0
  const [int = '0', frac = '00'] = safe.toFixed(2).split('.')
  return `$${int.replace(/\B(?=(\d{3})+(?!\d))/g, '.')}.${frac}`
}

export function estimateQuota(price: number, bank: BankOption, primaAmount?: number): number {
  const minPrima = price * (bank.prima / 100)
  const down = primaAmount == null ? minPrima : primaAmount
  const principal = Math.max(price - down, 0) * (1 + bank.comision / 100)
  const monthlyRate = bank.tasa / 100 / 12
  const months = bank.plazos * 12
  if (monthlyRate === 0) return principal / months
  const factor = Math.pow(1 + monthlyRate, months)
  return (principal * monthlyRate * factor) / (factor - 1)
}
