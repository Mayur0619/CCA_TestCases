*** Settings ***
Documentation  Low level steps written here
Library  Selenium2Library
Library  Dialogs

Resource   ../Resource/Common_Lib.robot

*** Keywords ***
Navigate URL to Portal
    Go to  http://172.16.7.53
    wait until page contains  Sign In

Staff Login to Portal
    select radio button  group_name=user_type  value=staff
    input text  id=user_login  ${STAFF_ID}
    input password  id=user_pass  ${STAFF_PASSWORD}
    Click button  xpath =//*[@id="wp-submit"]
    wait until page contains  Dashboard

Assessor Login to portal
    input text  id=user_login  ${ASSESSOR_EMAIL}
    input password  id=user_pass  ${ASSESSOR_PASSWORD}
    select radio button  group_name=user_type  value=assessor
    Click button  xpath=//*[@id="wp-submit"]

Customer Login to Portal
    sleep  3s
    input text  id=user_login  ${CUSTOMER EMAIL}
    input password  id=user_pass  ${CUSTOMER_PASSWORD}
    Click button  xpath =//*[@id="wp-submit"]
    wait until page contains  Dashboard