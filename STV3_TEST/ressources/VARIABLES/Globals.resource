*** Variables ***
${LOGIN_URL}                      ${URL}/login
${DASHBOARD_URL}                  ${URL}/instant-observations?date=this_week
${SIDEBAR_ELEMENT}                     xpath=//body[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]
${LOGIN_FORM}                     xpath=//h1[contains(text(),'Sign In')]
${USERNAME_INPUT}                 xpath=//input[@id="Enter your email address"]
${PASSWORD_INPUT}                 xpath=//input[@id="Enter your password"]
${LOGIN_BUTTON}                   css=button[type='submit']
${ERROR_MESSAGE}                  css=.alert-error
${LOADING_SPINNER}                css=.loading-spinner
${BROWSER}                        chrome
${URL}                            https://preprodenv.safetytracker.app
${VALID_USERNAME}                 supadmin@imense.net
${VALID_PASSWORD}                 P@ssw0rd!
${TIMEOUT}                         10s
${SIDEBAR_COMPETENCE_LINK}        xpath=//p[contains(text(),'Competency')]
${SIDEBAR_CROSS_ICON}             xpath=//body/div[@id='root']/div[1]/div[1]/div[1]/div[1]/div[1]
${DELETE_BUTTON}                  xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[3]/div[1]/div[2]/div[1]/div[1]/div[2]/i[2]/*[1]
${DELETE_CONFIRMATION_MODAL}      xpath=//div[@class="delete-modal__header-text"]//following::p[contains(text(), 'Delete')]
${DELETE_CONFIRMATION_CHECKBOX}   xpath=//input[@id='delete-confirmation']
${MODAL_DELETE_BUTTON}            xpath=//button[contains(text(),'Delete')]