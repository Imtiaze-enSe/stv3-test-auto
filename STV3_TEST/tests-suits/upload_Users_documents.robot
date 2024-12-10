*** Settings ***
Documentation     Test suite for required documents creation and filters check
Library           SeleniumLibrary
Resource          ${EXECDIR}/ressources/HELPERS/uploadUserDocHelpers.resource
Resource          ${EXECDIR}/ressources/HELPERS/common.resource
Resource          ${EXECDIR}/ressources/VARIABLES/Globals.resource
Suite Setup       Open Browser To Application
# Suite Teardown    Close All Browsers


*** Test Cases ***
Upload Document For A User
    Navigate to users page                           ${VALID_USERNAME}   ${VALID_PASSWORD}
    Select a User From the List                      ${USERS_SEARCH_BAR}     ${USER_NAME}   ${APLLY_SEARCH_BTN}
    Go to Required Document Page
    Upload Document On behalf of User                ${DOC_TO_UPLOAD_NAME}
    Verify That the Document is well Uploaded        ${DOC_TO_UPLOAD_NAME}

Upload Certificate For A User
    Go to Required Certificate Page
    Upload Document On behalf of User                ${CERTIFICATE_TO_UPLOAD}
    Verify That the Document is well Uploaded        ${CERTIFICATE_TO_UPLOAD}
    [Teardown]    Close Browser
    
# Validate Uploaded Document As A Manager
#     Open Browser To Application
#     Navigate to users page                           ${MANAGER_USERNAME}            ${VALID_PASSWORD}
#     Select a User From the List                      ${USERS_SEARCH_BAR_MANAGER}    ${USER_UNDER_MANAGER}        ${APLLY_SEARCH_BTN_MANAGER}
#     Go to Required Document Page
#     Accept or Reject The Uploaded Document           ${DOC_TO_ACCEPT}              ${accept_btn}
#     Verify That the Document is well Uploaded        ${DOC_TO_ACCEPT}
#     Accept or Reject The Uploaded Document           ${DOC_TO_REJECT}              ${reject_btn}
#     Verify That the Document is well Rejected        ${DOC_TO_REJECT}
#     [Teardown]    Close Browser