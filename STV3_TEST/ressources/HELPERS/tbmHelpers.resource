*** Settings ***
Documentation     Page objects and keywords for Categories management
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           DateTime
Resource          ../VARIABLES/tbmVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource



*** Keywords ***

Click Toolbox Meetings Module

    Wait Until Element Is Visible        ${SIDEBAR_ELEMENT}
    Click Element                        ${SIDEBAR_ELEMENT}
    Wait Until Element Is Visible        ${SIDEBAR_TBM_SETTIINGS_LINK}         timeout=${TIMEOUT}
    Mouse Over                           ${SIDEBAR_TBM_SETTIINGS_LINK}
    Wait Until Element Is Visible        ${SIDEBAR_TBM_SETTIINGS_LINK}
    Click Element                        ${SIDEBAR_TBM_SETTIINGS_LINK}
    Wait Until Page Contains Element     ${TBM_DASHBOARD} 


Click Add New TBM Button
    Wait Until Element Is Visible    ${ADD_NEW_TBM_BUTTON}
    Click Element                    ${ADD_NEW_TBM_BUTTON}


############# TOOLBOXMEETING GENERAL INFORMATION KEYWORDS ################
Input Title Details
    [Arguments]    ${name}   
    Wait Until Element Is Visible    ${INPUT_TITLE} 
    Input Text                       ${INPUT_TITLE}   ${name}

Search Toolbox Meeting
    [Arguments]    ${search_text}
    [Documentation]    Inputs text into the search box, clicks search, waits for results, then clears the search.

    Wait Until Element Is Visible    ${TBM_SEARCH}   timeout=5s
    Click Element    ${TBM_SEARCH}
    Clear Element Text    ${TBM_SEARCH}
    Input Text    ${TBM_SEARCH}   ${search_text}
    Click Element   ${TBM_SEARCH_BUTTON} 
    Log    Successfully searched for: ${search_text}
    Wait Until Element Is Visible    ${TBM_CARD_TITLE}     timeout=10s
    # Get the text of the first search result
    ${result_text} =    Get Text    ${TBM_CARD_TITLE} 
    # Verify that the result contains the search text
    Should Contain    ${result_text}    ${search_text}
    Log    Search result found containing search text: ${result_text}
    # Wait for a timeout before clearing (to let user see results)
    Sleep    3s
    Click Element    ${TBM_SEARCH_CLEAR_BUTTON}
    Sleep    3s
    Log    Search cleared successfully.

Open Filter Panel
    [Documentation]    Opens the filter panel by clicking the filter button.
    Click Element    ${FILTER_BUTTON}
    Wait Until Element Is Visible    ${FILTER_PANEL}    timeout=5s
    Log    Filter panel opened successfully.

Select Date Filter
    [Documentation]    Selects a date filter from the available options.
    [Arguments]    ${date_filter}
    Click Element    ${DATE_FILTER_DROPDOWN}
    Click Element    xpath=//li//label//input[@value='${date_filter}']
    Log    Selected date filter: ${date_filter}

Select Status Filter
    [Documentation]    Selects a status filter from the available options.
    [Arguments]    ${status_filter}
    Click Element    ${STATUS_FILTER_DROPDOWN}
    Click Element    xpath=//li//label//input[@value='${status_filter}']
    Log    Selected status filter: ${status_filter}

# Select Assign To Filter
#     [Documentation]    Selects an "Assign To" option from the dropdown.
#     [Arguments]    ${assign_to}
#     Click Element    ${ASSIGN_TO_FILTER_DROPDOWN}
#     Click Element    ${ASSIGN_TO_INPUT}
#     Wait Until Element Is Visible    xpath=//div[contains(@class, 'react-select__option') and text()='${assign_to}']    timeout=5s
#     Click Element    xpath=//div[contains(@class, 'react-select__option') and text()='${assign_to}']
#     Log    Selected Assign To filter: ${assign_to}

Set Participation Range
    [Documentation]    Adjusts the participation range slider.
    [Arguments]    ${participation_value}
    Click Element    ${PARTICIPATION_RANGE_DROPDOWN}
    ${slider} =    Get WebElement    ${PARTICIPATION_SLIDER}
    Drag And Drop By Offset    ${slider}    ${participation_value}    0
    Log    Set participation range to: ${participation_value}%

Apply Filters
    [Documentation]    Clicks the "Apply Filter" button.
    Wait Until Element Is Enabled    ${APPLY_FILTER_BUTTON}    timeout=5s
    Click Element    ${APPLY_FILTER_BUTTON}
    Sleep    3s
    Log    Filters applied successfully.

Select Random Date From Datepicker
    [Documentation]    Selects a random date from the datepicker for the current month and next year.

    # Get the current month name and next year dynamically
    ${current_month} =    Get Current Month Name
    ${next_year} =        Get Next Year

    # Click the datepicker to open the calendar
    Click Element    ${DEADLINE_DATEPICKER}
    Wait Until Element Is Visible    ${DEADLINE_DATEPICKER_CALENDAR}    timeout=5s

    # Open the Year Selection Dropdown and select next year
    Click Element    ${DEADLINE_DATEPICKER_YEAR}
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'react-select__option') and text()='${next_year}']    timeout=5s
    Click Element    xpath=//div[contains(@class, 'react-select__option') and text()='${next_year}']

    # Select a random day from the available active days
    ${available_days} =    Get WebElements    ${DEADLINE_DATEPICKER_AVAILABLE_DAYS}
    ${random_index} =    Evaluate    random.randint(0, len($available_days) - 1)    random
    ${selected_day} =    Get Text    ${available_days}[${random_index}]
    Click Element    ${available_days}[${random_index}]

    # Verify the selected date
    ${displayed_date} =    Get Text    ${DEADLINE_DATEPICKER_SELECTED_DATE}
    ${expected_date} =    Set Variable    ${selected_day}/${current_month}/${next_year}
    Should Contain    ${displayed_date}    ${selected_day}

    Log    Successfully selected date: ${displayed_date}

Get Current Month Name
    [Documentation]    Returns the name of the current month.
    ${current_month} =    Evaluate    datetime.datetime.now().strftime("%B")    datetime
    [Return]    ${current_month}

Get Next Year
    [Documentation]    Returns the next year dynamically.
    ${next_year} =    Evaluate    datetime.datetime.now().year + 1    datetime
    [Return]    ${next_year}



Select Publication Now
    [Documentation]    Clicks the "Now" option in the Publication selection dropdown.

    Wait Until Element Is Visible    ${PUBLICATION_Option}    timeout=5s
    Click Element    ${PUBLIICATION_NOW}

    Log    Successfully clicked on "Now" in the Publication selection.

Select Schedule And Set DateTime
    [Documentation]    Selects "Schedule" and sets the date to the 1st of the current month and the next year.
    
    Click Element    ${PUBLIICATION_SCHEDULE}
    Click Element    ${SCHEDULE_DATEPICKER}
    Wait Until Element Is Visible    ${SCHEDULE_DATEPICKER_CALENDAR}    timeout=5s

    # Get the Current Month and Next Year
    ${current_month} =    Get Current Month Name
    ${next_year} =    Get Next Year

    # Open the Year Selection Dropdown and Select Next Year
    Click Element    ${SCHEDULE_DATEPICKER_YEAR}
    ${year_xpath} =    Set Variable    xpath=//div[contains(@class, 'react-select__option') and text()='${next_year}']
    Wait Until Element Is Visible    ${year_xpath}    timeout=5s
    Click Element    ${year_xpath}

    # Select the 1st of the Month
    ${first_day_xpath} =    Set Variable    xpath=//button[contains(@class, 'active-month') and text()='1']
    Wait Until Element Is Visible    ${first_day_xpath}    timeout=5s
    Click Element    ${first_day_xpath}

    # Verify Selected Date
    ${selected_date} =    Get Text    ${SCHEDULE_DATEPICKER_SELECTED_DATE}
    ${expected_date} =    Set Variable    01/${current_month}/${next_year}
    Should Contain    ${selected_date}    01/

    # Select a Time 
    Click Element    ${SCHEDULE_TIME_DROPDOWN}

    Wait Until Element Is Visible    xpath=//input[contains(@class, 'react-select__input')]    timeout=5s

    Press Keys    xpath=//input[contains(@class, 'react-select__input')]    ENTER

    # Verify Selected Time
    ${selected_time} =    Get Text    ${SCHEDULE_SELECTED_TIME}
    Should Not Be Empty    ${selected_time}

    Log    Successfully scheduled date: ${selected_date} at ${selected_time}


Select Assign To Users Of Company
    
    [Documentation]    Selects First option from the "Assign To" dropdown using keyboard navigation.
    
    Click Element    ${ASSIGN_TO_DROPDOWN}
    Wait Until Element Is Visible    ${ASSIGN_TO_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ENTER

    Select Company


Select Assign To Users Of Site
    
    [Documentation]    Selects Second option from the "Assign To" dropdown using keyboard navigation.
    
    # Click to activate the dropdown
    Click Element    ${ASSIGN_TO_DROPDOWN}
    Wait Until Element Is Visible    ${ASSIGN_TO_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ARROW_DOWN
    Sleep    0.5s
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ENTER

    Select Company

    Select Site

Select Assign To Users Of Project
    
    [Documentation]    Selects Third option from the "Assign To" dropdown using keyboard navigation.
    
    Click Element    ${ASSIGN_TO_DROPDOWN}
    Wait Until Element Is Visible    ${ASSIGN_TO_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ARROW_DOWN
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ARROW_DOWN
    Sleep    0.5s
    
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ENTER

    Sleep    1.5s

    Select Company

    Select Site

    Select Project


Select Company
  [Documentation]    Selects an option from the "Assign To" dropdown using keyboard navigation.
    
    # Click to activate the dropdown
    Click Element    ${ASSIGN_TO_SELECT_COMPANY}
    Wait Until Element Is Visible       ${ASSIGN_TO_SELECT_COMPANY_INPUT}        timeout=5s
    Press Keys    ${ASSIGN_TO_SELECT_COMPANY_INPUT}   ENTER

    Sleep    1.5s


Select Site
    [Documentation]    Selects a site from the dropdown using keyboard navigation.

    Click Element    ${ASSIGN_TO_SELECT_SITE}
    Wait Until Element Is Visible    ${ASSIGN_TO_SELECT_SITE_INPUT}    timeout=5s

    Press Keys    ${ASSIGN_TO_SELECT_SITE_INPUT}   ENTER

    Sleep    1.5s

Select Project
    [Documentation]    Selects a project from the dropdown using keyboard navigation.

    Click Element    ${ASSIGN_TO_SELECT_PROJECT} 
    Wait Until Element Is Visible    ${ASSIGN_TO_SELECT_PROJECT_INPUT}    timeout=5s

    Press Keys    ${ASSIGN_TO_SELECT_PROJECT_INPUT}        ENTER
    Sleep    1.5s

Select All Users 
    [Documentation]             Select all users from the Company

    Wait Until Element Is Visible    ${USERS_SELECTION}     timeout=5s
    Click Element    ${ALL_USERS_SELECTION}
    Wait Until Element Contains    ${ALL_USERS_SELECTION}    all users    timeout=5s

    Log    Successfully selected "All Users" in Assign To section.

    Sleep     1s

Select Only Specific Users
    [Documentation]    Selects "Only Specific Users" and picks users from the dropdown list.

    [Arguments]    @{user_names}  # List of users to select

    Click Element    ${SPECIFIC_USERS_SELECTION}
    # Wait for the user selection dropdown to appear
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'add-users-dropdown')]    timeout=5s

    # Select Users Based on the Provided Names
    FOR    ${user}    IN    @{user_names}
        ${user_xpath} =    Set Variable    xpath=//div[contains(@class, 'add-users-dropdown')]//p[contains(@class, 'user-name') and text()='${user}']
        Wait Until Element Is Visible    ${user_xpath}    timeout=3s
        Click Element    ${user_xpath}/ancestor::div[contains(@class, 'add-users-dropdown__list-item')]
        Log    Selected user: ${user}
    END

    # Confirm Selection
    Click Element    xpath=//button[contains(@class, 'add-users-dropdown__buttons-confirm')]

    Log    Successfully selected and confirmed users: ${user_names}


Enter Attachment URL
    [Arguments]    ${url}  
    [Documentation]    Enters a URL in the attachment input field.
    
    Click Element    ${ATTACHEMENT_URL}
    Wait Until Element Is Visible    ${ATTACHEMENT_URL}    timeout=5s
    Input Text    ${ATTACHEMENT_URL}    ${url}  

    # Verify the URL was entered correctly
    ${entered_url} =    Get Value    ${ATTACHEMENT_URL}
    Should Contain    ${entered_url}    ${url}  

    Log    Successfully entered attachment URL: ${entered_url}

    Sleep    2s

Attach File
    [Documentation]    Uploads a file using the attachment upload button.
    
    [Arguments]    ${file_path}

    Wait Until Element Is Visible    ${ATTACHEMENT_FILE}   timeout=5s
    Choose File    ${ATTACHEMENT_FILE}    ${file_path}

    # Log success message
    Log    Successfully uploaded file: ${file_path}


Click Next Step Button
    [Documentation]    Clicks the "Next Step" button in the form.

    Wait Until Element Is Visible    ${NEXT_STEP_BUTTON}    timeout=5s
    Click Element    ${NEXT_STEP_BUTTON}

    Wait Until Element Is Visible    xpath=//div[@id='questionsStep.min_score']//div[contains(@class, 'react-select__control')]    timeout=5s

    Log    Successfully clicked "Next Step" button and verified next page.

    Sleep     1s



#########ToolBox Meeting Questions Step Keywords#########

Click Add New Question Button
    [Documentation]    Clicks the "Add New Question" button in the TBM question form.

    # Wait for the button to be visible
    Wait Until Element Is Visible    ${ADD_NEW_QUESTION_BUTTON}    timeout=5s

    # Click the button
    Click Element    ${ADD_NEW_QUESTION_BUTTON}

    Log    Successfully clicked the "Add New Question" button.

    Sleep     1s



Fill Question And Select Answer
    [Documentation]    Fills only the available question inputs and selects answers (Yes/No).

    [Arguments]    ${questions_list}    ${answers_list}

    # Get total available question divs
    ${question_count} =    Get Element Count    ${QUESTION_INPUT_FIELD}

    Log    Total questions found: ${question_count}

    FOR    ${index}    IN RANGE    ${question_count}
        ${question_input_xpath} =    Set Variable    xpath=(//textarea[contains(@id, 'questionsStep.questions')])[position()=${index + 1}]
        ${answer_button_xpath} =    Set Variable     xpath=(//div[contains(@class, 'tbm-form-question__question-btns')])[position()=${index + 1}]

        # Ensure input field exists before interacting with it
        Wait Until Element Is Visible    ${question_input_xpath}    timeout=5s

        # Fill question text
        Input Text    ${question_input_xpath}    ${questions_list}[${index}]
        Log    Successfully entered question: ${questions_list}[${index}]

        # Select answer (Yes/No)
        ${answer_option} =    Get From List    ${answers_list}    ${index}
        Run Keyword If    '${answer_option}' == 'Yes'    Click Element    ${answer_button_xpath}//button[text()='Yes']
        Run Keyword If    '${answer_option}' == 'No'    Click Element    ${answer_button_xpath}//button[text()='No']

        Log    Selected answer option: ${answer_option}
    END



Ensure Questions Are Loaded
    [Arguments]    ${expected_count}
    ${actual_count} =    Get Element Count    ${QUESTIONS_CONTAINER}
    Should Be Equal As Integers    ${actual_count}    ${expected_count}


Creating Questions

    # Define Questions and Answers
    ${questions_list}    Create List    What is your name?    What is your Age?    What is your Gender?    What is your Smart?   
    ${answers_list}      Create List    No    Yes    Yes    No

    Log    Get Length ${questions_list}
    # Click "Add New Question" button for each new question
    ${expected_question_count} =    Get Length    ${questions_list}
    Log    ${expected_question_count}
    FOR    ${i}    IN RANGE    ${expected_question_count}
        Click Add New Question Button
        Sleep    0.1s    # Wait for the new question to load
    END

    # Fill questions and select answers
    Fill Question And Select Answer    ${questions_list}    ${answers_list}

    # Verify all questions are filled correctly
    ${question_count} =    Get Element Count    ${QUESTION_INPUT_FIELD}
    FOR    ${index}    IN RANGE    ${question_count}
        ${entered_text} =    Get Element Attribute    xpath=(//textarea[contains(@id, 'questionsStep.questions')])[position()=${index + 1}]    value
        Should Be Equal    ${entered_text}    ${questions_list}[${index}]
    END


Select Minimum Passing Score
    [Documentation]    Selects a specified minimum passing score from the dropdown.
    
    Click Element    ${PASSING_SCORE_DROPDOWN}
    Wait Until Element Is Visible    ${PASSING_SCORE_INPUT}    timeout=5s
    Press Keys    ${PASSING_SCORE_INPUT}    ENTER

    Log    Successfully selected passing score.

    Sleep    1s

Select Reminder Status And Time
    [Documentation]    Selects a specified reminder status and reminder time from dropdowns.


    # Click to activate the Reminder Status dropdown
    Click Element    ${REMINDER_STATUS_DROPDOWN}
    Wait Until Element Is Visible    ${REMINDER_STATUS_INPUT}    timeout=5s
    Press Keys    ${REMINDER_STATUS_INPUT}    ENTER

    Sleep    1s

    # Click to activate the Reminder Time dropdown
    Click Element    ${REMINDER_TIME_DROPDOWN}
    Press Keys    ${REMINDER_TIME_INPUT}    ENTER

    Log    Successfully selected reminder time.

    Sleep    1s

Click Submit Button
    [Documentation]    Clicks the "Submit" button after ensuring it is visible.

    Wait Until Element Is Visible    ${SUBMIT_BUTTON}    timeout=5s
    Click Element    ${SUBMIT_BUTTON}

    Log    Successfully clicked the Submit button.