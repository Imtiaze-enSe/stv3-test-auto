*** Settings ***
Documentation     Test Site-Inspection
Library           SeleniumLibrary
Library    Telnet
Library    DateTime
Resource          ../ressources/HELPERS/common.resource
Resource         ../ressources/HELPERS/siHelpers.resource
Resource         ../ressources/VARIABLES/Globals.resource
Resource         ../ressources/VARIABLES/siVariables.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers



*** Test Cases ***


#TODO Create Template Inspection With dynamic Question
Create New Inspection Template
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Add New Template 
    Input Template Title Details         Testcase 
    DropDown Selection
    Handle Dynamic Questions
    Click Create Button



#TODO Create Template Inspection With dynamic Topics
Create New Inspection Template Multiple Topics
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Add New Template 
    Input Template Title Details         Testcase
    DropDown Selection
    Handle Dynamic Topics
    Click Create Button


#TODO Edit Exisiting Template

Edit Existing Template   
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Template Card Action Button
    Click Edit Option from Dropdown
    Input Template Title Details         TestcaseEdit
    DropDown Selection
    Edit All Topics Dynamically



#TODO Duplicate Exisiting Template
Duplicate Exisiting Template
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Template Card Action Button
    Click Duplicate Option from Dropdown


#TODO Delete Exisiting Template
Delete Exisiting Template
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Template Card Action Button
    Delete Template via Action Dropdown


#TODO SearchBox 
Search Exisiting Template
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Search Template        Test

#TODO Create Absence Reason
Create New Absence Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Absence Reasons Tab
    Click New Reason Button
    Fill Last Table Row    Emergency Test    Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Create Rejection Reason
Create New Rejection Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Rejection Reasons Tab
    Click New Reason Button
    Fill Last Table Row    Emergency Test    Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Create Cancellation Reason
Create New Cancellation Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Cancelation Reasons Tab
    Click New Reason Button
    Fill Last Table Row    Emergency Test    Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Create PostPone Reason
Create New Postpone Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Postpone Reasons Tab
    Click New Reason Button
    Fill Last Table Row    Emergency Test    Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png


#TODO Edit Absence Reason
Edit New Absence Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Absence Reasons Tab
    Fill Last Table Row    Edited Reason    Edited Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Edit Rejection Reason
Edit New Rejection Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Rejection Reasons Tab
    Fill Last Table Row    Edited Reason    Edited Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Edit Cancelation Reason
Edit New Cancelation Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Cancelation Reasons Tab
    Fill Last Table Row    Edited Reason    Edited Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Edit PostPone Reason
Edit New Postpone Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Postpone Reasons Tab
    Fill Last Table Row    Edited Reason    Edited Automated Test Case    C:/Users/ShiedaMimo/Desktop/STV/Site Inspection/Icons/panne.png

#TODO Delete Absence Reason
Delete New Absence Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Absence Reasons Tab
    Click Delete Reason

#TODO Delete Rejection Reason
Delete New Rejection Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Rejection Reasons Tab
    Click Delete Reason

#TODO Delete Cancelation Reason
Delete New Cancelation Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Cancelation Reasons Tab
    Click Delete Reason

#TODO Delete PostPone Reason
Delete New Postpone Reason
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    Navigate To SI Section
    Click Postpone Reasons Tab
    Click Delete Reason

