import type { Meta, StoryObj } from '@storybook/vue3'
import { Alert, AlertAction, AlertDescription, AlertTitle } from '.'
import { InfoIcon } from 'lucide-vue-next'

/**
 * Used to get the user’s attention. Callouts are typically placed inline with content and used multiple times in an application.
 */
const meta: Meta<typeof Alert> = {
  title: 'Components/Alert',
  component: Alert,
  subcomponents: { AlertTitle, AlertDescription },
  argTypes: {
    variant: {
      control: 'select',
      options: ['info', 'success', 'warning', 'error', 'negative'],
    },
  },
}

export default meta
type Story = StoryObj<typeof meta>

export const Default: Story = {
  render: args => ({
    components: { Alert, AlertTitle, AlertDescription },
    setup: () => ({ args }),
    template: `
      <Alert v-bind="args">
        <AlertTitle>Title</AlertTitle>
        <AlertDescription>Description</AlertDescription>
      </Alert>
    `,
  }),
  parameters: {
    docs: {
      source: {
        code: `
          <Alert variant="info">
            <AlertTitle>Title</AlertTitle>
            <AlertDescription>Description</AlertDescription>
          </Alert>
    `,
      },
    },
  },
}

/**
 * The component checks if an SVG exists within the content and adjusts the layout accordingly
 */
export const WithIcon: Story = {
  render: args => ({
    components: { Alert, AlertTitle, AlertDescription, InfoIcon },
    setup: () => ({ args }),
    template: `
      <Alert v-bind="args">
        <InfoIcon />
        <AlertTitle>Title</AlertTitle>
        <AlertDescription>Description</AlertDescription>
      </Alert>
    `,
  }),
  parameters: {
    docs: {
      source: {
        code: `
          <Alert variant="info">
            <InfoIcon />
            <AlertTitle>Title</AlertTitle>
            <AlertDescription>Description</AlertDescription>
          </Alert>
    `,
      },
    },
  },
}

export const DescriptionOnly: Story = {
  render: args => ({
    components: { Alert, AlertDescription, InfoIcon },
    setup: () => ({ args }),
    template: `
      <Alert v-bind="args">
        <InfoIcon />
        <AlertDescription>Description</AlertDescription>
      </Alert>
    `,
  }),
  parameters: {
    docs: {
      source: {
        code: `
          <Alert variant="info">
            <InfoIcon />
            <AlertDescription>Description</AlertDescription>
          </Alert>
    `,
      },
    },
  },
}

export const WithAction: Story = {
  render: args => ({
    components: { Alert, AlertTitle, AlertDescription, AlertAction, InfoIcon },
    setup: () => ({ args }),
    template: `
      <Alert v-bind="args">
        <InfoIcon />
        <AlertTitle>Title</AlertTitle>
        <AlertDescription class="whitespace-normal">
          Description
          <AlertAction>Action</AlertAction>
        </AlertDescription>
      </Alert>
    `,
  }),
  parameters: {
    docs: {
      source: {
        code: `
          <Alert variant="info">
            <InfoIcon />
            <AlertDescription>
              Description
              <AlertAction>Action</AlertAction>
            </AlertDescription>
          </Alert>
    `,
      },
    },
  },
}
