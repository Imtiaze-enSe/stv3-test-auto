*** Variables ***
# Locators    
 
${SIDEBAR_TBM_SETTIINGS_LINK}          xpath=//p[contains(text(),'ToolBox Meetings')]
${TBM_DASHBOARD}                       xpath=(//div[@class="tbm__header"]//following::h3)[1]

# Search 
${TBM_SEARCH}                          xpath=//div[contains(@class, 'search__large')]//input
${TBM_SEARCH_BUTTON}                   xpath=//div[contains(@class, 'search-buttons')]//button[span[text()='Search']]
${TBM_SEARCH_CLEAR_BUTTON}             xpath=//div[contains(@class, 'search-buttons')]//button[span[text()='Clear']]
${TBM_CARD_TITLE}                      xpath=//div[contains(@class, 'tbm-card__content')]//h3

# Filter
${FILTER_BUTTON}                  xpath=//button[contains(@class, 'tbm__header-filter')]
${FILTER_PANEL}                   xpath=//div[contains(@class, 'tbm-filter visible')]
${DATE_FILTER_DROPDOWN}           xpath=//div[contains(@class, 'expandable-dropdown__header')]//p[text()='Date']
${STATUS_FILTER_DROPDOWN}         xpath=//div[contains(@class, 'expandable-dropdown__header')]//p[text()='Status']
${ASSIGN_TO_FILTER_DROPDOWN}      xpath=//div[contains(@class, 'expandable-dropdown__header')]//p[text()='Assign To']
${PARTICIPATION_RANGE_DROPDOWN}   xpath=//div[contains(@class, 'expandable-dropdown__header')]//p[text()='Participation range']
${ASSIGN_TO_INPUT}                xpath=//div[contains(@id, 'react-select-9-placeholder')]
${PARTICIPATION_SLIDER}           xpath=//div[contains(@class, 'range-slider__thumb')][@data-upper='true']
${APPLY_FILTER_BUTTON}            xpath=//button[text()='Apply filter']


# Add new Button
${ADD_NEW_TBM_BUTTON}                  xpath=//body/div[1]/div/div[2]/div[2]/div/div[2]/div/button[2]   

# Title 
${INPUT_TITLE}                         xpath=//input[@id='general.title']

#DEADLINE DATE PICKER 
${DEADLINE_DATEPICKER}                 xpath=//div[contains(@class,'datepicker__select-dates')]
${DEADLINE_DATEPICKER_CALENDAR}        xpath=//div[contains(@class,'datepicker__calendar')]
${DEADLINE_DATEPICKER_YEAR}            xpath=//div[contains(@class,'react-select__control')]
${DEADLINE_DATEPICKER_MONTH}           xpath=//div[contains(@class,'datepicker__calendar-month__select')]/p
${DEADLINE_DATEPICKER_NEXT_BUTTON}     xpath=//i[contains(@class, 'datepicker__calendar-month__select')]/following-sibling::i
${DEADLINE_DATEPICKER_AVAILABLE_DAYS}  xpath=//button[contains(@class, 'active-month')]
${DEADLINE_DATEPICKER_SELECTED_DATE}   xpath=//div[contains(@class,'datepicker__select-dates')]

# PUBLICATION Option
${PUBLICATION_Option}                  xpath=//div[contains(@class, 'tbm-type-select__elements')] 
${PUBLIICATION_NOW}                    xpath=//div[contains(@class, 'tbm-type-select__element')]//p[text()='Now']
${PUBLIICATION_SCHEDULE}               xpath=//div[contains(@class, 'tbm-type-select__element')]//p[text()='Schedule:']

# SCHEDULE 
${SCHEDULE_DATEPICKER}                 xpath=//div[contains(@class,'schedure-for-wrapper')]//div[contains(@class,'datepicker__select-dates')]
${SCHEDULE_DATEPICKER_CALENDAR}        xpath=//div[contains(@class,'schedure-for-wrapper')]//div[contains(@class,'datepicker__calendar')]
${SCHEDULE_DATEPICKER_YEAR}            xpath=//div[contains(@class,'schedure-for-wrapper')]//div[contains(@class,'react-select__control')]
${SCHEDULE_DATEPICKER_MONTH}           xpath=//div[contains(@class,'schedure-for-wrapper')]//div[contains(@class,'datepicker__calendar-month__select')]/p
${SCHEDULE_DATEPICKER_SELECTED_DATE}   xpath=//div[contains(@class,'schedure-for-wrapper')]//div[contains(@class,'datepicker__select-dates')]
${SCHEDULE_TIME_DROPDOWN}              xpath=//div[contains(@class, 'form-select')]//div[contains(@class, 'react-select__control')]
${SCHEDULE_SELECTED_TIME}              xpath=//div[contains(@class, 'form-select')]//div[contains(@id, 'general.schedule_time')]//div[contains(@class, 'react-select__value-container')]

# ASSIGN TO
${ASSIGN_TO_DROPDOWN}                  xpath=//div[@id='general.assignTo']//div[contains(@class, 'react-select__control')]
${ASSIGN_TO_DROPDOWN_INPUT}            xpath=//div[@id='general.assignTo']//div[contains(@class, 'react-select__control')]//input[contains(@class, 'react-select__input')]
${ASSIGN_TO_SELECT_COMPANY}            xpath=//div[@id='general.tenant_id']//div[contains(@class, 'react-select__control')]
${ASSIGN_TO_SELECT_COMPANY_INPUT}      xpath=//div[@id='general.tenant_id']//div[contains(@class, 'react-select__control')]//input
${ASSIGN_TO_SELECT_SITE}               xpath=//div[@id='general.site_id']//div[contains(@class, 'react-select__control')]
${ASSIGN_TO_SELECT_SITE_INPUT}         xpath=//div[@id='general.site_id']//div[contains(@class, 'react-select__control')]//input
${ASSIGN_TO_SELECT_PROJECT}            xpath=//div[@id='general.project_id']//div[contains(@class, 'react-select__control')]
${ASSIGN_TO_SELECT_PROJECT_INPUT}      xpath=//div[@id='general.project_id']//div[contains(@class, 'react-select__control')]//input

# USERS SELECTION
${USERS_SELECTION}                     xpath=//div[contains(@class, 'tbm-user-select')]
${ALL_USERS_SELECTION}                 xpath=//div[contains(@class, 'tbm-user-select__option-label') and contains(text(), 'all users')]
${SPECIFIC_USERS_SELECTION}            xpath=//div[contains(@class, 'tbm-user-select__option-label') and contains(text(), 'Only specific users')]

# ATTACHEMENTS FIELDS
${ATTACHEMENT_URL}                     xpath=//input[@id='general.url']
${ATTACHEMENT_FILE}                    xpath=//div[contains(@class,'uploader-dropzone')]//input[@type='file']

# NEXT STEP BUTTON
${NEXT_STEP_BUTTON}                    xpath=//button[contains(@class, 'tbm-add__content-form__header-next')]     

# Question Section
${ADD_NEW_QUESTION_BUTTON}             xpath=//div[contains(@class, 'tbm-question-form-controls__add')]
${QUESTION_INPUT_FIELD}                xpath=//textarea[contains(@id, 'questionsStep.questions')]
${QUESTIONS_CONTAINER}                 xpath=//div[contains(@class, 'tbm-form-question')]

# Score Section
${PASSING_SCORE_DROPDOWN}             xpath=//div[@id='questionsStep.min_score']//div[contains(@class, 'react-select__control')]
${PASSING_SCORE_INPUT}                xpath=//div[@id='questionsStep.min_score']//div[contains(@class, 'react-select__control')]//input

# Reminder Section
${REMINDER_STATUS_DROPDOWN}            xpath=//div[@id='questionsStep.remainderStatus']//div[contains(@class, 'react-select__control')]
${REMINDER_STATUS_INPUT}               xpath=//div[@id='questionsStep.remainderStatus']//div[contains(@class, 'react-select__control')]//input
${REMINDER_TIME_DROPDOWN}              xpath=//div[@id='questionsStep.reminderTime']//div[contains(@class, 'react-select__control')]
${REMINDER_TIME_INPUT}                 xpath=//div[@id='questionsStep.reminderTime']//div[contains(@class, 'react-select__control')]//input

# Submit Button
${SUBMIT_BUTTON}                       xpath=//button[contains(@class, 'tbm-add-header__buttons-submit')]                      


