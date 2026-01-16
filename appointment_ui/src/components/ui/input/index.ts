import { cva } from 'class-variance-authority'

export { default as Input } from './Input.vue'

export const inputVariants = cva([
  'placeholder:text-gray-400 border-outline/40 flex h-12 w-full min-w-0 rounded-[12px] border bg-transparent px-4 py-1 text-base transition-[color,box-shadow] outline-none',
  'disabled:cursor-not-allowed disabled:opacity-50',
  'selection:bg-primary-container/40 dark:selection:bg-white/30 selection:text-foreground',
  'file:text-low-emphasis file:inline-flex file:items-center file:h-full file:pr-2 file:border-0 file:bg-transparent file:text-sm file:font-medium',
  'focus-visible:border-primary focus-visible:ring-primary focus-visible:ring-[3px]',
  'aria-invalid:ring-error/20 aria-invalid:border-error',
])
