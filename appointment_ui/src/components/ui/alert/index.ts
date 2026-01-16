import type { VariantProps } from 'class-variance-authority'
import { cva } from 'class-variance-authority'

export { default as Alert } from './Alert.vue'
export { default as AlertDescription } from './AlertDescription.vue'
export { default as AlertTitle } from './AlertTitle.vue'
export { default as AlertAction } from './AlertAction.vue'

export const alertVariants = cva(
  `relative w-full rounded-lg px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*5)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg:not([class*='size-'])]:size-5 [&>svg]:text-current`,
  {
    variants: {
      variant: {
        info: 'bg-info-container [&>svg]:text-on-info-container',
        success: 'bg-success-container [&>svg]:text-on-success-container',
        warning: 'bg-warning-container [&>svg]:text-on-warning-container',
        error: 'bg-error-container [&>svg]:text-on-error-container',
        negative: 'bg-negative-container [&>svg]:text-on-negative-container',
      },
    },
    defaultVariants: {
      variant: 'info',
    },
  },
)

export type AlertVariants = VariantProps<typeof alertVariants>
