*** Settings ***
Documentation    Change Requests UAT test cases
Library    Selenium2Library
Library    Collections
Resource   ../Resource/loginLogout.robot
Resource   ../Resource/commonLib.robot
Resource   ../Resource/contactQuotations.robot

Test Setup  Launch Browser
Test Teardown  Close BR

*** Variables ***
${BROWSER} =  gc                                            #Browser used
${CUSTOMER EMAIL} =  ibreccustomer1@yopmail.com             #Customer email address
${CUSTOMER_PASSWORD} =  Admin@2018                          #Customer portal password
${APP_URL} =  https://portal-qa.iasonline.org/              #Testing URL
${STAFF_ID} =  pbothara                                     #Staff portal username
${STAFF_PASSWORD} =  Welcome#1                              #Staff portal password
${NEW_QUOTE_ID} =  IASQ01080                                #Quotation request currently in new status
${QUALIFIED_QUOTE_ID} =  IASQ01171                          #Quotation request currently in qualified status
${QUOTATION_SENT_QUOTE_ID} =  IASQ01172                     #Quotation request currently in quotation sent status


*** Test Cases ***
TC01_CR_Contact_Verify that in order to sign up, the user needs to mandatorily upload a file against the 'Upload Document' field on the Quotation Request form
    [Tags]    TC02_CR_Contact_Verify that in order to sign up, the user needs to mandatorily upload a file against the 'Upload Document' field on the Quotation Request form
    Click on get a quote from signin page
    Click on submit quotation button
    Verify upload document field mandatory

TC02_CR_Contact_Verify that the registered user needs to mandatorily upload a file against the 'Upload Document' field on Quotation Request form
    [Tags]    TC02_CR_Contact_Verify that the registered user needs to mandatorily upload a file against the 'Upload Document' field on Quotation Request form
    Login as Customer
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Click on get a quote from quotation listing page
    Click on submit quotation button
    Verify upload document field mandatory

TC04_CR_Staff_Verify that all the quotation requests with the status as 'New' can be closed.
    [Tags]    TC04_CR_Staff_Verify that all the quotation requests with the status as 'New' can be closed.
    Login as Staff
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Select quotation status from dropdown on the listing page   new
    sleep  3s
    Click on close quote action   ${NEW_QUOTE_ID}

TC05_CR_Staff_Verify that all the quotation requests with the status as 'Qualified' can be closed.
    [Tags]    TC05_CR_Staff_Verify that all the quotation requests with the status as 'Qualified' can be closed.
    Login as Staff
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Select quotation status from dropdown on the listing page   Qualified
    sleep  3s
    Click on close quote action   ${QUALIFIED_QUOTE_ID}

TC06_CR_Staff_Verify that all the quotation requests with the status as 'Quotation sent' can be closed.
    [Tags]    TC06_CR_Staff_Verify that all the quotation requests with the status as 'Quotation sent' can be closed.
    Login as Staff
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Select quotation status from dropdown on the listing page   Quotation_Sent
    sleep  3s
    Click on close quote action   ${QUOTATION_SENT_QUOTE_ID}

TC07_CR_Contact_Verify that the user cannot apply against a quotation request that has been closed.
    [Tags]    TC07_CR_Contact_Verify that the user cannot apply against a quotation request that has been closed.
    Login as Customer
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Select quotation status from dropdown on the listing page   closed
    sleep  3s
    Verify close quote action not present

TC08_CR_Staff_Verify that once a quotation request has been applied for, the staff cannot close that request.
    [Tags]    TC08_Staff_Verify that once a quotation request has been applied for, the staff cannot close that request.
    Login as Staff
    Click on Quotation Side Menu
    wait until page contains  Quotations    30s
    Select quotation status from dropdown on the listing page   application_submitted
    sleep  3s
    Verify close quote action not present