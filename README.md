# E2E Testing Demo

## [![][gh-stars-robotframework]][gh-robotframework] Robot Framework - 8 tests demo - 00:12 seconds

 - https://robotframework.org/
 - Python
 - Acceptance Testing
 - Robot is a Python framework used for acceptance/functional testing. 
 - Robot is an automated test framework which has a simple plain text syntax and can be extended easily with Python or Java libraries.

To run the tests:
```sh
pip install -r requirements.txt
cd robotframework
robot -d ouputs suites.robot
```

## [![][gh-stars-playwright]][gh-playwright] Playwright - 8 tests demo - 00:10 seconds

 -  https://playwright.dev 
 -  Supports multiple languages such as JavaScript, Java, Python, and .NET C#
 -  End-to-End Testing
 -  Test across all modern browsers. 
 -  Use in your preferred language. 
 -  Single API to automate Chromium, Firefox and WebKit. 
 -  Use the Playwright API in JavaScript & TypeScript, Python, .NET and, Java.

To run the tests:
```sh
cd playwright
npm install
npx playwright install
npx playwright test
npx playwright show-report
```

## [![][gh-stars-cypress]][gh-cypress] Cypress - 8 tests demo - 00:22 seconds

 -  https://www.cypress.io/ 
 -  JavaScript, TypeScript
 -  End-to-End Testing

To run the tests:

```sh
cd cypress
npm install
npx cypress run
```


<!-- -->
[gh-robotframework]: https://github.com/robotframework/robotframework
[gh-stars-robotframework]: https://img.shields.io/github/stars/robotframework/robotframework?label=%F0%9F%8C%9F
[gh-playwright]: https://github.com/microsoft/playwright
[gh-stars-playwright]: https://img.shields.io/github/stars/microsoft/playwright?label=%F0%9F%8C%9F
[gh-cypress]: https://github.com/cypress-io/cypress
[gh-stars-cypress]: https://img.shields.io/github/stars/cypress-io/cypress?label=%F0%9F%8C%9F