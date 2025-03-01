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
 Test Predefined Date Filters
    [Documentation]    Test each predefined date filter option
    Login To Application                                ${VALID_USERNAME}                 ${VALID_PASSWORD}
    Navigate to Observations info Page
    Wait Until Element Is Visible                       ${FILTERS_BTN}
    Click Element                                       ${FILTERS_BTN}
    Apply different date filters

Test Custom Date Filter
    [Documentation]    Test custom date range filter
    ${current_year_month}    Get Current Date    result_format=%Y-%m
    ${start_date}    Set Variable    ${current_year_month}-02
    ${end_date}    Set Variable    ${current_year_month}-26
    # Log    Start Date: ${start_date}
    # Log    End Date: ${end_date}
    Apply Custom Date Range    ${start_date}    ${end_date}
    # Convert dates for validation
    ${start_dt}=    Convert Date    ${start_date}    result_format=%d %b %Y
    ${end_dt}=    Convert Date    ${end_date}        result_format=%d %b %Y
    
    Validate Card Dates    ${start_dt}    ${end_dt}
    Go Back to Filters Page

Test Location Filter Functionality
    [Documentation]    Tests the location filter by selecting values and verifying card details
    Open Filter dropdown                                ${LOCATION_DROPDOWN}
    # Select location values
    Select Client Option      ${CLIENT_DROPDOWN}           ${CLIENT_DROPDOWN}        company_logo_1_173564
    Select Location Option    ${SITE_DROPDOWN}              Wanze
    Select Location Option    ${PROJECT_DROPDOWN}           Project 3
    Select Location Option    ${ZONE_DROPDOWN}              Quai de déchargement
    Select Location Option    ${LEVEL_DROPDOWN}             0
    Apply Filter
    Verify Card Location Details    
    ...    expected_client=company_logo_1_173564    
    ...    expected_site=Wanze    
    ...    expected_project=Project 3   
    ...    expected_zone=Z01    
    ...    expected_level=0

# Test Multiple Location Combinations
#     [Documentation]    Tests different combinations of location filters
#     Go Back to Filters Page
#     Open Filter dropdown      ${LOCATION_DROPDOWN}
#     Select Client Option      ${CLIENT_DROPDOWN}           ${CLIENT_DROPDOWN}        company_logo_1_173564
#     Select Location Option    ${SITE_DROPDOWN}     Wanze
#     Apply Filter
#     Verify Card Location Details    
#     ...    expected_client=company_logo_1_173564     
#     ...    expected_site=Wanze
#     ...    expected_project=${EMPTY}
#     ...    expected_zone=${EMPTY}
#     ...    expected_level=${EMPTY}
   
Test Progress Filters
    [Documentation]    Test each predefined progress filter option
    Go Back to Filters Page
    Test different progress filter options

Test Equipment Filters
    [Documentation]    Test each predefined equipment filter option
    Select equipment option     equipement test
    Validate Card Equipment     equipement test

Test Types Filters
    [Documentation]    Test each predefined type filter option
    Go Back to Filters Page
    Wait Until Page Contains Element                    xpath=//div[@class="ins-obs-filter__menu"]//div[5]
    Test different types filter options

Test Classifications Filter
    [Documentation]    Test each predefined classification filter option
    Wait Until Page Contains Element                    xpath=//div[@class="ins-obs-filter__menu"]//div[5]
    Test different classification filter options        ${CLASSIFICATION_OPTION_FILTER}

Test Category Filter
    [Documentation]    Test each predefined category filter option
    Wait Until Page Contains Element                    xpath=//div[@class="ins-obs-filter__menu"]//div[5]
    Apply Category filters                              ${CATEGORY_FILTER_CHOICE}        ${SUB-CATEGORY_CHOICE}        ${TAGS_CATEGORY_CHOICE}

Test Status Filter
    [Documentation]    Test each predefined status filter option
    Wait Until Page Contains Element                    xpath=//div[@class="ins-obs-filter__menu"]//div[6]
    Apply Status filter                                 ${STATUS_CHOISEN_OPTION}

Test Mode Filter
    [Documentation]    Test each predefined mode filter option
    Test different mode filter options

Test Assignee Filter
    [Documentation]    Test predefined Assignee filter option
    Apply Assignee filter                               ${CHOSEN_COMPANY}      ${CHOSEN_MANAGER} 
         
    
