*** Settings ***
Documentation     Page objects and keywords for Categories management
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
# Library           FakerLibrary
Resource          ../VARIABLES/categoriesVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource

*** Keywords ***
Navigate To Categories Section
    Wait Until Element Is Visible    ${SIDEBAR_ELEMENT}
    Click Element                    ${SIDEBAR_ELEMENT}
    Wait Until Element Is Visible    ${SIDEBAR_COMPETENCE_LINK}         timeout=${TIMEOUT}
    Mouse Over                       ${SIDEBAR_COMPETENCE_LINK}
    Wait Until Element Is Visible    ${SIDEBAR_CATEGORIES_SETTINGS_LINK}
    Click Element                    ${SIDEBAR_CATEGORIES_SETTINGS_LINK}
    Wait Until Page Contains Element    ${CATEGORY_LIST}
    Click Element                    ${SIDEBAR_CROSS_ICON}

Click Add New Category Button
    Wait Until Element Is Visible    ${ADD_CATEGORY_BUTTON}
    Click Element                    ${ADD_CATEGORY_BUTTON}

Input Category Details
    [Arguments]    ${name}   
    Wait Until Element Is Visible     ${CATEGORY_NAME_INPUT}
    Input Text                        ${CATEGORY_NAME_INPUT}    ${name}
    # Input Text    ${CATEGORY_DESC_INPUT}    ${description}
Input Resource Details With Description
    [Arguments]    ${name}          ${path_to_icon}                             ${description}
    Wait Until Element Is Visible   ${CATEGORY_EDIT_NAME_INPUT}
    Empty Field Content             ${CATEGORY_EDIT_NAME_INPUT}
    Input Text                      ${CATEGORY_EDIT_NAME_INPUT}    ${name}
    Upload Resource Icon            ${path_to_icon} 
    Empty Field Content             ${CATEGORY_DESC_INPUT}
    Input Text                      ${CATEGORY_DESC_INPUT}         ${description}
Submit Category Form
    Press Keys    none    ENTER  

Empty Field Content
    [Arguments]      ${locator}
    Click Element    ${locator}
    Press Keys    none     CTRL+a
    Press Keys    none     DELETE

Upload Resource Icon
    [Arguments]                                  ${PATH_TO_ICON}
    File Should Exist                            ${PATH_TO_ICON}
    Wait Until Element Is Visible                ${CAT_ICON_UPLOAD_FIELD}
    UPLOAD FILE                                  ${CAT_ICON_UPLOAD_FIELD}      ${UPLOAD_CAT_ICON_INPUT}      ${PATH_TO_ICON}
    Wait Until Page Does Not Contain             Drag and drop your icon  timeout=4s

Submit Edit Resource Form
    Click Element    xpath=//button[contains(text(),'Save')]

Create New Category
    [Arguments]       ${name}
    Input Category Details    name=${name} 
    Submit Category Form

Category Should Exist In List
    [Arguments]    ${category_name}
    Wait Until Page Contains Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${category_name}')]

Category Should Not Exist In List
    [Arguments]    ${category_name}
    Wait Until Page Does Not Contain Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${category_name}')]


Select Category To Create Certificate
    [Arguments]      ${category_name}
    Click Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${category_name}')]

Edit Existing Category
    [Arguments]        ${updated_name}    ${updated_desc}
    Input Resource Details With Description    name=${updated_name}       path_to_icon=${PATH_TO_CAT_ICON}       description=${updated_desc}
    Submit Category Form

# Generate Fake Category Name
#     ${name}=    FakerLibrary.Company
#     [Return]    Category_${name}


