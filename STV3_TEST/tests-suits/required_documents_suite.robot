*** Settings ***
Documentation     Test suite for required documents creation and filters check
Library           SeleniumLibrary
Resource          ${CURDIR}/../ressources/HELPERS/requiredDocHelpers.resource
Resource          ${CURDIR}/../ressources/HELPERS/common.resource
Resource          ${CURDIR}/../ressources/VARIABLES/Globals.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers


*** Test Cases ***
Create a New Document
    [Documentation]    Test the creation of a new document
    [Tags]    smoke    DOCUMENTS    create
    ${random_string}=    Generate Random String
    ${created_document_name}=    Set Variable       Doc_${random_string}
    Login To Application                     ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Required Documents Section
    Click Add New Doc button
    Fill out the Addition Form               ${created_document_name}
    Submit the Form
    Set Global Variable                      ${GLOBAL_DOC_NAME}            ${created_document_name}
    Success Message Should Be Visible        Document added successfully
    

Test Search Filter
    ${search_term}=    Get Variable Value    ${GLOBAL_DOC_NAME}
    Apply Search Filter                      ${search_term}
    Verify Filter Results                    ${search_term}
    Reset Filters

Test Document Type Filter
    Select Document Type     Internal
    Verify Filter Results    Internal     External
    Sleep    1s
    Reset Filters
    Select Document Type     External
    Verify Filter Results    External     Internal
    Sleep    1s
    Reset Filters

Test Combined Filters
    ${search_term}=    Get Variable Value        ${GLOBAL_DOC_NAME}
    Apply Search Filter                          ${search_term}
    Select Document Type                         Internal
    Verify Filter Results                        ${search_term}
    Verify Filter Results                        Internal 
    Reset Filters

Delete Document
    ${doc_name}=    Get Variable Value        ${GLOBAL_DOC_NAME}
    Apply Search Filter                       ${doc_name}
    Wait Until Page Contains                  ${doc_name}   
    Select Document By Name                   ${doc_name}
    Verify Delete Button Appears
    Click Delete Button
    Verify Confirmation Dialog                ${doc_name}
    Confirm Deletion
    Delete Document After Confirmation
    Success Message Should Be Visible         The Document has been deleted successfully
    Verify Document Deleted                   ${doc_name}