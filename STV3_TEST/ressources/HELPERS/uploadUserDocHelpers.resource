*** Settings ***
Documentation     Page objects and keywords for Uploading users Documents
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           DateTime
Library           String
Resource          ../VARIABLES/uploadUserDocVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource

*** Keywords ***
Navigate to users page   
    [Arguments]                             ${username}             ${password}
    Login To Application                    ${username}             ${password}
    Wait Until Element Is Visible           ${SIDEBAR_ELEMENT}
    Click Element                           ${SIDEBAR_ELEMENT}
    Wait Until Element Is Visible           ${USERS_SIDEBAR_LINK}
    Click Element                           ${USERS_SIDEBAR_LINK}
    Wait Until Element Is Visible           ${USERS_PAGE_HEADER}
    Click Element                           ${SIDEBAR_CROSS_ICON}  

Select a User From the List
    [Arguments]                         ${USERS_SEARCH_BAR}        ${user_name}
    Search for a User                   ${USERS_SEARCH_BAR}         ${user_name}
    Click Element                       xpath=//tbody[1]/tr[1]/td[3]/div[1]/div[1]/p[1][contains(text(),'${user_name}')]  
    Wait Until Page Contains Element    ${USER_PROFILE_TAB}
Search for a User
    [Arguments]                                    ${USERS_SEARCH_BAR}    ${searched_user}  
    Input Text                                     ${USERS_SEARCH_BAR}    ${searched_user}  
    Click Element                                  ${APLLY_SEARCH_BTN}  
    Wait Until Element Is Visible                  xpath=//tbody[1]/tr[1]/td[3]/div[1]/div[1]/p[1][contains(text(),'${searched_user}')]

Go to Required Document Page
    Wait Until Element Is Visible                   ${REQUIRED_DOC_LINK}
    Click Element                                   ${REQUIRED_DOC_LINK}
    Wait Until Element Is Visible                   ${REQUIRED_DOC_PAGE_TITLE}

Go to Required Certificate Page
    Wait Until Element Is Visible                   ${REQUIRED_CERTIFICATE_LINK}
    Click Element                                   ${REQUIRED_CERTIFICATE_LINK}
    Wait Until Element Is Visible                   ${REQUIRED_CERTIFICATE_PAGE}
Select Current Day
    ${today}=    Get Current Date       
    ${tomorrow}=    Add Time To Date     ${today}    1 day    result_format=%d 
    ${tomorrow}=    Convert To Integer    ${tomorrow}   # Removes leading zero if present    
    ${day_xpath}=    Set Variable    //div[contains(@class, 'datepicker')]//button[text()='${tomorrow}'][not(@disabled)]
    Wait Until Element Is Visible    ${day_xpath}
    Sleep    1s
    Click Element    ${day_xpath}

Upload Document On behalf of User
    [Arguments]        ${required_doc}
    Wait Until Element Is Visible                xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]
    Choose File                                  xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]/following::input[@type="file"]        ${DOC_FILE_PATH}
    Wait Until Element Is Visible                ${UPLOAD_DOC_MODAL} 
    Wait Until Element Is Visible                ${DOC_DATE_FILED} 
    Click Element                                ${DOC_DATE_FILED} 
    Select Current Day
    Click Element                                ${SAVE_BTN}
    Sleep    3s

Verify That the Document is well Uploaded
    [Arguments]                        ${required_doc}
    Wait Until Element Is Visible      xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]        timeout=10s
    Scroll Element Into View           xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]
    Page Should Contain Element        xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]/following::img[@src="/assets/checkmark-cd1f4ad2.svg"] 
    Sleep    1s

Accept or Reject The Uploaded Document
    [Arguments]                        ${required_doc}            ${action_btn}
    Wait Until Element Is Visible      xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]        timeout=10s
    ${accept_btn} =     Set Variable   xpath=(//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]//following::button[@class="${action_btn}"])[1]
    Wait Until Element Is Visible      ${accept_btn}
    Scroll Element Into View           ${accept_btn}
    Click Element                      ${accept_btn}
    Wait Until Element Is Visible      ${MODAL_CONFIRMATION_TITLE}
    Wait Until Element Is Enabled      ${CONFIRM_BUTTON}
    Click Element                      ${CONFIRM_BUTTON}
    sleep     1s

Verify That the Document is well Rejected
    [Arguments]                        ${required_doc}
    Wait Until Element Is Visible      xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]        timeout=10s
    Scroll Element Into View           xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]
    Page Should Contain Element        xpath=//p[@class="document-card-header__info-title"][contains(text(),'${required_doc}')]/following::img[@src="/assets/close-54bdadc3.svg"] 
    Sleep    1s




    
