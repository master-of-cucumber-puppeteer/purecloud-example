module.exports = function (world) {
  return {
    login: async function (email, password, orgName) {
      await world.page.goto('http://apps.inindca.com')
      await world.page.waitForSelector('.advanced-login', 5000)
      await world.page.click('.advanced-login')
      await world.page.waitForSelector('.form-control.org-container', 5000)
      await world.page.type('.form-control.org-container', orgName)
      await world.page.click('.select-org')
      await world.page.waitForSelector('.form-control.email-container', 5000)
      await world.page.type('.form-control.email-container', email)
      await world.page.type('.form-control.password-container', password)
      await world.page.click('.btn-login')
    },

    loginAsSecondUser: async function (email, password, orgName) {
      
      await world.secondBrowserPage.goto('http://apps.inindca.com')
      await world.secondBrowserPage.waitForSelector('.advanced-login', 5000)
      await world.secondBrowserPage.click('.advanced-login')
      await world.secondBrowserPage.waitForSelector('.form-control.org-container', 5000)
      await world.secondBrowserPage.type('.form-control.org-container', orgName)
      await world.secondBrowserPage.click('.select-org')
      await world.secondBrowserPage.waitForSelector('.form-control.email-container', 5000)
      await world.secondBrowserPage.type('.form-control.email-container', email)
      await world.secondBrowserPage.type('.form-control.password-container', password)
      await world.secondBrowserPage.click('.btn-login')
    }
  }
}
