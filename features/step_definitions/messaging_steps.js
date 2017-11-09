const { defineSupportCode } = require('cucumber')
const assert = require('assert')
const uuid = require('uuid')

const purecloudTools = require('../../util/purecloudTools')
const config = require('../../config')

config.load()

defineSupportCode(function({ Given, When, Then, And, setDefaultTimeout }) {

  setDefaultTimeout(30000)

  Given(/^I am (a user|an agent) logged into collaborate$/, async function (userOrAgentStr) {
    const name = uuid.v4()
    const password = 'A1234!' + uuid.v4()
    const email = uuid.v4() + '@example.com'

    const user = await purecloudTools.createUser({name, password, email})

    console.log('got past')

    await this.featureHelpers.login(email, password, config.data.ORG_NAME)

    if (userOrAgentStr === 'an agent') {
      console.log(await purecloudTools.getRoleId(config.data.ORG_NAME, 'Engage User'))
    }
  })
})
