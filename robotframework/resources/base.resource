*** Settings ***
Documentation  Base

Resource  common.resource


*** Keywords ***
Suite Setup Base
    [Documentation]  Suite Setup Base
    [Arguments]  ${SPEED_SELENIUM}=0.000    ${TIMEOUT_SELENIUM}=02    ${IMPLICIT_WAIT_SELENIUM}=05    ${LOG_LEVEL}=DEBUG
    BuiltIn.Import Library    SeleniumLibrary
    BuiltIn.Import Library    BuiltIn
    BuiltIn.Import Library    Collections
    BuiltIn.Import Library    DateTime
    BuiltIn.Import Library    OperatingSystem
    BuiltIn.Import Library    Process
    BuiltIn.Import Library    String
    BuiltIn.Import Library    Screenshot
    BuiltIn.Import Library    XML
    BuiltIn.Import Library    RequestsLibrary
    BuiltIn.Import Library    JSONLibrary
    SeleniumLibrary.Set Selenium Speed    ${SPEED_SELENIUM}
    SeleniumLibrary.Set Selenium Timeout    ${TIMEOUT_SELENIUM}
    SeleniumLibrary.Set Selenium Implicit Wait    ${IMPLICIT_WAIT_SELENIUM}
    BuiltIn.Set Log Level    ${LOG_LEVEL}
    BuiltIn.Set Suite Variable  ${SPEED_SELENIUM}
    BuiltIn.Set Suite Variable  ${TIMEOUT_SELENIUM}
    BuiltIn.Set Suite Variable  ${IMPLICIT_WAIT_SELENIUM}
    BuiltIn.Set Suite Variable  ${LOG_LEVEL}
