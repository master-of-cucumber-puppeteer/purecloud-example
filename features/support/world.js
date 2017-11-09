const { setWorldConstructor } = require('cucumber')
const featureHelpers = require('../../util/featureHelpers')

class CustomWorld {
  constructor () {
    this.browser = null
    this.page = null 
    this.featureHelpers = featureHelpers(this)

  }
}

setWorldConstructor(CustomWorld)
