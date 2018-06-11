*** Settings ***
Documentation    Contact My Profile UAT Test Cases
Library    Selenium2Library
Library    Collections
Resource   ../Resource/loginLogout.robot
Resource   ../Resource/commonLib.robot
Resource   ../Resource/contactMyProfile.robot

Test Setup  Launch Browser
Test Teardown  Close BR

*** Variables ***
#${CUSTOMER EMAIL} =  rohan.jain@yopmail.com
#${CUSTOMER_PASSWORD} =  Admin@2018

*** Test Cases ***
TC61,62_Contact_Verify that a link 'My Profile" is present on the left navigation for the contact user
    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
    Login as Customer
    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
    log   link 'My Profile" is present on the left navigation for the contact user

TC63_Contact_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    Login as Customer
    Click on My Profile Side Menu
    element text should be  //h1/span   My Profile
    log  Contact user is navigated to "My Profile" page

TC64,65_Contact_Verify the "My Profile" page to have the following fields and verify that the contacts are able to modify the data on their profile
    [Tags]   Verify the "My Profile" page to have the following fields and verify that the contacts are able to modify the data on their profile
    Login as Customer
    Click on My Profile Side Menu
    Edit my profile for the contact
    log  Contact user should be able to edit the details

TC61,62_Assessor_Verify that a link 'My Profile" is present on the left navigation for the user
    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
    Login as Assessor
    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
    log   link 'My Profile" is present on the left navigation for the contact user

TC63_Assessor_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    Login as Assessor
    Click on My Profile Side Menu
    element text should be  //h1/span   My Profile
    log  Contact user is navigated to "My Profile" page

TC61,62_Staff_Verify that a link 'My Profile" is present on the left navigation for the user
    [Tags]    Verify that a link 'My Profile" is present on the left navigation for the contact user
    Login as Staff
    element text should be  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  My Profile
    log   link 'My Profile" is present on the left navigation for the contact user

TC63_Staff_Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    [Tags]    Verify that the users are able to click on the "My Profile" link and are navigated to "My Profile" page
    Login as Staff
    Click on My Profile Side Menu
    element text should be  //h1/span   My Profile
    log  Contact user is navigated to "My Profile" page