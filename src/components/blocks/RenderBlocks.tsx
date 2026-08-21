import ExpandMoreIcon from '@mui/icons-material/ExpandMore'
import Accordion from '@mui/material/Accordion'
import AccordionDetails from '@mui/material/AccordionDetails'
import AccordionSummary from '@mui/material/AccordionSummary'
import Box from '@mui/material/Box'
import Card from '@mui/material/Card'
import CardContent from '@mui/material/CardContent'
import Container from '@mui/material/Container'
import Grid from '@mui/material/Grid'
import Stack from '@mui/material/Stack'
import Typography from '@mui/material/Typography'

import type { Media, Page } from '../../payload-types'
import { AppButton } from '../ui/AppButton'
import { AppImage } from '../ui/AppImage'

type Block = Page['layout'][number]

function resolvedMedia(media: number | Media | null | undefined) {
  return typeof media === 'object' && media?.url ? media : null
}

function HeroSection({ block }: { block: Extract<Block, { blockType: 'hero' }> }) {
  const image = resolvedMedia(block.image)

  return (
    <Box component="section" sx={{ bgcolor: 'background.default', py: { xs: 7, md: 12 } }}>
      <Container maxWidth="lg">
        <Grid container spacing={6} sx={{ alignItems: 'center' }}>
          <Grid size={{ xs: 12, md: image ? 6 : 12 }}>
            {block.eyebrow && <Typography color="primary.main">{block.eyebrow}</Typography>}
            <Typography component="h1" variant="h2">
              {block.title}
            </Typography>
            {block.description && <Typography sx={{ mt: 2 }}>{block.description}</Typography>}
            {block.ctaLabel && block.ctaHref && (
              <AppButton href={block.ctaHref} sx={{ mt: 3 }}>
                {block.ctaLabel}
              </AppButton>
            )}
          </Grid>
          {image && (
            <Grid size={{ xs: 12, md: 6 }}>
              <AppImage
                alt={image.alt}
                src={image.url ?? ''}
                style={{ height: 'auto', width: '100%' }}
              />
            </Grid>
          )}
        </Grid>
      </Container>
    </Box>
  )
}

function ContentSection({ block }: { block: Extract<Block, { blockType: 'content' }> }) {
  return (
    <Container
      component="section"
      maxWidth="md"
      sx={{ py: { xs: 5, md: 8 }, textAlign: block.alignment }}
    >
      {block.heading && <Typography variant="h3">{block.heading}</Typography>}
      <Typography sx={{ mt: block.heading ? 2 : 0, whiteSpace: 'pre-line' }}>
        {block.body}
      </Typography>
    </Container>
  )
}

function MediaSection({ block }: { block: Extract<Block, { blockType: 'mediaBlock' }> }) {
  const media = resolvedMedia(block.media)
  if (!media) return null

  return (
    <Container component="figure" maxWidth="lg" sx={{ my: { xs: 5, md: 8 } }}>
      <AppImage alt={media.alt} src={media.url ?? ''} style={{ height: 'auto', width: '100%' }} />
      {block.caption && <Typography component="figcaption">{block.caption}</Typography>}
    </Container>
  )
}

function CardsSection({ block }: { block: Extract<Block, { blockType: 'cards' }> }) {
  return (
    <Container component="section" maxWidth="lg" sx={{ py: { xs: 5, md: 8 } }}>
      {block.heading && <Typography variant="h3">{block.heading}</Typography>}
      <Grid container spacing={3} sx={{ mt: 1 }}>
        {block.items.map((item) => {
          const image = resolvedMedia(item.image)
          return (
            <Grid key={item.id ?? item.title} size={{ xs: 12, sm: 6, md: 4 }}>
              <Card sx={{ height: '100%' }}>
                {image && (
                  <AppImage
                    alt={image.alt}
                    src={image.url ?? ''}
                    style={{ height: 'auto', width: '100%' }}
                  />
                )}
                <CardContent>
                  <Typography variant="h5">{item.title}</Typography>
                  {item.description && <Typography sx={{ mt: 1 }}>{item.description}</Typography>}
                  {item.href && (
                    <AppButton href={item.href} sx={{ mt: 2 }}>
                      Ver más
                    </AppButton>
                  )}
                </CardContent>
              </Card>
            </Grid>
          )
        })}
      </Grid>
    </Container>
  )
}

function AccordionSection({ block }: { block: Extract<Block, { blockType: 'accordion' }> }) {
  return (
    <Container component="section" maxWidth="md" sx={{ py: { xs: 5, md: 8 } }}>
      {block.heading && <Typography variant="h3">{block.heading}</Typography>}
      <Box sx={{ mt: 2 }}>
        {block.items.map((item) => (
          <Accordion key={item.id ?? item.question} disableGutters>
            <AccordionSummary expandIcon={<ExpandMoreIcon />}>
              <Typography component="h3" variant="h6">
                {item.question}
              </Typography>
            </AccordionSummary>
            <AccordionDetails>
              <Typography>{item.answer}</Typography>
            </AccordionDetails>
          </Accordion>
        ))}
      </Box>
    </Container>
  )
}

function CallToActionSection({ block }: { block: Extract<Block, { blockType: 'callToAction' }> }) {
  return (
    <Box component="section" sx={{ bgcolor: 'primary.main', color: 'primary.contrastText', py: 6 }}>
      <Container maxWidth="md">
        <Stack spacing={2} sx={{ alignItems: 'flex-start' }}>
          <Typography variant="h3">{block.heading}</Typography>
          {block.description && <Typography>{block.description}</Typography>}
          <AppButton color="secondary" href={block.href}>
            {block.label}
          </AppButton>
        </Stack>
      </Container>
    </Box>
  )
}

export function RenderBlocks({ blocks }: { blocks: Page['layout'] }) {
  return blocks.map((block) => {
    const key = block.id ?? `${block.blockType}-${block.blockName ?? ''}`
    switch (block.blockType) {
      case 'hero':
        return <HeroSection block={block} key={key} />
      case 'content':
        return <ContentSection block={block} key={key} />
      case 'mediaBlock':
        return <MediaSection block={block} key={key} />
      case 'cards':
        return <CardsSection block={block} key={key} />
      case 'accordion':
        return <AccordionSection block={block} key={key} />
      case 'callToAction':
        return <CallToActionSection block={block} key={key} />
    }
  })
}
