*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
#Resource   ../Resource/Common_Lib.robot
#Resource   ./Test_Suites/CCA_DashboardModule.robot

*** Variables ***

*** Keywords ***
Verify quick links for staff
    page should not contain element   xpath=//span[text()='Pending Contacts for Approval']
    page should not contain element   xpath=//span[text()='Modified Contact(s)']
    page should not contain element   xpath=//span[text()='Modified Company(s)']

Verify quick links for contact
    page should not contain element   xpath=//a[text()='Edit Profile']
    page should not contain element   xpath=//a[text()='Add New Contact']
    page should not contain element   xpath=//a[text()='Update Company Profile']

Verify modified certificate for staff
    page should contain element   xpath=//span[text()='Modified Certificates']
    click element   xpath=//span[text()='Modified Certificates']
    wait until element is visible   xpath=//h1/span[text()='Certificates']   30s
    page should contain element    xpath=//h1/span[text()='Certificates']
    checkbox should be selected    id=showModified

Verify company contact menu removed
    wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a   30s
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Company')]
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Contact')]
