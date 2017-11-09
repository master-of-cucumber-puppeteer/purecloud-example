const puppeteer = require('puppeteer');

/**
 * Makes two browsers, sets the first browser as world.browser
 * Adds both into a hashmap, puts that hashmap in worlds
 * returns the modified worlds object
 */
module.exports = async function (world) {

    // Make first browser and page, add it to world
    const firstBrowser = await browsers.launch();
    const firstBrowserPage = await firstBrowser.newPage();
    world.browser = firstBrowser;
    world.page = firstBrowserPage;

    // Make second browser and page
    const secondBrowser = await browsers.launch();
    const secondBrowserPage = await firstBrowser.newPage();

    // Add the second through nth browser to the hashmap
    const browsers = {
        'second': { secondBrowser, secondBrowserPage }
    };

    const modifiedWorld = Object.assign({}, world, { browsers });
    return modifiedWorld;
}