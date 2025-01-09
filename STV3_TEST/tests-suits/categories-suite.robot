*** Settings ***
Documentation     Test suite for Categories and Certifications management
Library           SeleniumLibrary
Resource          ${CURDIR}/../ressources/HELPERS/categoriesHelpers.resource
Resource          ${CURDIR}/../ressources/HELPERS/certificationsHelpers.resource
Resource          ${CURDIR}/../ressources/HELPERS/topicsHelpers.resource
Resource          ../ressources/HELPERS/common.resource
Resource          ${CURDIR}/../ressources/VARIABLES/Globals.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers


*** Test Cases ***
Create New Category
    [Documentation]    Test the creation of a new category
    [Tags]    smoke    categories    create
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To Categories Section
    Click Add New Category Button
    ${random_string}=    Generate Random String
    ${created_category_name}=    Set Variable       ${PREFIX}${random_string} 
    Append To List                                  ${CREATED_CATEGORIES}                ${created_category_name}
    Set Global Variable                             ${GLOBAL_CATEGORY_NAME}              ${created_category_name}   
    Create New Category                             ${created_category_name}
    Success Message Should Be Visible               Category added successfully
    Category Should Exist In List                   ${created_category_name}
    Wait Until Page Does Not Contain                Category added successfully        timeout=${TIMEOUT}

Edit Existing Category
    [Documentation]    Test the editing of an existing category
    [Tags]    categories    edit
    ${edited_category_name}=    Set Variable    Edited Category
    ${selected_category}=    Get Variable Value        ${GLOBAL_CATEGORY_NAME}
    Select Resource                                    ${GLOBAL_CATEGORY_NAME}
    Click Edit Resource Button                         ${GLOBAL_CATEGORY_NAME}
    Input Resource Details With Description            name=${edited_category_name}        path_to_icon=${PATH_TO_CAT_ICON}    description=Updated Category Description
    Submit Edit Resource Form
    Success Message Should Be Visible               Category updated successfully
    Category Should Exist In List                   ${edited_category_name}  
    Set Global Variable                             ${GLOBAL_CATEGORY_NAME}    ${edited_category_name}                  

Create Topic For Category
    [Documentation]    Test creating a topic for a category
    [Tags]    topics    create
    ${edited_category_name}=    Get Variable Value    ${GLOBAL_CATEGORY_NAME}
    Select Category To Create Certificate             ${edited_category_name}
    Click Add New Topic Button
    ${random_string}=    Generate Random String
    ${created_topic_name}=    Set Variable            ${TOPIC_PREFIX}${random_string}
    Set Global Variable                               ${GLOBAL_TOPIC_NAME}            ${created_topic_name}
    Create New Topic                                  ${created_topic_name}
    Success Message Should Be Visible                  Topic added successfully
    Topic Should Exist In List                        ${created_topic_name}

Edit Existing Topic
    [Documentation]    Test the editing of an existing topic
    [Tags]    topics    edit
    ${edited_topic_name}=    Set Variable                 Edited Topic
    ${selected_topic}=    Get Variable Value              ${GLOBAL_TOPIC_NAME}
    Select Resource                                       ${GLOBAL_TOPIC_NAME}
    Click Edit Resource Button                            ${GLOBAL_TOPIC_NAME}
    Input Resource Details With Description               name=${edited_topic_name}    path_to_icon=${PATH_TO_TOPIC_ICON}    description=Updated Topic Description
    Submit Edit Resource Form
    Success Message Should Be Visible                     Topic updated successfully
    Certification Should Exist In List                    ${edited_topic_name}  
    Set Global Variable           ${GLOBAL_TOPIC_NAME}    ${edited_topic_name}

Create Certification For Topic
    [Documentation]    Test creating a certification for a topic
    [Tags]    certifications    create
    ${edited_topic_name}=    Get Variable Value        ${GLOBAL_TOPIC_NAME}
    Select Topic To Create Certificate                 ${edited_topic_name}
    Click Add New Certification Button
    ${random_string}=    Generate Random String
    ${created_certificate_name}=    Set Variable       ${CERTIF_PREFIX}${random_string}
    Set Global Variable                                ${GLOBAL_CERTIFICATION_NAME}            ${created_certificate_name}
    Create New Certificate                             ${created_certificate_name}
    Success Message Should Be Visible                  Certificate added successfully
    Certification Should Exist In List                 ${created_certificate_name}

Edit Existing Certification
    [Documentation]    Test the editing of an existing certificate
    [Tags]    cert    edit
    ${edited_certification_name}=    Set Variable         Edited Certification
    ${selected_certificate}=    Get Variable Value        ${GLOBAL_CERTIFICATION_NAME}
    Select Resource                                       ${GLOBAL_CERTIFICATION_NAME}
    Click Edit Resource Button                            ${GLOBAL_CERTIFICATION_NAME}
    Input Resource Details With Description               name=${edited_certification_name}        path_to_icon=${PATH_TO_CERT_ICON}    description=Updated Certification Description
    Submit Edit Resource Form
    Success Message Should Be Visible                      Certificate updated successfully
    Certification Should Exist In List                     ${edited_certification_name}  
    Set Global Variable    ${GLOBAL_CERTIFICATION_NAME}    ${edited_certification_name}

Delete A Certification
    [Documentation]    Test deleting a certification
    [Tags]    certificates    delete
    Select Resource                                        ${GLOBAL_CERTIFICATION_NAME}        
    Click Delete Resource Button                           ${GLOBAL_CERTIFICATION_NAME}
    Confirm Delete Action
    Success Message Should Be Visible                     Certificate deleted successfully
    Category Should Not Exist In List                     ${GLOBAL_CERTIFICATION_NAME}

Delete A Topic 
    [Documentation]    Test deleting a topic
    [Tags]    topics    delete
    Select Resource                                        ${GLOBAL_TOPIC_NAME}        
    Click Delete Resource Button                           ${GLOBAL_TOPIC_NAME}
    Confirm Delete Action
    Success Message Should Be Visible                     Topic deleted successfully
    Topic Should Not Exist In List                        ${GLOBAL_TOPIC_NAME}

Delete A Category 
    [Documentation]    Test deleting a Category
    [Tags]    categories    delete
    Select Resource                                        ${GLOBAL_CATEGORY_NAME}        
    Click Delete Resource Button                           ${GLOBAL_CATEGORY_NAME}
    Confirm Delete Action
    Success Message Should Be Visible                      Category deleted successfully
    Category Should Not Exist In List                      ${GLOBAL_CATEGORY_NAME}



