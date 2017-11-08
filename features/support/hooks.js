const { defineSupportCode } = require('cucumber')

const puppeteer = require('puppeteer')

defineSupportCode(({ Before }) => {
  Before(async function () {
    const browser = this.browser = await puppeteer.launch({
      headless: false
    })
    this.page = await browser.newPage();
  })
})
