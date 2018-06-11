*** Settings ***
Documentation   Login related keywords defined here
Library  Selenium2Library
Library  Dialogs

Resource   ../Resource/commonLib.robot

*** Keywords ***
Login as Staff
    select radio button  group_name=user_type  value=staff
    input text  id=user_login  ${STAFF_ID}
    input password  id=user_pass  ${STAFF_PASSWORD}
    Click button  xpath =//*[@id="wp-submit"]
    wait until page contains  Dashboard

Login as Assessor
    input text  id=user_login  ${ASSESSOR_EMAIL}
    input password  id=user_pass  ${ASSESSOR_PASSWORD}
    select radio button  group_name=user_type  value=assessor
    Click button  xpath=//*[@id="wp-submit"]

Login as Customer
    sleep  3s
    input text  id=user_login  ${CUSTOMER EMAIL}
    input password  id=user_pass  ${CUSTOMER_PASSWORD}
    Click button  xpath =//*[@id="wp-submit"]
    wait until page contains  Dashboard

Logout
    go to   https://portal-qa.iasonline.org/logout
    wait until element is visible   xpath=//a[text()='log out']   10s
    click element   xpath= //a[text()='log out']
#    navigate to url  https://portal-qa.iasonline.org/logout
#    click element   xpath=//a[text()='Logout']
#    wait until element is visible   xpath=//a[text()='Forgot Password']