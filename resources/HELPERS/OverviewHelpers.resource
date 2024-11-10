*** Settings ***
Documentation     Page objects and keywords for Required Documents
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           String
Resource          ../VARIABLES/OverviewVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource

*** Keywords ***
Navigate to Overview page
    Login To Application                     ${VALID_USERNAME}    ${VALID_PASSWORD}
    Wait Until Element Is Visible            ${SIDEBAR_ELEMENT}
    Click Element                            ${SIDEBAR_ELEMENT}
    Wait Until Element Is Visible            ${SIDEBAR_COMPETENCE_LINK}
    Click Element                            ${SIDEBAR_COMPETENCE_LINK}
    Wait Until Element Is Visible            ${OVERVIEW_PAGE_TITLE}
    Click Element                            ${SIDEBAR_CROSS_ICON}

Apply Search Filter
    [Arguments]                               ${search_term}
    Input Text                                ${SEARCH_BAR}            ${search_term}
    Wait Until Element Is Visible             ${APPLY_FILTER_BUTTON}
    Click Button                              ${APPLY_FILTER_BUTTON}

Check Search Result
    [Arguments]                      ${search_result}
    Page Should Contain Element      xpath=//tbody[1]/tr[1]/td[1]/div[1]/div[2]/div[1]/div[1]/p[1][contains(text(), '${search_result}')]

Reset Filters
    Wait Until Element Is Visible            ${RESET_FILTER_BUTTON}
    Click Button                             ${RESET_FILTER_BUTTON}

Apply Resource Filter
    [Arguments]      ${filter_input_btn}   ${doc_type}        
    Click Element    ${filter_input_btn}
    ${option_locator}=    Set Variable     xpath=//div[contains(text(), '${doc_type}')]
    Wait Until Element Is Visible          ${option_locator}     timeout=10s
    log                                    ${option_locator}
    Click Element                          ${option_locator}
    Click Button                           ${APPLY_FILTER_BUTTON}

Verify Topic Filter
    [Arguments]                         ${filtered_topic}
    Page Should Contain Element         xpath=//table[1]/thead[1]/tr[1]/th[2][contains(text(), '${filtered_topic}')]

Verify Certificate Filter
    [Arguments]                         ${filtered_topic}
    Page Should Contain Element         xpath=//table[1]/thead[1]/tr[2]/th[2]/div[1]/div[2]/span[2][contains(text(), '${filtered_topic}')]

Select User Type Filter
    [Arguments]    ${type}
    Wait Until Element Is Visible    ${SELECT_USER_TYPE_BTN}
    Click Element      ${SELECT_USER_TYPE_BTN}
    Run Keyword If    '${type}' == 'internal'    Click Element    ${INTERNAL_OPTION}
    ...    ELSE IF    '${type}' == 'external'    Click Element    ${EXTERNAL_OPTION}
    Click Element      ${APPLY_FILTER_BUTTON}

Verify User Types
    [Arguments]    ${expected_type}

    ${all_elements}    Get WebElements    xpath=//tbody/tr//td//div[1]/div[3]/p[1]
    Log    ${all_elements}
    
    ${row_count}    Get Length    ${all_elements} 
    Log    Found ${row_count} visible rows after applying ${expected_type} filter
    
    IF    ${row_count} == 0
        Log    No visible rows found with type '${expected_type}' - This is a valid scenario
        Pass Execution    Filter working correctly - No matching users found
    ELSE
        FOR    ${row}    IN    @{all_elements} 
            ${type_text}=     Get Text    ${row}
            Log    Found row with type: ${type_text}
            
            # Verify if this visible row matches the filter
            Should Be Equal    ${type_text}    ${expected_type}    
            ...    msg=Found visible row with type '${type_text}' when filter is set to '${expected_type}'    
        END
        Log    All visible rows match the expected type '${expected_type}'
    END