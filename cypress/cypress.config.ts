import { defineConfig } from 'cypress'

export default defineConfig({
  // setupNodeEvents can be defined in either
  // the e2e or component configuration
  e2e: {
    setupNodeEvents(on, config) {
      const _ = require('lodash') // yup, dev dependencies
      const path = require('path') // yup, core node library
      const debug = require('debug') // yup, dependencies
      // const User = require('./lib/models/user') // yup, relative local modules

      console.log(__dirname)
      console.log(process.cwd())
    },
  },
})
