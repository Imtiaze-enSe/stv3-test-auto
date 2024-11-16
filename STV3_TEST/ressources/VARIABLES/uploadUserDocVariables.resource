*** Variables ***
${USERS_SIDEBAR_LINK}                                xpath=//body[1]/div[1]/div[1]/div[1]/div[2]/div[2]/ul[1]/li[1]
${USERS_PAGE_HEADER}                                 xpath=//h3[contains(text(),'Users Management')]
${USERS_SEARCH_BAR}                                  xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/form[1]/div[1]/div[1]/input[1]
${APLLY_SEARCH_BTN}                                  xpath=//form[1]/div[1]/div[6]/button[1]
${USER_PROFILE_TAB}                                  xpath=//span[contains(text(),'User Profile')]
${REQUIRED_DOC_LINK}                                 xpath=//span[contains(text(),'Required documents')]
${REQUIRED_DOC_PAGE_TITLE}                           xpath=//h2[contains(text(),'Required Documents')]
${REQUIRED_CERTIFICATE_LINK}                         xpath=//span[contains(text(),'Training certificates')]
${REQUIRED_CERTIFICATE_PAGE}                         xpath=//h2[contains(text(),'Training Certificates')]
${DOC_FILE_PATH}                                     ${CURDIR}${/}certif_icon.png
${USER_NAME}                                         Colten GREENFIELD
${UPLOAD_DOC_MODAL}                                  xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[1]
${DOC_DATE_FILED}                                    xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/div[2]/div[1]
${SAVE_BTN}                                          xpath=//body[1]/div[5]/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[2]/div[1]/div[2]/button[1]
${DOC_TO_UPLOAD_NAME}                                upload-test
${CERTIFICATE_TO_UPLOAD}                             Certificat 2
${MANAGER_USERNAME}                                  Abdelkbir.khouilid@protonmail.com
${USER_UNDER_MANAGER}                                Edythe LARSON
${USERS_SEARCH_BAR_MANAGER}                          xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[1]/form[1]/div[1]/div[1]/input[1]
${MODAL_CONFIRMATION_TITLE}                          xpath=//body[1]/div[5]/div[1]/div[2]/div[1]/div[1]
${CONFIRM_BUTTON}                                    xpath=//button[contains(text(),'Confirm')]
${DOC_TO_ACCEPT}                                     upload-test 
${DOC_TO_REJECT}                                     Test_auto
${accept_btn}                                        validate-btn
${reject_btn}                                        reject-btn