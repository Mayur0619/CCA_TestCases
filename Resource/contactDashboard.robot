*** Settings ***
Documentation    All the keywords for contact dashboard modules are here
Library  Selenium2Library
Library  Dialogs


*** Keywords ***
Verify quick links for contact
    page should not contain element   xpath=//a[text()='Edit Profile']
    page should not contain element   xpath=//a[text()='Add New Contact']
    page should not contain element   xpath=//a[text()='Update Company Profile']

