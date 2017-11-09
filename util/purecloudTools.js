const platformClient = require('purecloud-platform-client-v2')
const config = require('../config')

config.load()

module.exports = {
  loginAsAdminApp: function () {
    const client = platformClient.ApiClient.instance
    client.setEnvironment('inindca.com')
    return client.loginClientCredentialsGrant(config.data.CLIENT_ID, config.data.CLIENT_SECRET)
  },
  createUser: async function (userBody, isAgent) {
    await this.loginAsAdminApp()

    let apiInstance = new platformClient.UsersApi()
    return await apiInstance.postUsers(userBody)
  },
  createQueue: async function (userId, queueBody) {
    await this.loginAsAdminApp()

    let apiInstance = new platformClient.RoutingApi()
    await apiInstance.postRoutingQueues(queueBody)
  },
  getRoleId: async function (orgName, roleName) {
    await this.loginAsAdminApp()

    let apiInstance = new platformClient.AuthorizationApi()

    let continueLoop = true
    let roleList = []
    let page = 1
    const pageSize = 200
    while (continueLoop) {
      let body = {
        pageNumber: page,
        pageSize
      }
      let res = await apiInstance.getAuthorizationRoles(body)
      if (res.total < (pageSize * page)) continueLoop = false
    }
    return roleList
    for (role of roleList) {
        if (role.name === roleName) {
            return role.id
        }
    }
  }
}
