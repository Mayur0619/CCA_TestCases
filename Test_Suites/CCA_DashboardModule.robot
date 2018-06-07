*** Settings ***
Documentation    Contact My Profile Test Cases
Library   Selenium2Library
Library           Collections
Resource  ../Resource/Common_Lib.robot
Resource  ../Resource/Keyword_Lib.robot

Test Setup  Launch Browser
Test Teardown  Close BR

*** Variables ***


*** Test Cases ***
TC53_Contact_Verify that the Quick Links section on the contact dashboard doesn't have the following options present
    [Tags]    TC_53_Contact_Verify that the Quick Links section on the contact dashboard doesn't have the following options present
    Keyword_Lib.Login as Customer
    sleep  2s
    page should not contain element   xpath=//a[text()='Edit Profile']
    page should not contain element   xpath=//a[text()='Add New Contact']
    page should not contain element   xpath=//a[text()='Update Company Profile']


TC54_Staff_Verify that the Notifications section on the staff dashboard doesn't have the following options present
    [Tags]    TC54_Staff_Verify that the Notifications section on the staff dashboard doesn't have the following options present
    Keyword_Lib.Login as Staff
    sleep  2s
    page should not contain element   xpath=//span[text()='Pending Contacts for Approval']
    page should not contain element   xpath=//span[text()='Modified Contact(s)']
    page should not contain element   xpath=//span[text()='Modified Company(s)']


TC55_TC56_Staff_Verify the "Modified Certificates" Notifications section on the staff dashboard
    [Tags]    TC55_TC56_Verify that the Notifications section on the staff dashboard has a widget titled "Modified Certificates"
    Keyword_Lib.Login as Staff
    sleep  2s
    page should contain element   xpath=//span[text()='Modified Certificates']
    click element   xpath=//span[text()='Modified Certificates']
    wait until element is visible   xpath=//h1/span[text()='Certificates']   30s
    page should contain element    xpath=//h1/span[text()='Certificates']
    checkbox should be selected    id=showModified


TC57_TC59_Contact_Verify that the link to access the company and contact would be removed from left navigation for all the contacts
    [Tags]    TC57_TC59_Verify that the link to access the company and contact would be removed from left navigation for all the contacts
    Keyword_Lib.Login as Customer
    sleep  2s
    wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a   30s
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Company')]
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Contact')]
    log   Company and Contact is not present on the menu for contact user

TC58_TC60_Staff_Verify that the link to access the company listing would be removed from left navigation for the staff user
    [Tags]    TC58_TC60_Verify that the link to access the company listing would be removed from left navigation for the staff user
    Keyword_Lib.Login as Staff
    sleep  2s
    wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a   30s
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Company')]
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Contact')]
    log   Company and Contact is not present on the menu for staff user

