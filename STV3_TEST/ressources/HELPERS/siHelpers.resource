*** Settings ***
Documentation     Page objects and keywords for Categories management
Library           SeleniumLibrary
Library           OperatingSystem
Library           Collections
Library           DateTime
Resource          ../VARIABLES/siVariables.resource
Resource          ../VARIABLES/Globals.resource
Resource          common.resource



*** Keywords ***

Navigate To SI Section

    [Documentation]    Clicks the "Settings" icon in the sidebar.

    Wait Until Element Is Visible    ${SIDEBAR_ELEMENT}
    Click Element                    ${SIDEBAR_ELEMENT}
    Wait Until Element Is Visible    ${AUDITS_AND_INSPECTIONS}    timeout=5s
    Mouse Over                       ${AUDITS_AND_INSPECTIONS} 
    Wait Until Element Is Visible    ${SI_SETTINGS_ICON}   
    Click Element    ${SI_SETTINGS_ICON} 

    Log    Successfully clicked the Settings icon in the sidebar.


Click Absence Reasons Tab

    [Documentation]    Clicks the "Absence reasons" tab in the Inspection Observations settings.
    Wait Until Element Is Visible    ${ABSENCE_REASONS_TAB}    timeout=5s

    Click Element    ${ABSENCE_REASONS_TAB}

    Log    Successfully clicked on the "Absence reasons" tab.


Click Rejection Reasons Tab
    [Documentation]    Clicks the "Rejection reasons" tab in the Inspection Observations settings.

    Wait Until Element Is Visible    ${Rejection_REASONS_TAB}    timeout=5s

    Click Element    ${Rejection_REASONS_TAB}

    Log    Successfully clicked on the "Rejection reasons" tab.

Click Cancelation Reasons Tab
    [Documentation]    Clicks the "Cancelation reasons" tab in the Inspection Observations settings.

    Wait Until Element Is Visible    ${Cancelation_REASONS_TAB}    timeout=5s

    Click Element    ${Cancelation_REASONS_TAB}

    Log    Successfully clicked on the "Cancelation reasons" tab.

Click Postpone Reasons Tab
    [Documentation]    Clicks the "Postpone reasons" tab in the Inspection Observations settings.

    Wait Until Element Is Visible    ${Postpone_REASONS_TAB}    timeout=5s

    Click Element    ${Postpone_REASONS_TAB}

    Log    Successfully clicked on the "Postpone reasons" tab.

Click New Reason Button 

    [Documentation]    Clicks the "New Reason" button.

    Wait Until Element Is Visible    ${ADD_NEW_REASON} 

    Click Element    ${ADD_NEW_REASON} 

    Log    Successfully clicked on the "New Reason" button.

Click Delete Reason

    [Documentation]    Clicks the Delete icon

    Click Element    ${LAST_ROW_DEL_BUTTON}

    Handle Delete Modal

    Log    Successfully Reason deleted.

Click Add New Template 

    [Documentation]    Clicks "Add a new template" button and waits for the template title input field to appear.

    Wait Until Element Is Visible    ${ADD_NEW_TEMPLATE_BUTTON}    timeout=5s

    Click Element    ${ADD_NEW_TEMPLATE_BUTTON}

    Wait Until Element Is Visible    ${TEMPLATE_TITLE_INPUT}    

    Log    Successfully navigated to the template creation page.

Input Template Title Details
    [Arguments]    ${title}   

    Wait Until Element Is Visible    ${TEMPLATE_TITLE_INPUT}    

    Input Text                       ${TEMPLATE_TITLE_INPUT}    ${title}

Select Category Dropdown
    [Documentation]    Selects an option from the "Category" dropdown using keyboard navigation.

    Click Element    ${CATEGORY_DROPDOWN}
    Wait Until Element Is Visible    ${CATEGORY_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${CATEGORY_DROPDOWN_INPUT}    ENTER
    Log    Successfully selected an option from the Category dropdown.

Select Type Dropdown
    [Documentation]    Selects an option from the "Type" dropdown using keyboard navigation.

    Click Element    ${TYPE_DROPDOWN}
    Wait Until Element Is Visible    ${TYPE_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${TYPE_DROPDOWN_INPUT}    ENTER
    Log    Successfully selected an option from the Type dropdown.

Select Periodicity Dropdown
    [Documentation]    Selects an option from the "Periodicity" dropdown using keyboard navigation.

    Click Element    ${PERIODICITY_DROPDOWN}
    Wait Until Element Is Visible    ${PERIODICITY_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${PERIODICITY_DROPDOWN_INPUT}    ENTER
    Log    Successfully selected an option from the Periodicity dropdown.

Select Assign To Dropdown
    [Documentation]    Selects an option from the "Assign To" dropdown using keyboard navigation.

    Click Element    ${ASSIGN_TO_DROPDOWN}
    Wait Until Element Is Visible    ${ASSIGN_TO_DROPDOWN_INPUT}    timeout=5s
    Press Keys    ${ASSIGN_TO_DROPDOWN_INPUT}    ENTER
    Log    Successfully selected an option from the Assign To dropdown.


DropDown Selection
    [Documentation]    Selects options from all required dropdowns in the form.

    Select Category Dropdown
    Select Type Dropdown
    Select Periodicity Dropdown
    Select Assign To Dropdown

    Log    Successfully selected options from all dropdowns.

Handle Dynamic Questions

    [Documentation]    Handles adding dynamic questions and breaks when required_feedbacks index reaches 2.

    Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].title']      Topic Title ${TOPIC_INDEX}
    Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].description']    Topic Description ${TOPIC_INDEX}
    
    ${button_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add NEW question')]

    WHILE    ${button_exists} == ${True}

        Input Text    xpath=//textarea[@name='topics[${TOPIC_INDEX}].required_feedbacks[${QUESTION_INDEX}].title']    Question ${QUESTION_INDEX}
        Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].required_feedbacks[${QUESTION_INDEX}].description']    Additional Text ${QUESTION_INDEX}

        ${QUESTION_INDEX}    Evaluate    ${QUESTION_INDEX} + 1
        
        # Break the loop if QUESTION_INDEX reaches 2
        IF    ${QUESTION_INDEX} == 2
            Log    Reached the limit of 2 questions. Breaking the loop.
            BREAK
        END

        Click Element    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add NEW question')]


        # Check again if the button still exists for another loop iteration
        ${button_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add NEW question')]

    END

    Log    Successfully added ${QUESTION_INDEX} questions to topic ${TOPIC_INDEX}.



Handle Dynamic Topics

    ${button_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add new Topic')]

    WHILE    ${button_exists} == ${True}

        
        ${button_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='add-new-topic']

        Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].title']      Topic Title ${TOPIC_INDEX}
        Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].description']    Topic Description ${TOPIC_INDEX}
        
        ${buttonE_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//input[@name='topics[${TOPIC_INDEX}].title']//following::p[contains(text(),'Add NEW question')]
        
        ${QUESTION_INDEX}    Set Variable    0

        WHILE    ${buttonE_exists} == ${True}

            
            Input Text    xpath=//textarea[@name='topics[${TOPIC_INDEX}].required_feedbacks[${QUESTION_INDEX}].title']    Question ${QUESTION_INDEX}
            Input Text    xpath=//input[@name='topics[${TOPIC_INDEX}].required_feedbacks[${QUESTION_INDEX}].description']    Additional Text ${QUESTION_INDEX}

            ${QUESTION_INDEX}    Evaluate    ${QUESTION_INDEX} + 1
            
            # Break the loop if QUESTION_INDEX reaches 2
            IF    ${QUESTION_INDEX} == 2
                Log    Reached the limit of 2 questions. Breaking the loop.
                BREAK
            END
            
            Click Element    xpath=//input[@name='topics[${TOPIC_INDEX}].title']//following::p[contains(text(),'Add NEW question')]


            # Check again if the button still exists for another loop iteration
            ${buttonE_exists}    Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add NEW question')]

        END
            

        ${TOPIC_INDEX}    Evaluate    ${TOPIC_INDEX} + 1

        # Check again if the button still exists for another loop iteration
        IF    ${TOPIC_INDEX} == 3
            Log    Reached the limit of 2 topics. Breaking the loop.
            BREAK
        END


        Click Element    xpath=//div[@class='add-new-topic']//p[contains(text(),'Add new Topic')]
        
    END

    Log    Successfully added ${TOPIC_INDEX} topics.



Edit All Topics Dynamically
    [Documentation]    Edits all topics dynamically in the form by counting available topics.

    # Get the total number of topics (count how many topic containers exist)
    ${TOTAL_TOPICS}    Get Element Count    xpath=//div[contains(@class, 'topic-container')]
    
    # Iterate over each topic
    FOR    ${INDEX}    IN RANGE    ${TOTAL_TOPICS}
        
        # Edit the topic title
        ${TOPIC_TITLE_INPUT}    Set Variable    xpath=//input[@name='topics[${INDEX}].title']
        Clear Element Text    ${TOPIC_TITLE_INPUT}
        Input Text    ${TOPIC_TITLE_INPUT}    Edited Topic Title ${INDEX}

        # Edit the topic description
        ${TOPIC_DESCRIPTION_INPUT}    Set Variable    xpath=//input[@name='topics[${INDEX}].description']
        Clear Element Text    ${TOPIC_DESCRIPTION_INPUT}
        Input Text    ${TOPIC_DESCRIPTION_INPUT}    Edited Topic Description ${INDEX}

        # Get the number of questions in the current topic
        ${TOTAL_QUESTIONS}    Get Element Count    xpath=//textarea[contains(@name, 'topics[${INDEX}].required_feedbacks')]

        # Iterate over each question inside the topic
        FOR    ${QUESTION_INDEX}    IN RANGE    ${TOTAL_QUESTIONS}

            # Edit the question text
            ${QUESTION_INPUT}    Set Variable    xpath=//textarea[@name='topics[${INDEX}].required_feedbacks[${QUESTION_INDEX}].title']
            Clear Element Text    ${QUESTION_INPUT}
            Input Text    ${QUESTION_INPUT}    Edited Question ${QUESTION_INDEX}

            # Edit the additional text field if available
            ${QUESTION_DESCRIPTION_INPUT}    Set Variable    xpath=//input[@name='topics[${INDEX}].required_feedbacks[${QUESTION_INDEX}].description']
            Run Keyword And Ignore Error    Clear Element Text    ${QUESTION_DESCRIPTION_INPUT}
            Run Keyword And Ignore Error    Input Text    ${QUESTION_DESCRIPTION_INPUT}    Edited Additional Text ${QUESTION_INDEX}

        END

        Log    Successfully edited topic ${INDEX} with ${TOTAL_QUESTIONS} questions.

    END

    Log    Successfully edited all ${TOTAL_TOPICS} topics.


Click Create Button

    [Documentation]    Clicks the "Create" button in the template creation process.

    Wait Until Element Is Visible      ${CREATE_TEMPLATE_BUTTON}        timeout=5s

    Click Element    ${CREATE_TEMPLATE_BUTTON}

    Log    Successfully clicked the "Create" button.

Click Duplicate Option from Dropdown
    [Documentation]    Clicks the "Duplicate" option from the template card action dropdown.

    Wait Until Element Is Visible    ${CARD_ACTION_BUTTON_DUPLICATE}    timeout=5s

    Click Element    ${CARD_ACTION_BUTTON_DUPLICATE}

    Log    Successfully clicked the "Duplicate" option.

Click Edit Option from Dropdown
    [Documentation]    Clicks the "Duplicate" option from the template card action dropdown.

    Wait Until Element Is Visible    ${CARD_ACTION_BUTTON_EDIT}    timeout=5s

    Click Element    ${CARD_ACTION_BUTTON_EDIT}

    Log    Successfully clicked the "Edit" option.

Delete Template via Action Dropdown
    [Documentation]    Clicks "Delete" from the action dropdown, handles the confirmation modal, checks the confirmation checkbox, and confirms deletion.

    Wait Until Element Is Visible    ${CARD_ACTION_BUTTON_DEL}    timeout=5s
    Click Element    ${CARD_ACTION_BUTTON_DEL}

    Handle Delete Modal

Handle Delete Modal
    [Documentation]    Handles the delete confirmation modal, checks the confirmation checkbox, and confirms deletion.

    Wait Until Element Is Visible    ${MODAL_DEL}    timeout=5s

    Click Element    ${CHECKBOX_MODAL_DEL}

    Click Element    ${BTN_CONFIRMATION_MODAL_DEL}

    Log    Successfully deleted the template.

Click Template Card Action Button
    [Documentation]    Clicks the action button in a template card to open the dropdown menu.

    Wait Until Element Is Visible    ${CARD_ACTION_BUTTON}    timeout=5s

    Click Element    ${CARD_ACTION_BUTTON}

    Log    Successfully clicked the action button inside the template card.

Search Template
    [Documentation]    Inputs a search term in the search bar and verifies the results.
    
    [Arguments]    ${search_term}
    
    # Wait until the search bar is visible
    Wait Until Element Is Visible    ${SEARCH_BAR}    timeout=5s
    
    # Input the search term
    Input Text    ${SEARCH_BAR}    ${search_term}
    
    # Log action
    Log    Successfully entered '${search_term}' in the search bar.
    

Fill Last Table Row

    [Documentation]    Fills the last row in the table with data and saves it.

    [Arguments]    ${reason_text}    ${description_text}    ${icon_path}

    Wait Until Element Is Visible    ${TABLE_CONTENT}    timeout=5s

    Wait Until Element Is Visible    ${LAST_ROW_REASON_INPUT}    timeout=3s
    Input Text    ${LAST_ROW_REASON_INPUT}    ${reason_text}

    Wait Until Element Is Visible    ${LAST_ROW_DESCRIPTION_INPUT}    timeout=3s
    Input Text    ${LAST_ROW_DESCRIPTION_INPUT}    ${description_text}

    # Upload an icon if provided
    Run Keyword If    '${icon_path}' != ''  
    ...    Choose File    ${LAST_ROW_ICON_UPLOAD}    ${icon_path}

    Wait Until Element Is Visible    ${LAST_ROW_SAVE_BUTTON}    timeout=3s
    Click Element    ${LAST_ROW_SAVE_BUTTON}

    Log    Successfully filled the last row in the table.

