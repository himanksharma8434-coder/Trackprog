---
name: Kinetic Glass
colors:
  surface: '#121317'
  surface-dim: '#121317'
  surface-bright: '#38393d'
  surface-container-lowest: '#0d0e12'
  surface-container-low: '#1a1b1f'
  surface-container: '#1e1f23'
  surface-container-high: '#292a2e'
  surface-container-highest: '#343539'
  on-surface: '#e3e2e7'
  on-surface-variant: '#c4c9ad'
  inverse-surface: '#e3e2e7'
  inverse-on-surface: '#2f3034'
  outline: '#8e9379'
  outline-variant: '#444933'
  surface-tint: '#add500'
  primary: '#ffffff'
  on-primary: '#293500'
  primary-container: '#c6f311'
  on-primary-container: '#576c00'
  inverse-primary: '#516600'
  secondary: '#adc6ff'
  on-secondary: '#002e69'
  secondary-container: '#4b8eff'
  on-secondary-container: '#00285c'
  tertiary: '#ffffff'
  on-tertiary: '#2e3039'
  tertiary-container: '#e1e1ed'
  on-tertiary-container: '#62646e'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#c6f311'
  primary-fixed-dim: '#add500'
  on-primary-fixed: '#171e00'
  on-primary-fixed-variant: '#3d4d00'
  secondary-fixed: '#d8e2ff'
  secondary-fixed-dim: '#adc6ff'
  on-secondary-fixed: '#001a41'
  on-secondary-fixed-variant: '#004493'
  tertiary-fixed: '#e1e1ed'
  tertiary-fixed-dim: '#c5c6d1'
  on-tertiary-fixed: '#191b23'
  on-tertiary-fixed-variant: '#454650'
  background: '#121317'
  on-background: '#e3e2e7'
  surface-variant: '#343539'
typography:
  display-lg:
    fontFamily: Montserrat
    fontSize: 48px
    fontWeight: '800'
    lineHeight: 56px
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '700'
    lineHeight: 40px
  headline-lg-mobile:
    fontFamily: Montserrat
    fontSize: 28px
    fontWeight: '700'
    lineHeight: 34px
  headline-md:
    fontFamily: Montserrat
    fontSize: 24px
    fontWeight: '600'
    lineHeight: 32px
  body-lg:
    fontFamily: Inter
    fontSize: 18px
    fontWeight: '400'
    lineHeight: 28px
  body-md:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: 24px
  label-md:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '600'
    lineHeight: 20px
    letterSpacing: 0.05em
  label-sm:
    fontFamily: Inter
    fontSize: 12px
    fontWeight: '500'
    lineHeight: 16px
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  container-padding-mobile: 20px
  container-padding-desktop: 40px
  gutter: 16px
  stack-gap-sm: 12px
  stack-gap-md: 24px
  stack-gap-lg: 48px
---

## Brand & Style
The design system is built for a high-performance workout environment, prioritizing energy, focus, and premium engineering. The brand personality is **Modern-Athletic**: a fusion of intense physical effort and high-tech data precision.

The visual style utilizes **Glassmorphism** as its core structural driver. By layering translucent, frosted surfaces over deep, high-contrast backgrounds, the UI achieves a sense of depth and sophistication without feeling heavy. High-energy accents provide the "spark" necessary to motivate users during intense sessions. The emotional response should be one of "controlled power"—clean, organized, yet undeniably vibrant.

## Colors
The palette is rooted in a deep **Charcoal/Navy (#12141C)** background to minimize eye strain and maximize the "pop" of data visualizations. 

- **Primary (Neon Lime):** Used exclusively for calls to action, active states, and critical performance metrics. It represents energy and "go" time.
- **Secondary (Electric Blue):** Used for secondary interactive elements, progress tracking, and informative accents.
- **Glass Surfaces:** Semi-transparent whites (10-15% opacity) with heavy background blurs create the "containers" for content.
- **Success/Warning:** Standard green/red are tuned to high-vibrancy "neon" variants to maintain the aesthetic consistency.

## Typography
The system employs a high-contrast typographic pairing. **Montserrat** is used for headlines to convey a bold, geometric, and authoritative tone. It should be used in heavy weights (600+) for maximum impact.

**Inter** handles all functional and body text. Its neutral, systematic nature ensures that complex workout data (sets, reps, weights) remains highly legible even at small sizes. Use **Label-MD** for section headers and button text to provide a technical, organized feel through uppercase styling and slight letter spacing.

## Layout & Spacing
This design system utilizes a **fluid grid** with generous internal padding to create a sense of "breathability" amidst high-intensity data. 

- **Grid:** A 12-column grid on desktop, scaling down to a 4-column grid on mobile. 
- **Rhythm:** An 8px base unit drives all spacing.
- **Glass Margins:** Containers should have a minimum of 24px internal padding to ensure the frosted edges don't crowd the content.
- **Vertical Rhythm:** Large "Stack Gaps" (48px+) should be used to separate distinct workout blocks or training days, ensuring the user can clearly distinguish between different parts of their routine.

## Elevation & Depth
Elevation is not conveyed through traditional black shadows, but through **Tonal Stacking and Backdrop Blurs**.

1.  **Level 0 (Base):** Deep Charcoal background.
2.  **Level 1 (Cards):** 10% white opacity fill, 20px Backdrop Blur, 1px subtle white inner-border (top/left) to simulate a light source reflecting on glass edges.
3.  **Level 2 (Modals/Popovers):** 20% white opacity fill, 40px Backdrop Blur, and a soft, wide outer glow in the primary color (Neon Lime) with very low opacity (5-10%) to suggest "active focus."
4.  **Interactive States:** Elements should "brighten" rather than "rise" when hovered or pressed, increasing the opacity of the glass layer.

## Shapes
The shape language is **Rounded**, balancing the aggressive typography with approachable, modern containers. 

- **Primary Containers:** 1rem (16px) corner radius.
- **Secondary Elements (Buttons/Inputs):** 0.5rem (8px) corner radius.
- **Data Tags/Chips:** Full pill-shape (capsule) for maximum distinction from square-ish content blocks.
- **Visual Continuity:** All glass containers must use the same radius to maintain a structural "grid" feeling.

## Components
- **Buttons:** Primary buttons are solid Neon Lime with black text. Secondary buttons are "Glass Buttons" with a 1px border and white text.
- **Workout Cards:** Use the Level 1 Elevation glass effect. Include a 4px vertical accent bar on the left edge in the primary color to indicate "current" or "active" status.
- **Input Fields:** Semi-transparent dark fills (5% white) with a 1px bottom-border. On focus, the bottom border glows in the secondary Electric Blue.
- **Chips:** Small pill-shaped containers with a low-opacity Electric Blue background and white text for labels like "Strength," "Cardio," or "Completed."
- **Progress Rings:** Use thick strokes (8px+) for progress indicators. Use a gradient from Secondary Blue to Primary Lime to show "energy building" as the user nears completion.
- **Activity Feed:** Minimalist list items separated by thin, 5% white lines. Avoid heavy boxes; let the glass containers hold the entire group.