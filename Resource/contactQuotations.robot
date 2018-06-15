*** Settings ***
Documentation    All the keywords for contact quotation modules are here
Library  Selenium2Library
Library  Dialogs

*** Keywords ***
Click on get a quote from quotation listing page
    sleep  2s
    wait until element is visible   xpath=//*[@id='post-2524']//a[@class='btn btn-primary color-blue pull-right header_btn']   10s
    click element  xpath=//*[@id='post-2524']//a[@class='btn btn-primary color-blue pull-right header_btn']
    wait until page contains   Quotation Request    30s
    sleep  2s

Click on get a quote from signin page
    sleep  1s
    click element    //a[text()='Get a Quote']

Verify upload document field mandatory
    sleep  1s
    mouse down   xpath=//span[text()=' Upload Scope Document ']
    element should be visible   //div[text()='Upload scope document is required']

Click on submit quotation button
    click button  xpath=//button[@type='submit']
    wait until page contains  Quotations  30s


#    select from list by index  xpath=//*[@id='company_id']  1
#    select from list by index  xpath=//*[@id='accr_program']   10
#    sleep  1s
#    click button  xpath = //button[@type='submit']
#    wait until page contains  Quotations  30s
#    sleep  3s
#    ${quoteid_submitted}=  get text  xpath=//table[@id='my_quotation']/tbody/tr[1]/td[1]/a
#    log to console  ${quoteid_submitted}
#    [Return]   ${quoteid_submitted}



Select quotation status from dropdown on the listing page
    [Arguments]   ${QUOTE_STATUS}
    sleep  3s
    log  ${QUOTE_STATUS}
    select from list by value  id=select_status   ${QUOTE_STATUS}


Click on close quote action
    [Arguments]   ${CLOSE_QUOTE_ID}
    wait until element is visible  xpath=//a[text()='${CLOSE_QUOTE_ID}']/../../td[1]  30s
    sleep  3s
    click element  xpath =//a[text()='${CLOSE_QUOTE_ID}']/../../td[1]
    sleep  15s
    click element  //button[@id='cboxClose']
    sleep  5s
    wait until element is visible  xpath=//a[@class='tbl-icon-gear dropdown-toggle']
    click element  //a[@class='tbl-icon-gear dropdown-toggle']
    wait until element is visible   xpath=//a[@class='quote-close']   30s
    click element   //a[@class='quote-close']
    sleep  2s
    wait until element is visible   xpath=//li[text()='Quotation request closed successfully.']   30s
    log   Quotation request closed successfully

Verify close quote action not present
    wait until element is visible  xpath=//tbody/tr[1]/td[1]  30s
    sleep  3s
    click element  xpath=//tbody/tr[1]/td[1]
    sleep  15s
    click element  //button[@id='cboxClose']
    sleep  5s
    wait until element is visible  xpath=//a[@class='tbl-icon-gear dropdown-toggle']
    click element  //a[@class='tbl-icon-gear dropdown-toggle']
    wait until element is visible   xpath=//span[text()='View']   30s
    page should not contain element   xpath=//a[@class='quote-close']
