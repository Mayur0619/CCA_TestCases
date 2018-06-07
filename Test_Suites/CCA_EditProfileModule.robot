*** Settings ***
Documentation    Contact My Profile Test Cases
Library   Selenium2Library
Library           Collections
Resource  ../Resource/PO/Login.robot
Resource  ../Resource/Common_Lib.robot
Resource  ../Resource/Keyword_Lib.robot
Resource  ../Resource/PO/LeftSidePanel.robot

Test Setup  Launch Browser
Test Teardown  Close BR

*** Variables ***
${CUSTOMER EMAIL} =  rohan.jain@yopmail.com
${CUSTOMER_PASSWORD} =  Admin@2018

*** Test Cases ***
#TC61,62_Contact_Verify that a link 'My Profile" is present on the left navigation for the contact user
#    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
#    Keyword_Lib.Login as Customer
#
#    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
#    log   link 'My Profile" is present on the left navigation for the contact user
#
#TC63_Contact_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
#    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
#    Keyword_Lib.Login as Customer
#    Click on My Profile Side Menu
#    element text should be  //h1/span   My Profile
#    log  Contact user is navigated to "My Profile" page
#
#TC64,65_Contact_Verify the "My Profile" page to have the following fields and verify that the contacts are able to modify the data on their profile
#    [Tags]   Verify the "My Profile" page to have the following fields and verify that the contacts are able to modify the data on their profile
#    Keyword_Lib.Login as Customer
#    Click on My Profile Side Menu
#    select from list by label   id=salutaions     Prof.
#    input text   id=first_name   Rohan
#    input text   id=last_name   Jain 1
#    input text   id=phone   77777777888
#    input text   id=title   New QA1
#    click element  id=updateuser
#    sleep  3s
#    wait until element is visible   xpath=//li[text()='Your profile has been updated successfully']   30s
#    log  Contact user should be able to edit the details
#
#TC61,62_Assessor_Verify that a link 'My Profile" is present on the left navigation for the user
#    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
#    Keyword_Lib.Login as Assessor
#
#    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
#    log   link 'My Profile" is present on the left navigation for the contact user
#
#TC63_Assessor_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
#    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
#    Keyword_Lib.Login as Assessor
#    Click on My Profile Side Menu
#    element text should be  //h1/span   My Profile
#    log  Contact user is navigated to "My Profile" page

TC61,62_Staff_Verify that a link 'My Profile" is present on the left navigation for the user
    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
    Keyword_Lib.Login as Staff

    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
    log   link 'My Profile" is present on the left navigation for the contact user

TC63_Staff_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    Keyword_Lib.Login as Staff
    Click on My Profile Side Menu
    element text should be  //h1/span   My Profile
    log  Contact user is navigated to "My Profile" page