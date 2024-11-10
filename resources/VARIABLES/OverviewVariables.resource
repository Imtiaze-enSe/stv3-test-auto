*** Variables ***
${OVERVIEW_PAGE_TITLE}                            xpath=//h3[contains(text(),'Competence management')]
${SEARCHED_TOPIC_NAME}                            Topic 1
${SEARCHED_CERTIFICATE}                           Certificat 1
${SEARCHED_USER_NAME}                             Antonio ZALSOMER
${SEARCH_BAR}                                     xpath=//Input[@name="search"]
${APPLY_FILTER_BUTTON}                            xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[5]/div[1]/button[1]
${RESET_FILTER_BUTTON}                            xpath=//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[5]/div[1]/button[2]
${SELECT_TOPIC_BTN}                               xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/div[2]
${SELECT_CERTIFICATE_BTN}                         xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[3]/div[1]/div[1]/div[1]/div[2]
${SELECT_USER_TYPE_BTN}                           xpath=//body[1]/div[1]/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[1]/div[4]/div[1]/div[1]/div[1]/div[2]
${INTERNAL_OPTION}                                xpath=//div[contains(text(), 'Internal')]
${EXTERNAL_OPTION}                                xpath=//div[contains(text(), 'External')]
# ${ALL_TYPE_TAGS}                                  xpath=//tbody//td//div[1]/div[3]/p[1]
${TABLE_ROWS}                                     xpath=//tbody/tr    # Get visible table rows
${TYPE_IN_ROW}          .//p[1]      # The path within each row to the type element