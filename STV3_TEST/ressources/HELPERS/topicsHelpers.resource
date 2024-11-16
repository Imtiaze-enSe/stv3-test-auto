*** Settings ***
Library            SeleniumLibrary
Library            OperatingSystem
Library            Collections
Resource           ../VARIABLES/topicsVariables.resource
Resource           ../VARIABLES/Globals.resource
Resource           common.resource


*** Keywords ***

Select Topic To Create Certificate
    [Arguments]      ${topic_name}
    Click Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${topic_name}')]

Click Add New Topic Button
    Wait Until Element Is Visible    ${ADD_TOPIC_BUTTON}
    Click Element                    ${ADD_TOPIC_BUTTON}

Input Topic Details
    [Arguments]    ${name}   
    Wait Until Element Is Visible        ${TOPIC_NAME_INPUT}
    Input Text    ${TOPIC_NAME_INPUT}     ${name}

Submit Topic Form
    Press Keys    none    ENTER
Create New Topic
    [Arguments]                   ${name}
    Input Topic Details           name=${name} 
    Submit Topic Form

Topic Should Exist In List
    [Arguments]    ${topic_name}
    Wait Until Page Contains Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${topic_name}')]

Topic Should Not Exist In List
    [Arguments]    ${topic_name}
    Wait Until Page Does Not Contain Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${topic_name}')]

    

