const platformClient = require('purecloud-platform-client-v2')
const config = require('../config')

config.load()

module.exports = {
  loginAsAdminApp: function () {
    const client = platformClient.ApiClient.instance;
    client.setEnvironment('inindca.com')
    return client.loginClientCredentialsGrant(config.data.CLIENT_ID, config.data.CLIENT_SECRET)
  },
  createUser: async function (userBody) {
      await this.loginAsAdminApp()

      let apiInstance = new platformClient.UsersApi()
      return apiInstance.postUsers(userBody)
  }
}
