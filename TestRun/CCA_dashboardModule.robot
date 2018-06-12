*** Settings ***
Documentation    Contact and Staff Dashboard CCA UAT Test Cases
Library   Selenium2Library
Library   Collections
Resource   ../Resource/commonLib.robot
Resource   ../Resource/contactDashboard.robot
Resource   ../Resource/staffDashboard.robot
Resource   ../Resource/loginLogout.robot

Test Setup  Launch Browser
Test Teardown  Close BR


*** Test Cases ***
TC53_Contact_Verify that the Quick Links section on the contact dashboard doesn't have the following options present
    [Tags]    TC_53_Contact_Verify that the Quick Links section on the contact dashboard doesn't have the following options present
    Login as Customer
    sleep  2s
    Verify quick links for contact


TC54_Staff_Verify that the Notifications section on the staff dashboard doesn't have the following options present
    [Tags]    TC54_Staff_Verify that the Notifications section on the staff dashboard doesn't have the following options present
    Login as Staff
    sleep  2s
    Verify quick links for staff


TC55_TC56_Staff_Verify the "Modified Certificates" Notifications section on the staff dashboard
    [Tags]    TC55_TC56_Verify that the Notifications section on the staff dashboard has a widget titled "Modified Certificates"
    Login as Staff
    sleep  2s
    Verify modified certificate for staff


TC57_TC59_Contact_Verify that the link to access the company and contact would be removed from left navigation for all the contacts
    [Tags]    TC57_TC59_Verify that the link to access the company and contact would be removed from left navigation for all the contacts
    Login as Customer
    sleep  2s
    Verify company contact menu removed
    log   Company and Contact is not present on the menu for contact user

TC58_TC60_Staff_Verify that the link to access the company listing would be removed from left navigation for the staff user
    [Tags]    TC58_TC60_Verify that the link to access the company listing would be removed from left navigation for the staff user
    Login as Staff
    sleep  2s
    Verify company contact menu removed
    log   Company and Contact is not present on the menu for staff user
	log   added