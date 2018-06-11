*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs

*** Keywords ***
Verify quick links for staff
    page should not contain element   xpath=//span[text()='Pending Contacts for Approval']
    page should not contain element   xpath=//span[text()='Modified Contact(s)']
    page should not contain element   xpath=//span[text()='Modified Company(s)']

Verify modified certificate for staff
    page should contain element   xpath=//span[text()='Modified Certificates']
    click element   xpath=//span[text()='Modified Certificates']
    wait until element is visible   xpath=//h1/span[text()='Certificates']   30s
    page should contain element    xpath=//h1/span[text()='Certificates']
    checkbox should be selected    id=showModified