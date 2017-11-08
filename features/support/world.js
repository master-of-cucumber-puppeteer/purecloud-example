const { setWorldConstructor } = require('cucumber')

class CustomWorld {
  constructor () {
    this.browser = null
    this.page = null
  }
}

setWorldConstructor(CustomWorld)
