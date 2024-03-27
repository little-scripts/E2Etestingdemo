# E2Etestingdemo

## Robot Framework - 8 tests - Elapsed time: 00:12 seconds

 - https://robotframework.org/
 - Python
 - Acceptance Testing
 - Robot is a Python framework used for acceptance/functional testing. 
 - Robot is an automated test framework which has a simple plain text syntax and can be extended easily with Python or Java libraries. 
 - It can run on the .net-based IronPython and on Jython which is Java based.

To run the tests:
```sh
pip install -r requirements.txt
robot -d ouputs suites.robot
```

## Playwright - 8 tests - Elapsed time: 00:10 seconds

 -  https://playwright.dev
 -  Supports multiple languages such as JavaScript, Java, Python, and .NET C#
 -  End-to-End Testing
 -  Test across all modern browsers. 
 -  Use in your preferred language. 
 -  Single API to automate Chromium, Firefox and WebKit. 
 -  Use the Playwright API in JavaScript & TypeScript, Python, .NET and, Java.

To run the tests:
```sh
npm install
npx playwright install
npx playwright test
npx playwright show-report
```

## Cypress - 8 tests - Elapsed time: 00:22 seconds

 -  https://www.cypress.io/
 -  JavaScript, TypeScript
 -  End-to-End Testing

To run the tests:

```sh
$ npm install
$ npx cypress run
```