const { defineSupportCode } = require('cucumber')
const puppeteer = require('puppeteer')

defineSupportCode(({ Before }) => {
  Before(async function () {
    const browser = this.browser = await puppeteer.launch({
      headless: false
    })
    this.page = await browser.newPage()
    
    const browser2 = this.browser2 = await puppeteer.launch({
      headless: false
    })
    this.secondBrowserPage = await browser2.newPage()
  })
})
