export type MaintenancePlan = {
  id: string
  name: string
  imageUrl?: string
  imageUrl2?: string
}

export const maintenancePlans: MaintenancePlan[] = [
  {
    id: 'FA43',
    name: 'Tiger VH 4x4 4.3 T',
    imageUrl: '/cms/plans/fa43-1.png',
    imageUrl2: '/cms/plans/fa43-2.png',
  },
  {
    id: 'FA58',
    name: 'Tiger VH 5.8 T',
    imageUrl: '/cms/plans/fa58-1.png',
    imageUrl2: '/cms/plans/fa58-2.png',
  },
]
