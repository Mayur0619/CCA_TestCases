*** Settings ***
Documentation    Suite description
Library   Selenium2Library


*** Keywords ***
Submit Feedback
#    wait until element is visible  xpath=//a[text()='Submit Feedback']
    wait until element is visible   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/*/ul/li[2]/a
    click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/*/ul/li[2]/a  #xpath=//a[text()='Submit Feedback']
    wait until element is visible  id=cf_subject  30s
    input text  id=cf_subject  Nice Feature
    input text  id=cf_message  This is the message of feedback by the assessor
    click element  id=wp-submit
    wait until element is visible  //span[@class='message success alert message-place']   30s