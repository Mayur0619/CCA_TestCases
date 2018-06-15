*** Settings ***
Documentation    All the keywords for contact my profile modules are here
Library  Selenium2Library
Library  Dialogs

*** Keywords ***
Edit my profile for the contact
    select from list by label   id=salutaions     Prof.
    input text   id=first_name   ${CHANGED_CONTACT_FNAME}
    input text   id=last_name   ${CHANGED_CONTACT_LNAME}
    input text   id=phone   ${CHANGED_CONTACT_PHONE}
    input text   id=title   ${CHANGED_CONTACT_TITLE}
    click element  id=updateuser
    sleep  3s
    wait until element is visible   xpath=//li[text()='Your profile has been updated successfully']   30s