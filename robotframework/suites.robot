*** Settings ***
Library  SeleniumLibrary

Resource            ${CURDIR}/resources//base.resource

Suite Setup         Suite Setup Base
Suite Teardown      SeleniumLibrary.Close Browser


*** Variables ***
${HEADLESS_CHROME}      True  # False


*** Test Cases ***
Round 1: Element Interaction
    Launch Chrome Browser    https://demo.applitools.com/
    SeleniumLibrary.Input Text      id:username    andy
    SeleniumLibrary.Input Text      id:password    panda<3
    SeleniumLibrary.Click Element    id:log-in
    SeleniumLibrary.Wait Until Element Is Visible    xpath=(//*[contains(@class, 'element-header')])[1]
    ${text}=    SeleniumLibrary.Get Text    xpath=(//*[contains(@class, 'element-header')])[1]
    BuiltIn.Should Be Equal As Strings    ${text}    Financial Overview

Round 2: Inline Frames
    SeleniumLibrary.Go To        https://kitchen.applitools.com/ingredients/iframe
    SeleniumLibrary.Wait Until Element Is Visible   id:the-kitchen-table
    SeleniumLibrary.Select Frame   id:the-kitchen-table
    SeleniumLibrary.Page Should Contain Element    id:fruits-vegetables
    SeleniumLibrary.Unselect Frame

Round 3: Waiting
    SeleniumLibrary.Go To        https://automationbookstore.dev/
    SeleniumLibrary.Input Text      id:searchBar    testing
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//h2[contains(., 'Agile Testing')]
    SeleniumLibrary.Page Should Contain Element    xpath=//h2[contains(., 'Agile Testing')]

Round 4: Accept Alerts
    SeleniumLibrary.Go To        https://kitchen.applitools.com/ingredients/alert
    SeleniumLibrary.Click Element    id:alert-button
    SeleniumLibrary.Handle Alert    action=ACCEPT

Round 5: Dismiss Alerts
    SeleniumLibrary.Go To        https://kitchen.applitools.com/ingredients/alert
    SeleniumLibrary.Click Element    id:confirm-button
    SeleniumLibrary.Handle Alert    action=DISMISS

Round 6: Answer Prompts
    SeleniumLibrary.Go To        https://kitchen.applitools.com/ingredients/alert
    SeleniumLibrary.Click Element    id:prompt-button
    SeleniumLibrary.Handle Alert    action=ACCEPT

Round 7: Navigation to New Windows
    SeleniumLibrary.Go To        https://kitchen.applitools.com/ingredients/links
    SeleniumLibrary.Click Element    id:button-the-kitchen-table
    SeleniumLibrary.Switch Window    NEW
    SeleniumLibrary.Wait Until Element Is Visible    id:fruits-vegetables
    SeleniumLibrary.Page Should Contain Element    id:fruits-vegetables

Round 8: API Requests
    ${HEADER}    Create Dictionary    Content-type=application/json  User-Agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/50.0.2661.102 Safari/537.36
    ...  Accept=text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8
    ...  Accept-Language=fr,fr-FR;q=0.8,en-US;q=0.5,en;q=0.3
    ...  Accept-Encoding=gzip, deflate, br
    ...  Connection=keep-alive
    ...  Upgrade-Insecure-Requests=1
    ...  Pragma=no-cache
    ...  Cache-Control=no-cache
    RequestsLibrary.Create Session  Alias1  https://kitchen.applitools.com
    ${response}=  RequestsLibrary.GET On Session  Alias1    /api/recipes  headers=${HEADER}
    Should Be Equal As Strings    ${response.status_code}    200
    RequestsLibrary.Delete All Sessions
