*** Settings ***
Documentation     Test ToolBoxMeetings
Library           SeleniumLibrary
Library    Telnet
Library    DateTime
Resource          ../ressources/HELPERS/common.resource
Resource         ../ressources/HELPERS/tbmHelpers.resource
Resource         ../ressources/VARIABLES/Globals.resource
Resource         ../ressources/VARIABLES/tbmVariables.resource
Suite Setup       Open Browser To Application
Suite Teardown    Close All Browsers



*** Test Cases ***

#TODO Test Creation TBM With QUIZZ
ToolBoxMeetings With Quizz
    
    [Documentation]    Test the creation of a new tbm
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    Click Toolbox Meetings Module
    Click Add New TBM Button
    Input Title Details   This is an Automated Test 2.0
    Select Random Date From Datepicker
    Select Publication Now
    Select Assign To Users Of Company
    Select All Users
    Click Next Step Button
    Creating Questions
    Select Minimum Passing Score    
    Select Reminder Status And Time
    Click Submit Button
    Sleep    3s
    Close Browser


#TODO Test Creation TBM With Scheduele Publication
ToolBoxMeetings With Scheduele Publication
    
    [Documentation]    Test the creation of a new tbm
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    Click Toolbox Meetings Module
    Click Add New TBM Button
    Input Title Details   this is a test automatiser 
    Select Random Date From Datepicker
    Select Schedule And Set DateTime
    Select Assign To Users Of Company
    Select All Users
    Click Next Step Button
    Creating Questions
    Select Minimum Passing Score    
    Select Reminder Status And Time
    Close Browser


#TODO TEST APPLYFILTER
ToolBoxMeetings ApplyFilter Test
    [Documentation]    Opens the filter panel and applies multiple filters.
        
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    Click Toolbox Meetings Module
    Open Filter Panel
    Select Date Filter    this_year
    Select Status Filter    overdue
    Set Participation Range    5
    Apply Filters
    Sleep    3s


#TODO Test SearchBox
SearchBox Test

    [Documentation]    Test Searchbox
    Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
    
    Click Toolbox Meetings Module
    Search Toolbox Meeting    This is an Automated Test
    Close Browser

#TODO TEST Creation TBM With Company Select
ToolBoxMeetings Company Selection
    [Documentation]    Test Creation New TBM With Company Option Selected
    
        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Company
        Select All Users
        Click Next Step Button
        Close Browser


#TODO TEST Creation TBM With Site Select
ToolBoxMeetings Site Selection
    [Documentation]    Test Creation New TBM With Site Option Selected
    ${users_list}    Create List    Colten GREENFIELD    Abdelkbir KHOUILID


        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Site
        Select All Users
        Click Next Step Button
        Close Browser


#TODO Test Creation tbm With Project Select
ToolBoxMeetings Project Selection
    [Documentation]    Test Creation New TBM With Project Option Selected

        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Project
        Select All Users
        Click Next Step Button
        Close Browser


#TODO TEST Creation tbm With Specific user
ToolBoxMeetings Specific Users
    [Documentation]    Test Creation new TBM With Specific Users Selected
    
    ${users_list}    Create List    Colten GREENFIELD    Abdelkbir KHOUILID

        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Company
        Select Only Specific Users        @{users_list}
        Click Next Step Button
        Close Browser

#TODO Test Creation TBM With Attachement Link
ToolBoxMeetings Attached Link
    [Documentation]    Test Creation New TBM With Attachement Link

        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Project
        Select All Users
        Enter Attachment URL    https://www.youtube.com/watch?v=GNHuJE_GARc
        Click Next Step Button
        Close Browser


#TODO Test Creation TBM With Upload Files
ToolBoxMeetings Upload File
    [Documentation]    Test Creation New TBM With File Uploaded

        Login To Application                            ${VALID_USERNAME}    ${VALID_PASSWORD}
        
        Click Toolbox Meetings Module
        Click Add New TBM Button
        Input Title Details   this is a test automatiser 
        Select Random Date From Datepicker
        Select Publication Now
        Select Assign To Users Of Project
        Select All Users
        Attach File    C:/Users/ShiedaMimo/Desktop/STV/TBM/Automated Tests/stv3-test-auto/STV3_TEST/TBM/Upload-Test/STV3-687.csv
        Sleep    1s
        Click Next Step Button
        Close Browser
