*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Resource   ../Resource/Common_Lib.robot


*** Keywords ***
Click on schedule tab
    sleep  3s
    wait until element is enabled  xpath=//a[text()='Schedule']  30s
    click element  xpath=//a[text()='Schedule']

Click on Add New Scheduling Activity
    sleep  3s
    wait until page contains element  xpath=//a[text()='+ Add new scheduling activity']  60s
    click element  xpath=//a[text()='+ Add new scheduling activity']

Enter Activity Details
    sleep  5s
    wait until page contains element  xpath=//h1[text()='Add new scheduling activity']  60s
    click element  id=office_activity
    Fill Office Visit Details
#    Run Keyword If  '${ACTIVITY_TYPE}'=='Field Visit'     Fill Field Visit Details

Fill Office Visit Details
    input text  id=officeAddress  101,LA Office Street
    input text  id=officeCity  Los Angeles Office
    input text  id=officeZipCode  552330
    select from list by index  id=officeState   4
    select from list by index  id=officeCountry   1
    input text  id=officeActivityDuration   ${ACTIVITY_DURATION}

Fill Field Visit Details
    input text  id=fieldAddress  101,LA Field Street
    input text  id=fieldCity  Los Angeles Field
    input text  id=fieldZipCode  552330
    select from list by index  id=fieldState   4
    select from list by index  id=fieldCountry   1
    input text  id=fieldActivityDuration    ${ACTIVITY_DURATION}

Click on Add Activity Button
    sleep  3s
    click element  xpath=//button[text()='Add activity']
    sleep  5s
    wait until page contains element  xpath=//li[text()='Activity added successfully']  60s

Click on Add Assessors
#    sleep  15s
    wait until element is visible  xpath=//a[@class='staffAddAssessorSetion']   60s
    click element  xpath=//a[@class='staffAddAssessorSetion']
    sleep  10s

Search for Assessor
    input text   xpath=//input[@class='form-control input-sm']   ${Assessor1_Email}
    sleep  2s
    wait until element is enabled  xpath=//td[text()='${Assessor1_Email}']/../td[2]/div[1]/input   50s

Select Assessor Chekbox
    sleep  3s
    select checkbox  xpath=//td[text()='${Assessor1_Email}']/../td[2]/div[1]/input

Set as Lead Assessor
    sleep  2s
    mouse over   xpath=//td[text()='${Assessor1_Email}']/../td[3]
    click element  xpath=//a[@class='tbl-icon-gear dropdown-toggle']
    click element  xpath=//a[@title='Set as Lead assessor']/i

Click on Add Selected Assessor
    click element  xpath=//a[text()='Add selected assessors']
    wait until page contains element  xpath=//li[text()='Assessor(s) added successfully']  60s
    log to console  Assessor added to an assessment successfully