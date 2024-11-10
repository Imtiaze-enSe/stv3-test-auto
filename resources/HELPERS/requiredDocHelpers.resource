*** Settings ***
Documentation     Page objects and keywords for Required Documents
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Resource          ../VARIABLES/requiredDocVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource
Resource           categoriesHelpers.resource

*** Keywords ***
Navigate To Required Documents Section
    Navigate To Categories Section
    Wait Until Element Is Visible                           ${REQUIRED_DOC_TAB}
    Click Element                                           ${REQUIRED_DOC_TAB}  
    COMMON.Wait Until Location Is                           ${REQUIRED_DOC_PAGE_URL}
    sleep     2s
Click Add New Doc button
    Wait Until Element Is Enabled                           ${ADD_NEW_DOC_BTN} 
    Click Element                                           ${ADD_NEW_DOC_BTN}     

Fill out the Addition Form
    [Arguments]                             ${doc_name}
    Wait Until Element Is Visible           ${ADD_DOC_MODAL}
    Wait Until Element Is Enabled           ${DOC_TITLE_INPUT}
    Input Text                              ${DOC_TITLE_INPUT}     ${doc_name}  
    Choose File                             ${DOC_UPLOAD_INPUT}    ${PATH_TO_DOC_ICON} 
    Select Assign To Option                    Internal
    Verify Assign To Selection                  internal    
    Sleep    1s
Submit the Form
    Click Element                     ${DOC_SAVE_BTN}

Open Assign To Dropdown
    Click Element    ${ASSIGN_TO_DROPDOWN}

Select Assign To Option
    [Arguments]    ${option_text}
    Open Assign To Dropdown
    ${option_locator}=    Set Variable    xpath=//div[contains(text(), '${option_text}')]
    Wait Until Element Is Visible          ${option_locator}
    log                                    ${option_locator}
    Click Element                          ${option_locator}
    
Verify Assign To Selection
    [Arguments]    ${expected_value}
    ${actual_value}=    Get Element Attribute    ${ASSIGN_TO_HIDDEN_INPUT}    value
    Should Be Equal    ${actual_value}    ${expected_value}

Select Document By Name
    [Arguments]    ${doc_name}
    ${checkbox_locator}=    Set Variable    xpath=//table/tbody/tr[(td[4]='${doc_name}')]/td[1]/input[@type="checkbox"]
    Wait Until Element Is Visible           ${checkbox_locator}
    Click Element                           ${checkbox_locator}

Verify Delete Button Appears
    Wait Until Element Is Visible                    ${DELETE_DOC_BTN} 

Click Delete Button
    ${element}=    Get WebElement                               ${DELETE_DOC_BTN}
    Execute JavaScript    arguments[0].click();    ARGUMENTS    ${element}
 

Verify Confirmation Dialog
    [Arguments]    ${doc_name}
    Wait Until Element Is Visible                  ${CONFIRM_DIALOG}
    Element Should Contain                         ${CONFIRM_DIALOG}    ${doc_name}

Confirm Deletion
   Click Element                                   ${CONFIRM_BUTTON}
Delete Document After Confirmation
    Click Element                                  ${DELETE_BTN_IN_MODAL} 
                                    

Verify Document Deleted
    [Arguments]    ${doc_name}
    Wait Until Page Does Not Contain               ${doc_name}

Apply Search Filter
    [Arguments]    ${search_term}
    Input Text                                ${SEARCH_INPUT}    ${search_term}
    Click Button                              ${APPLY_FILTER_BUTTON}

Select Document Type
    [Arguments]      ${doc_type}
    Click Element    xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]
    ${option_locator}=    Set Variable     xpath=//div[contains(text(), '${doc_type}') and not(contains(text(), 'Foreign'))]
    Wait Until Element Is Visible          ${option_locator}     timeout=10s
    log                                    ${option_locator}
    Click Element                          ${option_locator}
    Click Button                           ${APPLY_FILTER_BUTTON}

Reset Filters
    Click Button                             ${RESET_FILTER_BUTTON}


                 