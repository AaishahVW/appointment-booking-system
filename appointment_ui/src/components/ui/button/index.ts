import type { VariantProps } from 'class-variance-authority'
import { cva } from 'class-variance-authority'

export { default as Button } from './Button.vue'

export const buttonVariants = cva(
  'inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-3xl font-semibold transition-all disabled:pointer-events-none disabled:text-foreground-disabled [&_svg]:pointer-events-none [&_svg:not([class*=\'size-\'])]:size-4 shrink-0 [&_svg]:shrink-0 focus-visible:outline-2 outline-primary outline-offset-2 [&>_.mdi]:text-[24px]!',
  {
    variants: {
      variant: {
        filled:
          'bg-primary text-on-primary hover:brightness-95 disabled:bg-background-disabled',
        outlined:
          'border bg-transparent border-primary text-primary hover:bg-primary/8 disabled:border-background-disabled',
        tonal:
          'bg-secondary-container text-on-secondary-container hover:brightness-95 disabled:bg-background-disabled',
        text: 'text-primary hover:bg-primary/8',
      },
      size: {
        default: 'h-12 px-7 has-[>svg]:px-4',
        xs: 'size-8 text-sm',
        sm: 'h-8 gap-1 px-4 has-[>svg]:px-2.5',
        icon: 'size-12',
      },
    },
    defaultVariants: {
      variant: 'filled',
      size: 'default',
    },
  },
)

export type ButtonVariants = VariantProps<typeof buttonVariants>
