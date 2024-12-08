*** Settings ***
Documentation     Common keywords and utilities for test automation
Library           SeleniumLibrary
Library           Collections
Resource           ../VARIABLES/Globals.resource


*** Keywords ***
Open Browser To Application
    [Documentation]    Opens the browser and sets up Selenium
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}
    Set Selenium Speed    0.1s

# Clean Up And Close Browser
#     [Documentation]    Performs cleanup and closes the browser
#     Run Keyword And Ignore Error    Delete All Created Categories
#     Run Keyword And Ignore Error    Delete All Created Certifications
#     Close All Browsers

Login To Application
    [Arguments]    ${username}    ${password}
    [Documentation]    Performs login with given credentials
    Wait Until Element Is Visible    ${LOGIN_FORM}
    Wait Until Element Is Visible    ${USERNAME_INPUT}
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Password    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_BUTTON}
    Wait Until Element Is Not Visible    ${LOADING_SPINNER}
    Wait Until Location Is    ${DASHBOARD_URL}

Generate Random String
    ${random}=    Evaluate    ''.join([chr(random.randint(65, 90)) for _ in range(8)])    random
    RETURN        Test_${random}
Wait For Success Message
    [Arguments]    ${expected_message}
    Page Should Contain            ${expected_message}

Wait For Error Message
    [Arguments]    ${expected_message}
    Page Should Contain          ${expected_message}

Success Message Should Be Visible
    [Arguments]    ${expected_message}
    Page Should Contain            ${expected_message}

Wait For Ajax
    Wait For Condition    return jQuery.active == 0    timeout=${TIMEOUT}

Wait Until Location Is
    [Arguments]    ${expected_url}
    Wait Until Keyword Succeeds    ${TIMEOUT}    1s    Location Should Be    ${expected_url}

Retry On Failure
    [Arguments]    ${keyword}    @{arguments}
    Wait Until Keyword Succeeds    3x    2s    Run Keyword    ${keyword}    @{arguments}

Scroll Down
    Execute JavaScript            window.scrollBy(0, 200)
Scroll The Hieght of scroll
    Execute JavaScript            window.scrollTo(0, document.body.scrollHeight)

UPLOAD FILE 
    [Arguments]                              ${UPLOAD_FILE_FIELD}    ${UPLOAD_FILE_INPUT}         ${FILE_NAME}
    Wait Until Element Is Visible            ${UPLOAD_FILE_FIELD}
    Choose File                              ${UPLOAD_FILE_INPUT}    ${FILE_NAME}

Select Resource
    [Arguments]      ${category_name}
    Mouse Over    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${category_name}')]

Click Edit Resource Button
    [Arguments]                             ${category_name}
    Wait Until Keyword Succeeds    3x    2s    Run Keywords
    ...    Select Resource                  ${category_name}    AND
    ...    Wait Until Element Is Visible    xpath=//div[@class='settings-icon-input__content']//p[contains(text(),'${category_name}')]//following::i[@class='edit'][1]    AND
    ...    Click Edit Using JS              ${category_name}
  
Click Edit Using JS
    [Arguments]    ${category_name}
    ${element}=    Get WebElement    xpath=//div[@class='settings-icon-input__content']//p[contains(text(),'${category_name}')]//following::i[@class='edit'][1]
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${element}

Click Delete Using JS
    [Arguments]    ${resource_name}
    ${element}=    Get WebElement    xpath=//div[@class='settings-icon-input__content']//p[contains(text(),'${resource_name}')]//following::i[@class='delete'][1]
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${element}


Click Delete Resource Button
    [Arguments]                             ${resource_name}
    Wait Until Keyword Succeeds    3x    2s    Run Keywords
    ...    Select Resource                  ${resource_name}    AND
    ...    Wait Until Element Is Visible    xpath=//div[@class='settings-icon-input__content']//p[contains(text(),'${resource_name}')]//following::i[@class='delete'][1]    AND
    ...    Click Delete Using JS              ${resource_name}

Confirm Delete Action
    Wait Until Element Is Visible            ${DELETE_CONFIRMATION_MODAL}
    Wait Until Element Is Enabled            ${DELETE_CONFIRMATION_CHECKBOX}
    Click Element                            ${DELETE_CONFIRMATION_CHECKBOX}
    Click Element                            ${MODAL_DELETE_BUTTON}

Input Text Into Hidden Field
    [Arguments]    ${xpath}    ${value}
    ${element}=    Get WebElement    xpath=${xpath}
    Execute JavaScript    arguments[0].value = arguments[1];    ARGUMENTS    ${element}    ${value}
    Execute JavaScript    arguments[0].dispatchEvent(new Event('input', { 'bubbles': true }));    ARGUMENTS    ${element}

Verify Filter Results
    [Arguments]    ${expected_result}    ${unwanted_result}=${EMPTY}
    Wait Until Page Contains    ${expected_result}    timeout=15s
    sleep     2s
    Run Keyword If             '${unwanted_result}' != '${EMPTY}'    Page Should Not Contain    ${unwanted_result}    message=Page should not contain '${unwanted_result}'