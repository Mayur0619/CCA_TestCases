*** Settings ***
Documentation    All the keywords for contact my profile modules are here
Library  Selenium2Library
Library  Dialogs

*** Keywords ***
Edit my profile for the contact
    select from list by label   id=salutaions     Prof.
    input text   id=first_name   Rohan
    input text   id=last_name   Jain 1
    input text   id=phone   77777777888
    input text   id=title   New QA1
    click element  id=updateuser
    sleep  3s
    wait until element is visible   xpath=//li[text()='Your profile has been updated successfully']   30s