import { getHomeContent } from '@/lib/content/get-home'
import { HomePage } from '@/components/home-page'

export const dynamic = 'force-dynamic'

export default async function HomeRoutePage() {
  const content = await getHomeContent()
  return <HomePage content={content} />
}
