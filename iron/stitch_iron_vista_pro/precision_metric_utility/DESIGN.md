---
name: Precision Metric Utility
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#3a3939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#bcc9c6'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#869491'
  outline-variant: '#3d4947'
  surface-tint: '#5ddacb'
  primary: '#5ddacb'
  on-primary: '#003732'
  primary-container: '#00a396'
  on-primary-container: '#00302c'
  inverse-primary: '#006a62'
  secondary: '#bcc7de'
  on-secondary: '#263143'
  secondary-container: '#3e495d'
  on-secondary-container: '#aeb9d0'
  tertiary: '#ffb59c'
  on-tertiary: '#5c1a00'
  tertiary-container: '#d87754'
  on-tertiary-container: '#521600'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#7cf6e7'
  primary-fixed-dim: '#5ddacb'
  on-primary-fixed: '#00201d'
  on-primary-fixed-variant: '#005049'
  secondary-fixed: '#d8e3fb'
  secondary-fixed-dim: '#bcc7de'
  on-secondary-fixed: '#111c2d'
  on-secondary-fixed-variant: '#3c475a'
  tertiary-fixed: '#ffdbcf'
  tertiary-fixed-dim: '#ffb59c'
  on-tertiary-fixed: '#380c00'
  on-tertiary-fixed-variant: '#7a2f12'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
typography:
  headline-lg:
    fontFamily: Inter
    fontSize: 32px
    fontWeight: '700'
    lineHeight: '1.2'
    letterSpacing: -0.02em
  headline-lg-mobile:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '700'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Inter
    fontSize: 20px
    fontWeight: '600'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Inter
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.5'
  body-sm:
    fontFamily: Inter
    fontSize: 14px
    fontWeight: '400'
    lineHeight: '1.5'
  data-display:
    fontFamily: Inter
    fontSize: 24px
    fontWeight: '600'
    lineHeight: '1'
    letterSpacing: -0.01em
  label-caps:
    fontFamily: Inter
    fontSize: 11px
    fontWeight: '700'
    lineHeight: '1'
    letterSpacing: 0.05em
  mono-label:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '400'
    lineHeight: '1.2'
rounded:
  sm: 0.125rem
  DEFAULT: 0.25rem
  md: 0.375rem
  lg: 0.5rem
  xl: 0.75rem
  full: 9999px
spacing:
  unit: 4px
  container-margin: 16px
  module-padding: 12px
  gutter: 8px
  stack-sm: 4px
  stack-md: 12px
  stack-lg: 24px
---

## Brand & Style
This design system is engineered for high-performance data consumption and professional utility. It prioritizes information density over decorative white space, catering to users who value precision, efficiency, and deep analytical insights. 

The aesthetic is **Ultra-Minimalist/Professional Utility**, characterized by a rigorous adherence to hierarchy and a "data-first" philosophy. The emotional response should be one of focused control—reminiscent of professional laboratory equipment or high-end financial terminals. By utilizing a "Dark Mode First" approach, we reduce eye strain during prolonged analysis and create a sophisticated, high-contrast environment where critical data points can surface without distraction.

## Colors
The palette is rooted in an absolute charcoal base (`#0A0A0A`) to ensure deep black levels and maximum contrast for text. 

- **Primary:** A muted Teal (`#00A396`) is used sparingly for primary actions, progress indicators, and "success" states. It provides a sophisticated focal point without the visual fatigue of neon.
- **Surface & Borders:** Depth is created through tonal layering rather than shadows. Surfaces use `#121212`, while thin, precise borders (`#262626`) define the boundaries of data modules.
- **Typography:** Pure white is reserved for headers and critical values, while a muted grey (`#A3A3A3`) is used for labels and secondary metadata to manage visual noise.

## Typography
We utilize **Inter** as the primary typeface for its exceptional legibility at small sizes and its neutral, systematic appearance. For technical values, timestamps, or secondary data labels, **JetBrains Mono** is introduced to evoke a sense of precision and "code-like" accuracy.

Large headlines use tight letter spacing and heavy weights to anchor sections. Body text is kept clean with ample line height. A specific `label-caps` style is used for table headers and categorizations to create clear separation between the "interface" and the "data."

## Layout & Spacing
The layout follows a strict **4px baseline grid**. Information density is prioritized, meaning margins and paddings are tighter than typical consumer apps (utilizing 12px and 16px constants rather than 24px+).

- **Desktop:** A fixed-width 12-column grid centered in the viewport, allowing for side-by-side data dashboards.
- **Mobile:** A single-column vertical stack with minimal lateral margins (16px) to maximize the "horizontal" real estate for charts and tables.
- **Modules:** Use a consistent 8px gutter between cards to create a "grid-like" feel that suggests modularity and order.

## Elevation & Depth
This system eschews traditional soft shadows in favor of **Tonal Layering and Micro-Borders**. 

1.  **Level 0 (Base):** `#0A0A0A` (The background).
2.  **Level 1 (Module):** `#121212` with a 1px solid border of `#262626`.
3.  **Level 2 (Active/Floating):** `#1E1E1E` with a very subtle backdrop blur (4px) and a slightly lighter border (`#333333`).

**Glassmorphism:** Reserved exclusively for navigation bars and overlay headers. Use a `10% white` fill with a `20px` background blur to provide context of the content scrolling underneath without sacrificing legibility.

## Shapes
In line with the "Professional Utility" aesthetic, shapes are kept disciplined and geometric. 
- **Standard Radius:** 4px (Soft) for all containers, buttons, and inputs. This provides just enough softness to feel modern while maintaining a sharp, efficient silhouette.
- **Interactive Elements:** Buttons maintain the same 4px radius. Avoid "pill" shapes entirely to maintain the serious, architectural tone of the design system.

## Components
- **Data Cards:** The core component. Cards should have no internal padding on the edges if they contain a graph, allowing the data visualization to bleed to the edges of the module. Header text inside cards uses the `label-caps` style.
- **Buttons:** 
  - *Primary:* Solid Teal (`#00A396`) with black text.
  - *Secondary:* Outline only (`#262626`) with white text.
  - *Ghost:* No border, muted grey text.
- **Inputs:** Darker than the surface (`#050505`) with a 1px border. Focus state is a simple Teal border—no glow.
- **Chips/Status:** Rectangular with 2px radius. Use highly desaturated versions of status colors (e.g., a very dark red for "Warning") to keep the UI from becoming too colorful.
- **Lists:** High-density rows (40px height) separated by thin 1px lines. Every row should be actionable or provide a clear data point.
- **Progress Bars:** Thin (4px height), using the Teal primary color against a dark track.