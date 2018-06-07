*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Resource   ../Resource/Common_Lib.robot



*** Keywords ***
Search For Assessment
    wait until page contains element  xpath=//input[@class='form-control input-sm']  50s
    sleep  8s
    input text  xpath=//input[@class='form-control input-sm']   ${ASSESSMENT_NAME}
#   log to console  //td[text()='${ASSESSMENT_NAME}']
#   wait until page contains element  xpath=//td[text()='${ASSESSMENT_NAME}']  30s
    sleep  15s

Click on View Assessment Action
    wait until page contains element  xpath=//td[text()='${ASSESSMENT_NAME}']  30s
    click element  xpath=//td[text()='${ASSESSMENT_NAME}']
    wait until page contains element  xpath=//a[@class='tbl-icon-gear dropdown-toggle']  30s
    click element  xpath=//a[@class='tbl-icon-gear dropdown-toggle']
    wait until page contains element  xpath=//a[@title='View']/i  30s
    click element  xpath=//a[@title='View']/i
    wait until element is visible   xpath=//span[@class='heading-line-height']  30s
    sleep  3s

















