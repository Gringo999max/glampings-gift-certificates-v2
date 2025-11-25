import { FooterVariants } from './FooterVariants'

/**
 * Footer component - uses variant 5 (двухуровневый с яркими акцентами)
 * Features:
 * - Two-level design: white top + dark bottom
 * - Green border on top (4px)
 * - Decorative background circles
 * - Animated lines before links
 * - Large social media buttons (Telegram + VK)
 * - Auto-updating year range (2019–current year)
 */
export function Footer() {
  return <FooterVariants variant="v5" />
}

export default Footer