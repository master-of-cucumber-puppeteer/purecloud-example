const yaml = require('js-yaml')
const fs = require('fs')

module.exports = {
  data: {},
  load: function () {
    this.data = yaml.safeLoad(fs.readFileSync(require.resolve('../pcdwebk-org-app-config.yaml'), 'utf-8'))[0]
  }
}

// Docs:
// ```
// const config = require('./config')
// config.load()
//
// console.log(config.data.PCADMIN_EMAIL)
// ```
//
// > 'WebDirectoryTestAutomationAdminDoNotDelete@example.com'
