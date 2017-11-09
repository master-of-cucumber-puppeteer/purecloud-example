const puppeteer = require('puppeteer');

/**
 * Makes two browsers, sets the first browser as world.browser
 * Adds both into a hashmap, puts that hashmap in worlds
 * returns the modified worlds object
 */
module.exports = async function() {

    // Make second browser and page
    const secondBrowser = await puppeteer.launch()
    const secondBrowserPage = await secondBrowser.newPage()

    // Add the second through nth browser to the hashmap
    const browsers = {
        'second': { secondBrowser, secondBrowserPage }
    };

    return browsers
}