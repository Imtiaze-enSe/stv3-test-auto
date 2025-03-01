*** Settings ***
Documentation     Test suite for Categories and Certifications management
Library           SeleniumLibrary
Library           DateTime
Resource          ../../ressources/HELPERS/Instant_observ/observationCreationHelpers.resource
Resource          ../../ressources/HELPERS/common.resource
Resource          ../../ressources/VARIABLES/Globals.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers


*** Test Cases ***
Create New Observation
    Login To Application                                ${VALID_USERNAME}                 ${VALID_PASSWORD}
    Navigate to Observations info Page
    ${random_string}=    Generate Random String
    ${created_observation_name}=    Set Variable        ${PREFIX}${random_string}
    Click the add new button
    Fill out General info Form                          text address N 01    Dangerous act    Conditions climatiques    Condition estivale    ${STATUS_INPUT}
    Sleep    2s
    Go to next step
    Fill out Observation Details Form                   ${created_observation_name}    This is a description of the created observation
    Sleep    2s
    Fill Out Positives and issues Form                  This is a very good act from emplyees    this is an issue     But here is the solution
    Set Global Variable                                 ${GLOBAL_OBSERV_NAME}              ${created_observation_name}
    Log    ${GLOBAL_OBSERV_NAME}
    Sleep    2s
    Submit the form and check creation
    Success Message Should Be Visible                    Observation successfully created

Edit Existing Observation
    [Documentation]    Test the editing of an existing Observation
    [Tags]    Observation    edit
    ${random_string}=    Generate Random String
    ${edited_observation_name}=    Set Variable          ${EDIT_PRFX}${random_string}
    ${selected_observation}=    Get Variable Value               ${GLOBAL_OBSERV_NAME}
    Search For an Observation                                    ${selected_observation}
    Go to Edition form                                   ${selected_observation}
    Edit General info Form
    Sleep    2s
    Go to next step
    Edit Observation Details Form                        ${edited_observation_name}
    Sleep    2s
    Edit Positives and issues Form                       This is a edited good act from emplyees    this is edited an issue     But here is the edited solution
    Submit Edit Resource Form
    Success Message Should Be Visible                    Observation successfully updated  
    Set Global Variable                                  ${GLOBAL_OBSERV_NAME}    ${edited_observation_name}
