*** Variables ***
${ADD_TOPIC_BUTTON}                      xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[2]/div[1]/div[3]
${TOPIC_NAME_INPUT}                      xpath=(//div[@class="settings-icon-input__content"]//input[1])[1]
${TOPIC_LIST}                            xpath=(//div[@class="settings-data-column__header"]//following::p)[2]
${TOPIC_PREFIX}                          TOPIC_ 
@{CREATED_TOPICS}                      # List to store created TOPIC names
${GLOBAL_TOPIC_NAME}                     NONE
${PATH_TO_TOPIC_ICON}                    ${CURDIR}${/}topic_icon.png