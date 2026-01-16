export { default as AlertDialog } from './AlertDialog.vue'
export { default as AlertDialogAction } from './AlertDialogAction.vue'
export { default as AlertDialogCancel } from './AlertDialogCancel.vue'
export { default as AlertDialogContent } from './AlertDialogContent.vue'
export { default as AlertDialogDescription } from './AlertDialogDescription.vue'
export { default as AlertDialogFooter } from './AlertDialogFooter.vue'
export { default as AlertDialogHeader } from './AlertDialogHeader.vue'
export { default as AlertDialogTitle } from './AlertDialogTitle.vue'
export { default as AlertDialogTrigger } from './AlertDialogTrigger.vue'

import { cva, type VariantProps } from 'class-variance-authority'

export const alertDialogHeaderVariants = cva(
  'flex flex-col text-2xl gap-2 bg-dim rounded-t-3xl -mx-6 p-6 -mt-6 [&_.mdi]:text-[1.5rem] [&_.mdi]:leading-[1]',
  {
    variants: {
      variant: {
        default:
          'bg-dim',
        error:
          '[&>svg]:text-on-error-container [&_.mdi]:text-on-error-container bg-error-container',
        warning:
          '[&>svg]:text-on-warning-container [&_.mdi]:text-on-warning-container bg-warning-container',
        info:
          '[&>svg]:text-on-info-container [&_.mdi]:text-on-info-container bg-info-container',
      },
    },
    defaultVariants: {
      variant: 'default',
    },
  },
)

export type AlertDialogHeaderVariants = VariantProps<typeof alertDialogHeaderVariants>
