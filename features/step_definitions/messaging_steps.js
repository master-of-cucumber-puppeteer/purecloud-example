const { defineSupportCode } = require('cucumber')
const assert = require('assert')
const uuid = require('uuid')

const purecloudTools = require('../../util/purecloudTools')
const config = require('../../config')

config.load()

defineSupportCode(function({ Given, When, Then, And, setDefaultTimeout }) {

  setDefaultTimeout(10000)

  Given(/^I am a user logged into collaborate$/, async function () {
    const name = uuid.v4()
    const password = uuid.v4() + '!'
    const email = uuid.v4() + '@example.com'

    await purecloudTools.createUser({name, password, email})

    console.log('got past')

    await this.featureHelpers.login(email, password, config.data.ORG_NAME)
  })
})
