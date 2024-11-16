*** Variables ***
# Locators    
${SIDEBAR_CATEGORIES_SETTINGS_LINK}    xpath=//p[contains(text(),'Competence')]/following::i[@class="sidebar__header-settings-sublink"]  
${ADD_CATEGORY_BUTTON}                 xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[1]/div[1]/div[3]
${CATEGORY_NAME_INPUT}                 xpath=(//div[@class="settings-icon-input__content"]//input[1])[1]
${CATEGORY_EDIT_NAME_INPUT}            xpath=//input[@id='name']
${UPLOAD_CATEGORY_ICON_FIELD}          xpath=//i[@class="tccimage-dropzone__icon"]
${CATEGORY_DESC_INPUT}                 xpath=//textarea[@id='description']
${SUBMIT_BUTTON}                       css=button[type='submit']
${CATEGORY_LIST}                       xpath=(//div[@class="settings-data-column__header"]//following::p)[1]
${DELETE_BUTTON}             css=button.delete-category
${CONFIRM_DELETE_BUTTON}     css=button.confirm-delete
${PREFIX}                              CAT_
@{CREATED_CATEGORIES}            # List to store created category names
${GLOBAL_CATEGORY_NAME}    NONE
${PATH_TO_CAT_ICON}                      ${CURDIR}${/}icon-cat.png        # C:\\Users\\SafetyTracker\\resources\\MEDIA\\icon-cat.png
${CAT_ICON_UPLOAD_FIELD}                xpath=//div[@class="tccimage-dropzone"]
${UPLOAD_CAT_ICON_INPUT}                xpath=//body/div[@id='modal']/div[1]/div[2]/div[1]/div[2]/form[1]/div[1]/div[1]/div[2]/div[1]/div[1]/input[1]