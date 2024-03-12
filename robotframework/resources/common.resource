*** Settings ***
Documentation  Common

Library  OperatingSystem
Library  SeleniumLibrary


*** Keywords ***
Launch Chrome Browser
    [Documentation]  Settings to Launch Chrome Browser
    [Arguments]  ${URL}
    ${chrome_options}  Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    IF  '${HEADLESS_CHROME}'=='True'
        Call Method  ${chrome_options}  add_argument    --no-sandbox
        Call Method  ${chrome_options}  add_argument    --disable-gpu
        Call Method  ${chrome_options}  add_argument    --headless
        Call Method  ${chrome_options}  add_argument    --start--maximized
        Call Method  ${chrome_options}  add_argument    --window-size\=1800,1400
        Call Method  ${chrome_options}  add_argument    --disable-dev-shm-usage
        Call Method  ${chrome_options}  add_argument    --disable-software-rasterizer
        Call Method  ${chrome_options}  add_argument    --ignore-certificate-errors
        Call Method  ${chrome_options}  add_argument    --disable-extensions
    END

    SeleniumLibrary.Open Browser    ${URL}    Chrome  options=${chrome_options}
    SeleniumLibrary.Maximize Browser Window
