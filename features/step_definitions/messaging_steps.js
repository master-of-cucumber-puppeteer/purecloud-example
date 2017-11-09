const { defineSupportCode } = require('cucumber')
const assert = require('assert')
const uuid = require('uuid')

const purecloudTools = require('../../util/purecloudTools')
const config = require('../../config')

config.load()

defineSupportCode(function({ Given, When, Then, And, setDefaultTimeout }) {

  setDefaultTimeout(30000)

  let firstUser;
  let secondUser;

  Given(/^I am (a user|an agent) logged into collaborate$/, async function (userOrAgentStr) {
    const name = firstUser = uuid.v4()
    const password = 'A1234!' + uuid.v4()
    const email = uuid.v4() + '@example.com'
    const user = await purecloudTools.createUser({name, password, email})
    await this.featureHelpers.login(email, password, config.data.ORG_NAME)
    if (userOrAgentStr === 'an agent') {
      console.log(await purecloudTools.getRoleId(config.data.ORG_NAME, 'Engage User'))
    }
  })

  Given('a second user logs into collaborate', async function () {
    const name = secondUser = uuid.v4()
    const password = 'A1234!' + uuid.v4()
    const email = uuid.v4() + '@example.com'    
    const user = await purecloudTools.createUser({name, password, email})
    await this.featureHelpers.loginAsSecondUser(email, password, config.data.ORG_NAME)
  })

  Then('I message the second user as the first user', async function() {
    await this.page.waitForSelector('.search-query', 5000);
    await this.page.type('.search-query', secondUser);
    await this.page.waitForSelector('.btn-chat .pc-chat', 5000);
    await this.page.click('.btn-chat .pc-chat');
    await this.page.waitForSelector('.message-input', 5000);
    await this.page.type('.message-input', 'message');
    await this.page.keyboard.down('Enter');
    await this.page.waitForSelector('.message-container', 5000);

    const selector = '.message-container';
    const classAttribute = await this.page.evaluate((selector) => {
			return document.querySelector(selector).getAttribute('class')
		}, selector);

		assert(classAttribute.includes('message'));
  })

  Then('the second user should get the message', async function () {
    const page = this.secondBrowserPage;
    
    await page.waitForSelector('.navbar-icon.icon-chat-alpha', 5000);
    await page.waitForSelector('.message-container', 5000);

    const selector = '.message-container';
    const classAttribute = await this.page.evaluate((selector) => {
			return document.querySelector(selector).getAttribute('class')
		}, selector);

		assert(classAttribute.includes('message'));
  })
})
