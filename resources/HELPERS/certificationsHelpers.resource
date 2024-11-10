*** Settings ***
Library           SeleniumLibrary
# Library           FakerLibrary
Resource         ../VARIABLES/certificationsVariables.resource
*** Keywords ***


Click Add New Certification Button
    Wait Until Element Is Visible    ${ADD_CERT_BUTTON}
    Click Element                    ${ADD_CERT_BUTTON}

Input Certification Details
    [Arguments]    ${name}   
    Wait Until Element Is Visible        ${CERT_NAME_INPUT}
    Input Text    ${CERT_NAME_INPUT}     ${name}

Submit Certification Form
    Press Keys    none    ENTER
Create New Certificate
    [Arguments]                   ${name}
    Input Certification Details    name=${name} 
    Submit Certification Form

Certification Should Exist In List
    [Arguments]    ${cert_name}
    Wait Until Page Contains Element    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${cert_name}')]
    
Certification Should Not Exist In List
    [Arguments]    ${cert_name}
    Wait Until Page Does Not Contain    xpath=//div[@class="settings-icon-input__content"]//p[contains(text(),'${cert_name}')]
