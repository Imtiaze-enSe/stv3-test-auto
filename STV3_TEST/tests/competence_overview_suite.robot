*** Settings ***
Documentation     Test suite for required documents creation and filters check
Library           SeleniumLibrary
Resource          ../ressources/HELPERS/overviewHelpers.resource
Resource          ../ressources/HELPERS/common.resource
Resource          ../ressources/VARIABLES/Globals.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers


*** Test Cases ***
Test Search Filter
    Navigate to Overview page
    ${search_term}=    Get Variable Value    ${SEARCHED_USER_NAME}
    Apply Search Filter                      ${search_term}
    Check Search Result                      ${search_term}
    sleep     2s
    Reset Filters

Test Topic Filter
    Apply Resource Filter         ${SELECT_TOPIC_BTN}               ${SEARCHED_TOPIC_NAME}
    Verify Topic Filter           ${SEARCHED_TOPIC_NAME}    
    Sleep    1s
Test Certificate Filter
    Apply Resource Filter          ${SELECT_CERTIFICATE_BTN}         ${SEARCHED_CERTIFICATE}
    Verify Certificate Filter      ${SEARCHED_CERTIFICATE}    
    Sleep    1s
    Reset Filters
    
Test User Type Internal Filter
    Select User Type Filter    internal
    Verify User Types    Internal
    Sleep    1s
    Reset Filters
    
Test User Type External Filter
    Select User Type Filter    external
    Verify User Types    External
    Sleep    1s
    Reset Filters
