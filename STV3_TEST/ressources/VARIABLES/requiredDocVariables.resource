*** Variables ***
${REQUIRED_DOC_TAB}                            xpath=//div[contains(text(),'Required documents')]
${REQUIRED_DOC_PAGE_URL}                       ${URL}/competence-settings?activeTab=2
${URL}                                         https://stv3ca-prod.netlify.app
${ADD_NEW_DOC_BTN}                             xpath=//button[@class='add-btn']
${ADD_DOC_MODAL}                               xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[1]
${DOC_TITLE_INPUT}                             xpath=//input[@placeholder="Enter document title"]
${DOC_UPLOAD_INPUT}                            xpath=//input[@id='file-input']
${ASSIGN_TO_HIDDEN_INPUT}                      xpath=(//input[@name="assign_to"])[2]
${DOC_SAVE_BTN}                                xpath=//button[contains(text(),'Save')]
${PATH_TO_DOC_ICON}                            ${CURDIR}${/}doc-icon.png
${ASSIGN_TO_DROPDOWN}                          xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]
${ASSIGN_TO_OPTIONS}                           css=#assign_to .react-select__menu
${ASSIGN_TO_OPTION}                            css=.react-select__option
${ASSIGN_TO_MENU}                              css=.react-select__menu
${DELETE_DOC_BTN}                              xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[2]/div[1]
${CONFIRM_DIALOG}                              xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[2]/p[1]
${CONFIRM_BUTTON}                              xpath=//input[@id='delete-confirmation']
${DELETE_BTN_IN_MODAL}                         xpath=//button[contains(text(),'Delete')]
${SEARCH_INPUT}                                xpath=//input[@placeholder="Search by document name..."]
${APPLY_FILTER_BUTTON}                         xpath=//Button[contains(text(), 'Apply filter')]
${RESET_FILTER_BUTTON}                         xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/form[1]/div[1]/div[1]/div[4]/button[1]