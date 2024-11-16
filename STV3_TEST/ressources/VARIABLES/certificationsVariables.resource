*** Variables ***
${ADD_CERT_BUTTON}                      xpath=(//body/div[@id='root']/div[1]/div[2]/div[2]/div[1]/div[2]/div[1]/div[2]/div[3]/div[1]/div[3])[1]
${CERT_NAME_INPUT}                      xpath=(//div[@class="settings-icon-input__content"]//input[1])[1]
${CERT_LIST}                            xpath=(//div[@class="settings-data-column__header"]//following::p)[2]
${CERTIF_PREFIX}                        CERT_ 
@{CREATED_CERTIFICATIONS}               # List to store created certification names
${GLOBAL_CERTIFICATION_NAME}            NONE
${PATH_TO_CERT_ICON}                    ${CURDIR}${/}certif_icon.png
