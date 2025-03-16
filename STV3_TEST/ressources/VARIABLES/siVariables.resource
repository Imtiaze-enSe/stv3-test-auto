*** Variables ***
# Locators    

${AUDITS_AND_INSPECTIONS}    xpath=//p[contains(text(),'Audits & Inspections')]
${SI_SETTINGS_ICON}    xpath=//p[contains(text(),'Audits & Inspections')]/following::i[@class="sidebar__header-settings-sublink"]

# Index

${TOPIC_INDEX}    0  # Start with topic[0]

${QUESTION_INDEX}    0    # Start with question[0]


# Tabs

${ABSENCE_REASONS_TAB}    xpath=//div[contains(@class, 'ins-obs-settings-subheader__item') and text()='Absence reasons']
${Rejection_REASONS_TAB}    xpath=//div[contains(@class, 'ins-obs-settings-subheader__item') and text()='Rejection reasons']
${Cancelation_REASONS_TAB}    xpath=//div[contains(@class, 'ins-obs-settings-subheader__item') and text()='Cancelation reasons']
${Postpone_REASONS_TAB}    xpath=//div[contains(@class, 'ins-obs-settings-subheader__item') and text()='Postpone reasons']

# Table 

${TABLE_CONTENT}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table
${LAST_ROW}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]
${LAST_ROW_REASON_INPUT}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//td[1]//input[@name='name']
${LAST_ROW_DESCRIPTION_INPUT}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//td[2]//textarea[@name='description']
${LAST_ROW_ICON_UPLOAD}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//td[3]//input[@type='file']
${LAST_ROW_SAVE_BUTTON}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//td[last()]//button[@type='submit']
${LAST_ROW_CANCEL_BUTTON}    xpath=//div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//td[last()]//button[@type='button']
${LAST_ROW_DEL_BUTTON}        xpath = //div[contains(@class, 'tcc-details-table__content')]//table//tbody/tr[last()]//button[contains(@class, 'delete')]

# Template

${ADD_NEW_TEMPLATE_BUTTON}    xpath=//div[contains(@class, 'add-card') and .//p[text()='Add a new template']]
${TEMPLATE_TITLE_INPUT}       xpath=//input[@id='title' and @name='title' and @placeholder='Enter template title']

# Template Card Action

${CARD_ACTION_BUTTON}        xpath=//div[@class='card__header-ref actions-btn'] 
${CARD_ACTION_BUTTON_DEL}    xpath=//div[contains(@class, 'dropdown dropdown')]//li[contains(@class, 'delete')]
${CARD_ACTION_BUTTON_EDIT}    xpath=//div[contains(@class, 'dropdown dropdown')]//li[contains(@class, 'edit')]
${CARD_ACTION_BUTTON_DUPLICATE}    xpath=//div[contains(@class, 'dropdown dropdown')]//li[contains(@class, 'duplicate')]

# Delete Modal 

${MODAL_DEL}        xpath=//div[contains(@class, 'delete-modal')] 
${CHECKBOX_MODAL_DEL}    xpath=//div[contains(@class, 'delete-info__default-confirmation')]//input[@id='delete-confirmation']
${BTN_CONFIRMATION_MODAL_DEL}       xpath=//div[contains(@class, 'delete-btn')]//button[contains(@class, 'delete-btn__cta')]        

# DropDown

${CATEGORY_DROPDOWN}          xpath=//div[@id='inspection_category_id']
${CATEGORY_DROPDOWN_INPUT}          xpath=//div[@id='inspection_category_id']//input
${TYPE_DROPDOWN}          xpath=//div[@id='type']
${TYPE_DROPDOWN_INPUT}          xpath=//div[@id='type']//input
${PERIODICITY_DROPDOWN}          xpath=//div[@id='schedule']
${PERIODICITY_DROPDOWN_INPUT}          xpath=//div[@id='schedule']//input
${ASSIGN_TO_DROPDOWN}          xpath=//div[@id='assigned_roles']
${ASSIGN_TO_DROPDOWN_INPUT}          xpath=//div[@id='assigned_roles']//input

# Button

${ADD_NEW_REASON}         xpath=//div[contains(@class, 'tcc-details-table')]//div[contains(@class, 'tcc__add')]
${CREATE_TEMPLATE_BUTTON}      xpath=//div[contains(@class, 'add-template-header__buttons')]//button

# Search 
${SEARCH_BAR}    xpath=//div[contains(@class, 'search')]//input