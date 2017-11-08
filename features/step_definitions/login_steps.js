const { defineSupportCode } = require('cucumber');
const assert = require('assert');

defineSupportCode(function({ Given, When, Then, And, setDefaultTimeout }) {

	setDefaultTimeout(10000);

	Given(/^I navigate to \"([^\"]*)\"$/, function(text) {
		return this.page.goto(text);
	});

	When(/^I type \"([^\"]*)\" into \"([^\"]*)\"$/, async function(text, selector) {
		await this.page.waitForSelector(selector, 5000);
		await this.page.type(selector, text);
	});

	When(/^I click \"([^\"]*)\"$/, async function(selector) {
		await this.page.waitForSelector(selector, 5000);
		await this.page.click(selector);
	});

	Then(/^\"([^\"]*)\" is contained in the class of the element with selector \"([^\"]*)\"$/, async function(text, selector) {
		await this.page.waitForSelector(`${selector}.${text}`, 10000);

		const classAttribute = await this.page.evaluate((selector) => {
			return document.querySelector(selector).getAttribute('class')
		}, selector);

		assert(classAttribute.includes(text));
	});
});
