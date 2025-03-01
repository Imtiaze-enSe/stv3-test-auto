*** Settings ***
Documentation     Common keywords and utilities for test automation
Library           SeleniumLibrary
Library           DateTime
Library           String
Library           Collections
Library           Process
Resource          ../../VARIABLES/Instant_observ/ObservationVariables.resource
Resource          ../../VARIABLES/Globals.resource
Resource          ../common.resource

***keywords***

Navigate to Observations info Page
    Wait until element is visible                 ${VIEW_INSTANT_BUTTON}
    click element                                 ${VIEW_INSTANT_BUTTON}
    wait until page contains                       Observations Info

Click the add new button
    Wait Until Element Is Visible                   ${ADD_OBSERVATION_BTN}
    Click Element                                   ${ADD_OBSERVATION_BTN}

Empty Field Content
    [Arguments]      ${locator}
    Click Element    ${locator}
    SeleniumLibrary.Press Keys    none     CTRL+a
    SeleniumLibrary.Press Keys    none     DELETE

Fill in dropdown input with img
    [Arguments]             ${input}        ${option_text}
    Wait Until Element Is Visible           ${input}
    Click Element           ${input}
    Wait Until Element Is Visible         xpath=//div[contains(@class, 'react-select__menu')]
    ${option_locator}=    Set Variable    xpath=//div[contains(@class, 'checkbox-option-container')]//p[contains(text(), '${option_text}')]
    log                                    ${option_locator}
    Wait Until Element Is Visible          ${option_locator}
    Click Element                          ${option_locator}

Fill in dropdown input
    [Arguments]             ${input}        ${option_text}
    Wait Until Element Is Visible           ${input}            timeout=15s
    Wait Until Element Is Enabled           ${input}            timeout=10s
    Sleep    3s
    Click Element    ${input}
    Wait Until Element Is Visible         xpath=//div[contains(@class, 'react-select__menu')]
    Scroll Element Into View              xpath=//div[contains(@class, 'react-select__menu')]
    ${option_locator}=    Set Variable    xpath=//div[contains(text(), '${option_text}')]
    log                                    ${option_locator}
    Wait Until Element Is Visible          ${option_locator}
    Wait Until Element Is Enabled          ${option_locator}        timeout=10s
    Click Element                          ${option_locator}

Select element In Inspection Observations dropdown
    [Documentation]    Selects an option from the "Select Client" dropdown using keyboard navigation.
    [Arguments]                          ${DROPDOWN_INPUT}  
    Click Element                        ${DROPDOWN_INPUT}
    sleep     0.5s
    Press Keys                           ${DROPDOWN_INPUT}   ENTER
    
Fill out General info Form
    [Arguments]        ${address}    ${classification}         ${category}        ${subcategory}   ${status}
    Wait Until Element Is Visible                              ${GENERAL_INFO}
    Sleep    2s
    Select element In Inspection Observations dropdown         ${CLIENT_INPUT}    
    Select element In Inspection Observations dropdown         ${SITE_INPUT}    
    Select element In Inspection Observations dropdown         ${PROJECT_INPUT}    
    Wait Until Element Is Enabled                              ${ADDRESS_INPUT}
    Empty Field Content                                        ${ADDRESS_INPUT}
    Input Text                                                 ${ADDRESS_INPUT}              ${address} 
    Select element In Inspection Observations dropdown         ${ZONE_INPUT}     
    Click Element                                              ${EQUIPMENT_INPUT}
    wait until element is visible                              ${SELECTED_EQUIPMENT_TEST}
    Click Element                                              ${SELECTED_EQUIPMENT_TEST}
    Click Element                                              ${SAVE_BTN_IN_EQUIPMENT}
    Fill in dropdown input with img                            ${ASSIGNTO_INPUT}                 Contractor
    Scroll Element Into View                                   ${MANAGER_INPUT}
    Fill in dropdown input with img                            ${MANAGER_INPUT}                Abdelkbir
    Click Element                                              ${TYPE_SAFETY} 
    Sleep    1s
    Fill in dropdown input                                     ${CLASSIFICATIONS_INPUT}          ${classification}
    Fill in dropdown input                                     ${CATEGORY_INPUT}                 ${category}
    Fill in dropdown input                                     ${SUBCATEGORY_INPUT}              ${subcategory}
    Click Element                                              ${status}

Go to next step
    Wait Until Element Is Visible                              ${NEXT_STEP_BTN}
    Wait Until Element Is Enabled                              ${NEXT_STEP_BTN}
    Click Element                                              ${NEXT_STEP_BTN}

Enhanced Drag And Drop Actions
    [Arguments]    ${source}    ${target}
    Wait Until Element Is Visible    ${source}    timeout=10s
    Wait Until Element Is Visible    ${target}    timeout=10s
    ${element}=    Get WebElement    ${source}
    ${target_element}=    Get WebElement    ${target}
    
    # Scroll element into view first
    Execute JavaScript    arguments[0].scrollIntoView(true);    ${element}
    Sleep    1s    # Give time for any animations
    
    # Try dragging with all mouse events
    Click Element    ${source}
    Sleep    0.5s
    Mouse Down    ${source}
    Sleep    0.5s
    Mouse Over    ${target}
    Sleep    0.5s
    Mouse Up    ${target}

Drag And Drop Using JavaScript
    [Arguments]    ${source_element}    ${target_element}
    ${js}=    Set Variable
    ...    function simulateDragDrop(sourceXPath, targetXPath) { 
    ...    const source = document.evaluate(sourceXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; 
    ...    const target = document.evaluate(targetXPath, document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue; 
    ...    const dataTransfer = new DataTransfer(); 
    ...    source.dispatchEvent(new DragEvent('dragstart', { dataTransfer: dataTransfer })); 
    ...    target.dispatchEvent(new DragEvent('drop', { dataTransfer: dataTransfer })); 
    ...    source.dispatchEvent(new DragEvent('dragend', { dataTransfer: dataTransfer })); } 
    ...    simulateDragDrop("${source_element}", "${target_element}");

    Execute JavaScript    ${js}

       

# Calculate Drag And Drop Coordinates
#     &{drag}     Get BoundingBox          ${OBSERV_IMG_To_Drag} 
#     # it will have key value pair, so can be stored in dictionary variable
#     &{drop}    Get BoundingBox         ${Drop_TARGET_AREA}
#     # fetch only values from dictionary and store in a list. We don't need Keys
#     @{list_drag}        Get Dictionary Values    ${drag}
#     @{list_drop}        Get Dictionary Values    ${drop}
#     ${_drag}        Set Variable            ${list_drag}[2]
#     ${y_drag}        Set Variable           ${list_drag}[3]
#     ${x_drop}        Set Variable        ${list_drop}[2]
#     ${y_drop}        Set Variable        ${list_drop}[3]
#     [Return]         ${x_drag}     ${y_drag}     ${x_drop}     ${y_drop}
Fill out Observation Details Form  
    [Arguments]                                                 ${observ_name}                      ${desc_content}
    Wait Until Page Contains Element                            ${OBSERVATION_DETAILS} 
    Wait Until Element Is Visible                               ${OBSERV_DETAIL_TITLE}
    Empty Field Content                                         ${OBSERV_DETAIL_TITLE}
    Input Text                                                  ${OBSERV_DETAIL_TITLE}              ${observ_name}
    # type
    Wait Until Element Is Enabled                               ${OBSERV_DETAIL_TYPE_PUBLIC} 
    Click Element                                               ${OBSERV_DETAIL_TYPE_PUBLIC} 
    Empty Field Content                                         ${OBSERV_DETAIL_DESCRIPTION}
    Input Text                                                  ${OBSERV_DETAIL_DESCRIPTION}         ${desc_content}
    Choose File                                                 ${ATTACHEMENT_IMPUT}                 ${PATH_TO_ATTACHMENT}
    Sleep    1s 
    Wait Until Element Is Visible                               ${GO_TO_LAST_STEP}
    Click Element                                               ${GO_TO_LAST_STEP}
    # [Return]                                                    ${OBSERV_DETAIL_TITLE}
    # Wait Until Element Is Visible                             ${Drop_TARGET_AREA}
    # # Scroll Element Into View                                ${Drop_TARGET_AREA}
    # Scroll Element Into View                                  ${OBSERV_IMG_To_Drag}
    # Enhanced Drag And Drop Actions                            ${OBSERV_IMG_TO_DRAG}   ${DROP_TARGET_AREA}                                
    # Page Should Contain Element                               xpath=//form[1]/div[2]/div[1]/div[2]/div[3]/div[1]/div[2]/div[2]/div[1]/img[1]
  
    

Fill Out Positives and issues Form
    [Arguments]                ${postive_desc}     ${issue_desc}    ${sol_desc}
    Wait Until Page Contains Element                             ${POSITIVES_ISSUE_FORM_TITLE}
    Wait Until Element Is Visible                                ${POSITIVE_DROPDOWN}
    Click Element                                                ${POSITIVE_DROPDOWN}
    Wait Until Element Is Visible                                ${ADD_POSITIVE_BTN}
    Click Element                                                ${ADD_POSITIVE_BTN}
    Wait Until Element Is Visible                                ${DESCRIBE_POSITIVE_FIELD}
    Input Text                                                   ${DESCRIBE_POSITIVE_FIELD}                ${postive_desc} 
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN} 
    Click Element                                                ${ISSUES_DROPDOWN} 
    Wait Until Element Is Visible                                ${ADD_ISSUE_BTN}
    Click Element                                                ${ADD_ISSUE_BTN}   
    Wait Until Element Is Visible                                ${ISSUE_INPUT}
    Input Text                                                   ${ISSUE_INPUT}                             ${issue_desc} 
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN} 
    Click Element                                                ${ADD_SOLUTION_BTN}
    Scroll Element Into View                                     ${DESCRIBE_SOLUTION_FIELD}
    Wait Until Element Is Visible                                ${DESCRIBE_SOLUTION_FIELD}
    Input Text                                                   ${DESCRIBE_SOLUTION_FIELD}                 ${sol_desc}
    Wait Until Element Is Enabled                                ${SOLUTION_DEADLINE_FIELD}
    Fill in dropdown input                                       ${SOLUTION_DEADLINE_FIELD}            1 Weeks
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN}

Submit the form and check creation
    Wait Until Element Is Visible                                ${SUBMIT_OBSERV_FORM_BTN}
    Click Element                                                ${SUBMIT_OBSERV_FORM_BTN}
    SeleniumLibrary.Wait Until Location Is                       ${OBSERVATION_LIST_URL}  

Search For an Observation
    [Arguments]                                  ${name}
    Wait Until Element Is Visible                ${SEARCH_OBSERV_FIELD}   
    Input Text                                   ${SEARCH_OBSERV_FIELD}    ${name}  
    Wait Until Element Is Visible                ${CONFIRM_SEARCH_BTN}   
    Click Element                                ${CONFIRM_SEARCH_BTN}  
    Wait Until Page Contains Element             xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[4]/h3[contains(text(), "${name}")] 

Go to Edition form
    [Arguments]                                   ${observ_to_edit}
    Wait Until Element Is Visible                 xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[4]/h3[contains(text(), "${observ_to_edit}")] 
    Click Element                                 xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[4]/h3[contains(text(), "${observ_to_edit}")]
    Wait Until Element Is Visible                 ${EDIT_BTN}
    Click Element                                 ${EDIT_BTN}
    wait until page contains                      Add New Observation

Edit General info Form
    Fill out General info Form        edited adress n 21    Non-conformity    Ambiance de travail    Condition estivale    ${EDITED_STATUS}

Edit Observation Details Form 
    [Arguments]        ${name}
    Fill out Observation Details Form             ${name}        This is an edited observation description
Edit Positives and issues Form 
    [Arguments]                ${postive_desc}     ${issue_desc}    ${sol_desc}
    Wait Until Page Contains Element                             ${POSITIVES_ISSUE_FORM_TITLE}
    Wait Until Element Is Visible                                ${POSITIVE_DROPDOWN}
    Click Element                                                ${POSITIVE_DROPDOWN}
    Wait Until Element Is Visible                                ${EDIT_POSITIVE_BTN}
    Click Element                                                ${EDIT_POSITIVE_BTN}
    Wait Until Element Is Visible                                ${DESCRIBE_POSITIVE_FIELD}
    Empty Field Content                                          ${DESCRIBE_POSITIVE_FIELD}
    Input Text                                                   ${DESCRIBE_POSITIVE_FIELD}                ${postive_desc} 
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN} 
    Click Element                                                ${ISSUES_DROPDOWN} 
    Wait Until Element Is Visible                                ${EDIT_ISSUE_BTN}
    Click Element                                                ${EDIT_ISSUE_BTN}   
    Wait Until Element Is Visible                                ${ISSUE_INPUT}
    Empty Field Content                                          ${ISSUE_INPUT}
    Input Text                                                   ${ISSUE_INPUT}                             ${issue_desc} 
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN} 
    Click Element                                                ${EDIT_SOLUTION_BTN}
    Scroll Element Into View                                     ${DESCRIBE_SOLUTION_FIELD}
    Wait Until Element Is Visible                                ${DESCRIBE_SOLUTION_FIELD}
    Empty Field Content                                          ${DESCRIBE_SOLUTION_FIELD}
    Input Text                                                   ${DESCRIBE_SOLUTION_FIELD}                 ${sol_desc}
    Wait Until Element Is Enabled                                ${SOLUTION_DEADLINE_FIELD}
    Fill in dropdown input                                       ${SOLUTION_DEADLINE_FIELD}            2 Weeks
    Click Element                                                ${SAVE_DESCRIBE_POSITIVE_BTN}    

Submit Edit Resource Form
    Wait Until Element Is Visible                                ${SUBMIT_OBSERV_FORM_BTN}
    Click Element                                                ${SUBMIT_OBSERV_FORM_BTN}   

Get Current Date Components
    ${current_date}=    Get Current Date
    ${year}=    Convert Date    ${current_date}    result_format=%Y
    ${month}=    Convert Date    ${current_date}    result_format=%m
    ${day}=    Convert Date    ${current_date}    result_format=%d
    [Return]    ${year}    ${month}    ${day}

Is Date Within Range
    [Arguments]    ${date_str}    ${start_date}    ${end_date}

    # Convert the input date string to a proper datetime object
    ${card_date}=    Convert Date    ${date_str}    date_format=%d %b %Y    result_format=%Y-%m-%d

    # Convert start_date and end_date to proper datetime objects
    ${start_date}=    Convert Date    ${start_date}    date_format=%d %b %Y    result_format=%Y-%m-%d
    ${end_date}=    Convert Date    ${end_date}    date_format=%d %b %Y    result_format=%Y-%m-%d

    # Evaluate if the date is within the range
    ${result}=    Evaluate    '${start_date}' <= '${card_date}' <= '${end_date}'

    [Return]    ${result}


Apply Filter
    Wait Until Element Is Enabled                        ${APPLY_FILTER_BTN}
    Click Element                                        ${APPLY_FILTER_BTN}

Select Filter
    [Arguments]      ${FILTER_DROPDOWN}          ${option}
    Click Element                                ${FILTER_DROPDOWN} 
    Click Element    xpath=//label[contains(text(), '${option}')]
    Apply Filter
    Sleep    2s

Navigate To Month
    [Arguments]    ${target_date}
    # Convert target date to get month and year
    ${target_month}=    Convert Date    ${target_date}    result_format=%B
    ${target_year}=    Convert Date    ${target_date}    result_format=%Y
    ${target_month_year}=    Set Variable    ${target_month} ${target_year}
    
    # Get current month and year from calendar header
    ${current_month_year}=    Get Text    ${CALENDAR_MONTH_HEADER}
    
    WHILE    '${current_month_year}' != '${target_month_year}'
        ${current_date}=    Convert Date    ${current_month_year}    date_format=%B %Y
        ${target_date_obj}=    Convert Date    ${target_month_year}    date_format=%B %Y
        
        # Determine whether to go forward or backward
        ${go_forward}=    Evaluate    $target_date_obj > $current_date
        
        IF    ${go_forward}
            Click Element    ${NEXT_MONTH_BTN}
        ELSE
            Click Element    ${PREV_MONTH_BTN}
        END
        
        Sleep    0.5s    # Small wait for calendar to update
        ${current_month_year}=    Get Text    ${CALENDAR_MONTH_HEADER}
    END
Apply different date filters
    @{date_options}=    Create List    Yesterday    Today    This week    This month    This year
    
    FOR    ${option}    IN    @{date_options}
        # Apply the date filter
        Select Filter    ${DATE_FILTER_DROPDOWN}        ${option}

        # Check for no results message
        ${no_results_visible}=    Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${option} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Get expected date range for validation
        ${start_date}    ${end_date}=    Get Date Range For Option    ${option}
        
        # Validate all visible cards
        Validate Card Dates    ${start_date}    ${end_date}
        Go Back to Filters Page

    END

Select Date In Calendar
    [Arguments]    ${date_str}
    # Convert the date string to get components
    ${date}=    Convert Date    ${date_str}    date_format=%Y-%m-%d
    ${day}=    Convert Date    ${date}    result_format=%d
    # Remove leading zero from day
    ${day}=    Convert To Integer    ${day}
    Click Element    xpath=//ul[1]/div[2]/div[1]/div[2]/button[contains(text(), "${day}")]
                   

Apply Custom Date Range
    [Arguments]    ${start_date}    ${end_date}
    Wait Until Element Is Visible    ${DATE_FILTER_DROPDOWN}
    Click Element    ${DATE_FILTER_DROPDOWN}
    Click Element    xpath=//label[contains(text(), 'Custom date')]
    Wait Until Element Is Visible    ${CALENDAR_CONTAINER}
    
    # Select start date
    Select Date In Calendar    ${start_date}
    
    # If end date is in a different month, navigate to it
    ${start_month_year}=    Convert Date    ${start_date}    result_format=%B %Y
    ${end_month_year}=    Convert Date    ${end_date}    result_format=%B %Y
    
    IF    '${start_month_year}' != '${end_month_year}'
        Navigate To Month    ${end_date}
    END

    Select Date In Calendar    ${end_date}
    Apply Filter
    
    # Wait for results to load (either cards or no results message)
    ${status}=    Run Keyword And Return Status    
    ...    Wait Until Element Is Visible    ${CARDS_CONTAINER}    timeout=13s
    
    Run Keyword If    not ${status}    
    ...    Wait Until Page Contains       ${EXPECTED_NO_RESULTS_TEXT}    timeout= 10s

Get Date Range For Option
    [Arguments]    ${option}
    ${current_date}=    Get Current Date    result_format=%d %b %Y

    IF    '${option}' == 'Today'
        ${start_date}=    Set Variable    ${current_date}
        ${end_date}=    Set Variable    ${current_date}

    ELSE IF    '${option}' == 'Yesterday'
        ${start_date}=    Add Time To Date    ${current_date}    -1 day    result_format=%d %b %Y    date_format=%d %b %Y
        ${end_date}=    Set Variable    ${start_date}

    ELSE IF    '${option}' == 'This week'
        ${start_date}=    Add Time To Date    ${current_date}    -6 days    result_format=%d %b %Y    date_format=%d %b %Y
        Log    ${start_date}
        ${end_date}=    Set Variable    ${current_date}

    ELSE IF    '${option}' == 'This month'
        ${start_date}=    Get Current Date    result_format=01 %b %Y    
        ${end_date}=    Set Variable    ${current_date}

    ELSE IF    '${option}' == 'This year'
        ${start_date}=    Get Current Date    result_format=01 Jan %Y
        ${end_date}=    Set Variable    ${current_date}

    ELSE
        Fail    Invalid filter option: ${option}

    END

    [Return]    ${start_date}    ${end_date}

Validate Card Dates
    [Arguments]    ${start_date}    ${end_date}
    # Get all date elements
    @{date_elements}=    Get WebElements    ${CARD_DATE_LOCATOR}
    
    # Log the number of cards found (helpful for debugging)
    ${count}=    Get Length    ${date_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${date_element}    IN    @{date_elements}
        # Get the text directly from the element
        ${card_date_str}=    Get Text    ${date_element}
        Log    Validating date: ${card_date_str}
        
        # Convert date string to datetime
        # ${card_date}=    Convert Date    ${card_date_str}        result_format=%d %b %Y    date_format=%d %b %Y
        
        ${is_within_range}=    Is Date Within Range    ${card_date_str}    ${start_date}    ${end_date}
        Should Be True    ${is_within_range}    Card date ${card_date_str} is not within expected range
    END

Go Back to Filters Page
    Wait Until Element Is Visible                                    ${FILTERS_BTN}
    Click Element                                                    ${FILTERS_BTN}
    Wait Until Element Is Visible                                    ${CLEAR_ALL_FILTERS}
    Click Element                                                    ${CLEAR_ALL_FILTERS}
    Wait Until Element Is Not Visible                                ${CLEAR_ALL_FILTERS}
# ------ location filter

Select Location Option
    [Arguments]    ${dropdown_locator}    ${option_value}
    Wait Until Element Is Visible         ${dropdown_locator}
    Fill in dropdown input                ${dropdown_locator}      ${option_value}

Select Client Option
    [Arguments]    ${dropdown_locator}   ${input}   ${option_value}
    Wait Until Element Is Visible    ${dropdown_locator}
    Wait Until Element Is Visible    ${input}
    Click Element    ${input}
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'react-select__menu')]
    
    # Try to find by text in p tag first
    ${text_locator}=    Set Variable    
    ...    //div[contains(@class, 'select-img')]//p[contains(@class, 'image-select-name-label') and contains(text(), '${option_value}')]
    
    # If not found by text, try by image alt
    ${img_locator}=    Set Variable    
    ...    //div[contains(@class, 'select-img')]//img[contains(@alt, '${option_value}') or contains(@src, '${option_value}')]
    
    # Try text locator first
    ${status}    ${value}=    Run Keyword And Ignore Error    
    ...    Wait Until Element Is Visible    xpath=${text_locator}    timeout=5s
    
    # If text locator fails, try image locator
    Run Keyword If    '${status}' == 'FAIL'    
    ...    Wait Until Element Is Visible    xpath=${img_locator}    timeout=5s
    
    # Click the element that was found
    ${element_to_click}=    Set Variable If    
    ...    '${status}' == 'PASS'    ${text_locator}    ${img_locator}
    
    Click Element    xpath=${element_to_click}


Open Filter dropdown
    [Arguments]                           ${filter_dropdown} 
    Wait Until Element Is Visible         ${filter_dropdown}  
    Click Element                         ${filter_dropdown} 

Validate Image Source
    [Arguments]    ${image_locator}    ${expected_value}
    ${src}=    Get Element Attribute    ${image_locator}    src
    Should Contain    ${src}    ${expected_value}    msg=Image source does not contain expected value

Verify Card Location Details
    [Arguments]       ${expected_client}    ${expected_site}    ${expected_project}    ${expected_zone}    ${expected_level}
    FOR    ${index}    IN RANGE    999999    # Using a large number, will break when no more cards
        # Get fresh list of cards each time
        ${status}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${cards_locator}
        
        # Break if no cards found or error occurred
        Run Keyword If    '${status}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        # Get fresh reference to current card
        ${current_card}=    Set Variable    ${cards}[${index}]
        
        # Try to click and validate with retry mechanism
        ${click_status}    ${error}=    Run Keyword And Ignore Error
        ...    Click Element    ${current_card}
        
        Continue For Loop If    '${click_status}' == 'FAIL'
        
        # Wait for details to be visible
        Wait Until Element Is Visible    ${location_details}    timeout=10s
        
        # Validate client (handles both text and image)
        ${status}    ${value}=    Run Keyword And Ignore Error
        ...    Element Should Contain    ${location_details_client}    ${expected_client}
        
        Run Keyword If    '${status}' == 'FAIL'    
        ...    Run Keywords
        ...    Wait Until Element Is Visible    ${location_details_client}//img    AND
        ...    Validate Image Source    ${location_details_client}//img    ${expected_client}
        
        # Validate other details
        Element Should Contain    ${LOCATION_DETAILS_SITE}        ${expected_site}
        Element Should Contain    ${LOCATION_DETAILS_PROJECT}    ${expected_project}
        Element Should Contain    ${LOCATION_DETAILS_ZONE}        ${expected_zone}
        Element Should Contain    ${LOCATION_DETAILS_LEVEL}        ${expected_level}
        
        # Close details if there's a close button
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s    # Give time for animation/state update
    END

Validate Card Progress
    [Arguments]    ${option}    
    # Get all date elements
    @{progress_elements}=    Get WebElements    ${CARD_PROGRESS_LOCATOR}
    
    # Log the number of cards found 
    ${count}=    Get Length    ${progress_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${progress_element}    IN    @{progress_elements}
        # Get the text directly from the element
        ${card_progress_str}=    Get Text    ${progress_element}
        ${option_upper}=    Convert To Upper Case    ${option}
        ${is_valid}=    Should Be Equal As Strings    ${card_progress_str}    ${option_upper}    Card ${card_progress_str} is not a valid card
    END
Test different progress filter options
    @{progress_options}=    Create List    Pending		Rejected	In Progress 	Solved    	Approved	Closed
    
    FOR    ${option}    IN    @{progress_options}
        # Apply the date filter
        Select Filter    ${PROGRESS_FILTER_DROPDOWN}    ${option}

        # Check for no results message
        ${no_results_visible}=    Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${option} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Validate all visible cards
        Validate Card Progress        ${option}
        Go Back to Filters Page

    END

Select equipment option 
    [Arguments]         ${option}
    Click Element                    ${EQUIPMENT_FILTER_DROPDOWN} 
    Wait Until Element Is Visible    xpath=//ul[1]/div[1]/li/label[1]/p[contains(text(), '${option}')]
    Click Element                    xpath=//ul[1]/div[1]/li/label[1]/p[contains(text(), '${option}')]
    Apply Filter

Validate Card Equipment
    [Arguments]    ${option}    

    FOR    ${index}    IN RANGE    999999    # Using a large number, will break when no more cards
        # Get fresh list of cards each time
        ${status}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${cards_locator}
        
        # Break if no cards found or error occurred
        Run Keyword If    '${status}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        # Get fresh reference to current card
        ${current_card}=    Set Variable    ${cards}[${index}]
        
        # Try to click and validate with retry mechanism
        ${click_status}    ${error}=    Run Keyword And Ignore Error
        ...    Click Element    ${current_card}
        
        Continue For Loop If    '${click_status}' == 'FAIL'
        
        # Wait for details to be visible
        Wait Until Element Is Visible    ${location_details}    timeout=10s
        Element Should Contain           ${EQUIPMENT_DETAILS_LOCATOR}        ${option}
        # back to list of cards
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s    # Give time for animation/state update
    END

Test different types filter options
    @{types_options}=    Create List    Safety		Quality	  Environment 	
    
    FOR    ${option}    IN    @{types_options}
        Click Element                    ${TYPE_FILTER_DROPDOWN} 
        Click Element                    xpath=//ul[1]/div[1]/li/label[1]/div[contains(text(), '${option}')]
        Apply Filter
        Sleep    1s
        # Select Filter    ${TYPE_FILTER_DROPDOWN}    ${option}

        # Check for no results message
        ${no_results_visible}=    Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${option} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Validate all visible cards
        Validate Card Type        ${option}
        Go Back to Filters Page

    END

Test different classification filter options
        [Arguments]                      ${option}
        Click Element                    ${Classification_FILTER_DROPDOWN} 
        Click Element                    xpath=//ul[1]/div[1]/li/label[1]/div[contains(text(), '${option}')]
        Apply Filter
        Sleep    1s
        
        # Check for no results message
        ${no_results_visible}=    Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${option} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Validate all visible cards
        Validate Card classification        ${option}
        Go Back to Filters Page

Validate Card Type 
    [Arguments]    ${option}    
    # Get all date elements
    ${CARD_TYPES_LOCATOR}=     Set Variable      xpath=//div[contains(@class, 'card')]//div[4]//span//p[text()="${option}" and not(./span)]
    @{type_elements}=    Get WebElements    ${CARD_TYPES_LOCATOR}
    
    # Log the number of cards found 
    ${count}=    Get Length    ${type_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${type_element}    IN    @{type_elements}
        # Get the text directly from the element
        Mouse Over   ${type_element}
        ${card_type_str}=    Get Text   ${type_element}
        Log    Extracted card type text: ${card_type_str}
        # ${option_upper}=    Convert To Upper Case    ${card_type_str}
        ${is_valid}=    Should Be Equal As Strings    ${card_type_str}    ${option}    Card ${card_type_str} is not a valid card
    END

Validate Card classification
    [Arguments]    ${option}    
    ${CARD_TYPES_LOCATOR}=     Set Variable      xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div[1]//div[4]//span//p[text()="${option}" and not(./span)]
    @{type_elements}=    Get WebElements    ${CARD_TYPES_LOCATOR}
    
    ${count}=    Get Length    ${type_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${index}    IN RANGE    999999
        ${status}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${CARD_TYPES_LOCATOR}
        
        Run Keyword If    '${status}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        ${current_card}=    Set Variable    ${cards}[${index}]
        
        # Try to hover first to make element visible
        Mouse Over    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].scrollIntoView(true)    ARGUMENTS    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].click()    ARGUMENTS    ${current_card}
        
        # Verify the details appeared
        Wait Until Element Is Visible    ${classification_details}    timeout=10s
        Element Should Contain    ${classification_details}    ${option}
        
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s
    END

Apply Category filters 
    [Arguments]                ${category}       ${sub-category}=${EMPTY}    ${tag}=${EMPTY}
    Click Element    ${Category_FILTER_DROPDOWN}
    Sleep    1s    # Give the dropdown time to expand
    Scroll To View an Element           ${Category_FILTER_DROPDOWN}
    Fill in dropdown input              ${SELECT_CATEGORY_INPUT}             ${category} 
    Sleep     1s 
    Run Keyword If    '${sub-category}' != '${EMPTY}'  
    ...        Fill in dropdown input               ${SELECT_Sub_CATEGORY_INPUT}        ${sub-category}
    Sleep     1s  
    Run Keyword If    '${tag}' != '${EMPTY}'                      
    ...        Fill in dropdown input               ${SELECT_TAG_INPUT}                 ${tag}
    Apply Filter
    Sleep    1s
    
    # Check for no results message
    ${no_results_visible}=    Run Keyword And Return Status
    ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
    
    IF    ${no_results_visible}
        # Log that no results were found and continue to next filter
        Log    No results found for ${category} filter, continuing to next option
        Go Back to Filters Page
        Continue For Loop
    END
    
    # Validate all visible cards
    Validate Card category        ${category}       ${sub-category}        ${tag}
    Go Back to Filters Page

Validate Card category
    [Arguments]    ${category}    ${sub-category}=${EMPTY}    ${tag}=${EMPTY}

    ${CARD_CATEGORY_LOCATOR}=     Set Variable      xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div[1]/div[4]/div[1]/p[text()="${category}"]
                                                          
    @{type_elements}=    Get WebElements    ${CARD_CATEGORY_LOCATOR}
    
    ${count}=    Get Length    ${type_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${index}    IN RANGE    999999
        ${status}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${CARD_CATEGORY_LOCATOR}
        
        Run Keyword If    '${status}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        ${current_card}=    Set Variable    ${cards}[${index}]
         
        Execute JavaScript    arguments[0].scrollIntoView(true)    ARGUMENTS    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].click()    ARGUMENTS    ${current_card}
        
        # Verify the details appeared
        Scroll Element Into View         ${Category_details}
        Wait Until Element Is Visible    ${Category_details}     timeout=10s
        
        # Validate category (required)
        Element Should Contain    ${Category_details}    ${category}
        
        # Validate sub-category if provided
        Run Keyword If    '${sub-category}' != '${EMPTY}'    
        ...    Element Should Contain    ${Category_details}    ${sub-category}
        
        # Validate tag if provided
        Run Keyword If    '${tag}' != '${EMPTY}'    
        ...    Element Should Contain    ${Category_details}    ${tag}
        
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s
    END

Apply Status filter
    [Arguments]                  ${status}
    Scroll To View an Element            ${STATUS_FILTER_DROPDOWN}
    Select Filter                        ${STATUS_FILTER_DROPDOWN}    ${status}

        # Check for no results message
        ${no_results_visible}=    Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${status} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Validate all visible cards
        Validate Card Status        ${status}
        Go Back to Filters Page

Validate Card Status
    [Arguments]    ${option}    
    ${CARD_STATUS_LOCATOR}=     Set Variable      xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div[1]/div[4]/div[1]/div[1]/span[1]/div[1]/p[text()="${option}" and not(./span)]
    @{status_elements}=    Get WebElements    ${CARD_STATUS_LOCATOR}
    
    ${count}=    Get Length    ${status_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${index}    IN RANGE    999999
        ${status}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${CARD_STATUS_LOCATOR}
        
        Run Keyword If    '${status}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        ${current_card}=    Set Variable    ${cards}[${index}]
        
        # Try to hover first to make element visible
        Mouse Over    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].scrollIntoView(true)    ARGUMENTS    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].click()    ARGUMENTS    ${current_card}
        
        # Verify the details appeared
        Wait Until Element Is Visible    ${Status_details}    timeout=10s
        Element Should Contain    ${Status_details}    ${option}
        
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s
    END

Test different mode filter options
    @{Mode_options}=    Create List    Private		Public
    
    FOR    ${option}    IN    @{Mode_options}
        # Apply the date filter
        Scroll To View an Element            ${MODE_FILTER_DROPDOWN}
        Click Element                        ${MODE_FILTER_DROPDOWN} 
        Click Element                        xpath=//label/div[contains(text(), '${option}')]
        Apply Filter
        Sleep    2s
        

        # Check for no results message
        ${no_results_visible} =      Run Keyword And Return Status
        ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
        
        IF    ${no_results_visible}
            # Log that no results were found and continue to next filter
            Log    No results found for ${option} filter, continuing to next option
            Go Back to Filters Page
            Continue For Loop
        END
        
        # Validate all visible cards
        Validate Card Mode        ${option}
        Go Back to Filters Page

    END
Validate Card Mode
    [Arguments]    ${option}    
    ${CARD_MODE_LOCATOR}=     Set Variable      xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div[1]/div[4]/div[1]/div[1]/span/div[1]/p[text()="${option}" and not(./span)]
    @{Mode_elements}=    Get WebElements    ${CARD_MODE_LOCATOR}
    
    ${count}=    Get Length    ${Mode_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${index}    IN RANGE    999999
        ${Mode}    ${cards}=    Run Keyword And Ignore Error
        ...    Get WebElements    ${CARD_MODE_LOCATOR}
        
        Run Keyword If    '${Mode}' == 'FAIL'    Exit For Loop
        ${count}=    Get Length    ${cards}
        Run Keyword If    ${count} <= ${index}    Exit For Loop
        
        ${current_card}=    Set Variable    ${cards}[${index}]
        
        # Try to hover first to make element visible
        Mouse Over    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].scrollIntoView(true)    ARGUMENTS    ${current_card}
        Sleep    1s
        
        Execute JavaScript    arguments[0].click()    ARGUMENTS    ${current_card}
        
        # Verify the details appeared
        Wait Until Element Is Visible    ${Mode_details}    timeout=10s
        Mouse Over   ${Mode_details}
        ${card_type_str}=    Get Text   ${Mode_details}
        Log    Extracted card type text: ${card_type_str}
        # ${option_upper}=    Convert To Upper Case    ${card_type_str}
        ${is_valid}=    Should Be Equal As Strings    ${card_type_str}    ${option}    Card ${card_type_str} is not a valid card
        
        Click Element    xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/button[1]
        Sleep    2s
    END

Apply Assignee filter 
    [Arguments]                ${company}       ${manager}=${EMPTY}
    Click Element    ${Assignee_FILTER_DROPDOWN}
    Sleep    1s    # Give the dropdown time to expand
    Scroll To View an Element           ${Assignee_FILTER_DROPDOWN}
    Fill in dropdown input              ${SELECT_COMPANY_INPUT}             ${company} 
    Sleep     1s 
    Run Keyword If    '${manager}' != '${EMPTY}'  
    ...        Fill in dropdown input               ${SELECT_MANAGER_INPUT}        ${manager}
    Apply Filter
    Sleep    1s
    
    # Check for no results message
    ${no_results_visible}=    Run Keyword And Return Status
    ...    Page Should Contain       ${EXPECTED_NO_RESULTS_TEXT}        timeout= 15s
    
    IF    ${no_results_visible}
        # Log that no results were found and continue to next filter
        Log    No results found for ${company} filter, continuing to next option
        Go Back to Filters Page
        Continue For Loop
    END
    
    # Validate all visible cards   
    Validate Card Assignee        ${company}       ${manager}       
    Go Back to Filters Page
    

Validate Card Assignee
    [Arguments]    ${company}       ${manager}    
    ${CARD_ASSIGNEE_LOCATOR}=     Set Variable      xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div/div[2]/div[2]
    @{assignee_elements}=    Get WebElements          ${CARD_ASSIGNEE_LOCATOR}
    
    ${count}=    Get Length    ${assignee_elements}
    Log    Found ${count} cards to validate
    
    FOR    ${element}    IN    @{assignee_elements}
        ${text}=    Get Text    ${element}
        Log    Assignee text: ${text}
        Should Contain    ${text}    ${manager}
    END
