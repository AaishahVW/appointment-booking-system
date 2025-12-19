import type { VariantProps } from "class-variance-authority"
import { cva } from "class-variance-authority"

export { default as Button } from "./Button.vue"

export const buttonVariants = cva(
   'inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-3xl font-semibold transition-all disabled:pointer-events-none disabled:text-foreground-disabled [&_svg]:pointer-events-none [&_svg:not([class*=\'size-\'])]:size-4 shrink-0 [&_svg]:shrink-0 focus-visible:outline-2 outline-primary outline-offset-2 [&>_.mdi]:text-[24px]!',
  {
    variants: {
      variant: {
        filled:
          'bg-primary text-on-primary hover:brightness-95 disabled:bg-background-disabled',
        outline:
          'border bg-transparent border-primary text-primary hover:bg-primary/8 disabled:border-background-disabled',
        destructive:
          "bg-destructive text-white hover:bg-destructive/90 focus-visible:ring-destructive/20 dark:focus-visible:ring-destructive/40 dark:bg-destructive/60",
        secondary:
          "bg-secondary text-secondary-foreground hover:bg-secondary/80",
        ghost:
          "hover:bg-accent hover:text-accent-foreground dark:hover:bg-accent/50",
        link: "text-primary underline-offset-4 hover:underline",
      },
      size: {
        default: 'h-12 px-7 has-[>svg]:px-4',
        xs: 'size-8 text-sm',
        sm: 'h-8 gap-1 px-4 has-[>svg]:px-2.5',
        icon: 'size-12',
      },
    },
    defaultVariants: {
      variant: "filled",
      size: "default",
    },
  },
)
export type ButtonVariants = VariantProps<typeof buttonVariants>
