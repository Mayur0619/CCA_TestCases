*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Library  String
Resource  ./Test_Suites/CreateCertificate.robot
Resource  ./Common_Lib.robot
Resource  ../Resource/PO/Login.robot
Resource  ../Resource/Common_Lib.robot

*** Variables ***
${TelephoneNo}=  9898989898
${CompanyName}=  Rohan & Rohan, Pvt. - Ltd's   #Mic Inc E
${INDEX}=  1
${count}=  1
${ChecklistCount}

*** Keywords ***
Get a Quote
    sleep  2s
    wait until element is visible   xpath=//*[@id='post-2524']//a[@class='btn btn-primary color-blue pull-right header_btn']   10s
    click element  xpath=//*[@id='post-2524']//a[@class='btn btn-primary color-blue pull-right header_btn']
    wait until page contains   Quotation Request
    sleep  2s
    select from list by index  xpath=//*[@id='company_id']  1
    select from list by index  xpath=//*[@id='accr_program']   10
    sleep  1s
    click button  xpath = //button[@type='submit']
    wait until page contains  Quotations  30s
    sleep  3s
    ${quoteid_submitted}=  get text  xpath=//table[@id='my_quotation']/tbody/tr[1]/td[1]/a
    log to console  ${quoteid_submitted}
    [Return]   ${quoteid_submitted}

Add quote amount
    [Arguments]    ${quoteid_captured}
    log to console  ${quoteid_captured}
    sleep  2s
    wait until element is visible  xpath =//a[text()='${quoteid_captured}']/../../td[1]  20s
    sleep  3s
    click element  xpath =//a[text()='${quoteid_captured}']/../../td[1]
    sleep  20s
    click element  //button[@id='cboxClose']
    sleep  5s
    wait until element is visible  xpath =//a[@class='tbl-icon-gear dropdown-toggle']
    click element  //a[@class='tbl-icon-gear dropdown-toggle']
    sleep  2s
    click element  xpath=//tr[@class='odd parent']/../tr[2]/td[1]/ul/li/span[2]/div/ul/li[2]/a
    wait until page contains  Provide Quotation
    input text  id = amount  100
    input text  id = amount_due  50
    click button  css = #insert
    sleep  5s
    wait until page contains   Quotations
    wait until page contains element  xpath=//li[text()='Quotation has been sent successfully']  30s
    log to console   Quotation Amount successfully added by the staff

Edit action for application
    click element  id=cboxClose
    sleep  3s
    wait until element is visible  xpath =//a[@class='tbl-icon-gear dropdown-toggle']   20s
    click element  //a[@class='tbl-icon-gear dropdown-toggle']
    sleep  2s
    click element  xpath=//tr[@class='odd parent']/../tr[2]/td[1]/ul/li/span[2]/div/ul/li[2]/a

Create application against quotation
    [Arguments]     ${quoteid_captured}
    log to console  Application is applied againts the quote:${quoteid_captured}
    sleep  3s
    wait until element is visible  xpath =//a[text()='${quoteid_captured}']/../../td[1]  20s
    click element  xpath =//a[text()='${quoteid_captured}']/../../td[1]
    sleep  15s

    ${ApplyButtonVisible} =   Run Keyword And Return Status    Element Should Be Visible    xpath=//button[@id='cboxClose']/..//span[@class='btn btn-primary btn-success']
    Run keyword if  '${ApplyButtonVisible}' == 'True'   click element   //button[@id='cboxClose']/..//span[@class='btn btn-primary btn-success']
    Run keyword If    '${ApplyButtonVisible}' == 'False'   Edit action for application

    wait until page contains  IAS Application Form
    select checkbox  xpath=//*[@id='checktopopulatefield']
    sleep  5s
    #input text  xpath=//input[@title='Telephone Number']  9997771110
    mouse down  xpath=//a[@id='next']
    click element  xpath=//a[@id='next']
    wait until page contains element  xpath=//*[@id='applicanttechid']  30s
    select from list by index  xpath=//*[@id='applicanttechid']  1
    sleep  5s

    mouse over  xpath=//section[2]//a[text()='Save & Next']
    click element  xpath=//section[2]//a[text()='Save & Next']

    #Additional Tab
    sleep  5s
    wait until element is not visible  xpath=//input[@value='No' and @type='radio']  20s
    click element  //input[@value='No' and @type='radio']
#    input text  //input[@placeholder='Third party inspection agency']/../input[1]  test
    sleep  5s
    mouse down  xpath=//section[3]//a[text()='Save & Next']
    wait until element is visible  xpath=//section[3]//a[text()='Save & Next']
    click element  xpath=//section[3]//a[text()='Save & Next']

    #Document Tab
    sleep  3s
    wait until element is enabled  xpath=//div[text()='Add documents in support of your application']  20s
    mouse down  xpath=//section[4]//a[text()='Save & Next']
    wait until element is enabled  xpath=//section[4]//a[text()='Save & Next']  20s
    click element  xpath=//section[4]//a[text()='Save & Next']/..

    #Payment Tab
    sleep  8s
    click element  xpath=//*[@id='payment_mode_offline']
    wait until element is enabled  xpath=//input[@id='paybycheck']  20s
    click element  xpath=//input[@id='paybycheck']
    wait until element is enabled  xpath=//section[5]//a[text()='Submit']  20s
    click element  xpath=//section[5]//a[text()='Submit']/..
    unselect frame

    sleep  5s
    select frame   xpath=//div[@id='cboxLoadedContent']/iframe
    mouse down   xpath=//strong[contains(text(),'In consideration of the processing of this application')]
    Press Key   xpath=//div[@class='container my-class']   \\25  # press ARROW_RIGHT (right arrow/cursor)
#    Press Key   xpath=//div[@class='container my-class']     \\25
    log to console  0
#    Press Key   xpath=//strong[contains(text(),'In consideration of the processing of this application')]     \\25
#    Press Key   xpath=//strong[contains(text(),'In consideration of the processing of this application')]     \\25
#    Press Key   xpath=//strong[contains(text(),'In consideration of the processing of this application')]     25
    click element at coordinates   xpath=//div[@class='container my-class']   981  567
#    Scroll Page To Location    981   567
#    log to console  2
#    wait until element is enabled  xpath=//input[@id='terms_condition_inner']  20s
#    log to console  3
#    click element  xpath=//input[@id='terms_condition_inner']
#    log to console  4
#    sleep  40s
#    wait until element is enabled  xpath=//button[@id='terms_condition_inner_submit']  20s
#    click element  xpath=//button[@id='terms_condition_inner_submit']


Is-Program-Correct?
    table row should contain   xpath=//table/tbody/tr[${INDEX}]/td[text()='Calibration Lab']   ${INDEX}    ${CompanyName}

Select action and push to CRM
    click element   xpath=//table/tbody/tr[${INDEX}]/td[1]
    wait until element is enabled   xpath=//a[@class='tbl-icon-gear dropdown-toggle']   20s
    click element   xpath=//a[@class='tbl-icon-gear dropdown-toggle']

    wait until element is enabled   xpath=//a[@title='Push to CRM']  20s
    click element  xpath=//a[@title='Push to CRM']

check application status
    : FOR    ${INDEX}    IN RANGE    ${count}    ${ChecklistCount}
    \    Log    ${INDEX}
    \    set suite variable  ${INDEX}
    \    ${passed}=  run keyword and return status   Is-Company-Correct?
    \    run keyword if  '${passed}' == 'True'  Select action and push to CRM

Push application to CRM by Staff
#    ${listTotalCount}=  get matching xpath count  xpath=//table[@class='table dataTable dt-responsive nowrap wp-list-table widefat fixed pages table-striped table-hover dtr-inline collapsed']/tbody/tr
#    log to console  total count of the list is:${listTotalCount}
#    check application status
#    run keyword if  '${count}' <= '${ChecklistCount}'  check application status
    sleep   5s

    click element   xpath=//tbody/tr[1]/td[1]
    sleep   2s
    click element  xpath=//a[@class='tbl-icon-gear dropdown-toggle']
    sleep   2s
    click element   xpath=//span[text()='Push to CRM']
    sleep  5s
    input text   id=popup_certificate_name  MB-1212
    input text   id=popup_third_party_number   TEST
    click element   id=submit-button