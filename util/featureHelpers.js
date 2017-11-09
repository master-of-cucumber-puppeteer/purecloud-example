module.exports = function (world) {
  return {
    login: async function (email, password, orgName) {

      await world.page.goto('http://apps.inindca.com')
      console.log('advanced login')
      await world.page.waitForSelector('.advanced-login', 5000)
      console.log('past again')
      await world.page.click('.advanced-login')

      console.log('org input')
      await world.page.waitForSelector('.form-control.org-container', 5000)
      await world.page.type('.form-control.org-container', orgName)

      await world.page.click('.select-org')

      console.log('email input')
      await world.page.waitForSelector('.form-control.email-container', 5000)
      await world.page.type('.form-control.email-container', email)

      console.log('password input')
      await world.page.type('.form-control.password-container', password)

      console.log('clicking button')
      await world.page.click('.btn-login')
    }
  }
}
