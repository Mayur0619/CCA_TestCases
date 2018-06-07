*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Resource   ../Resource/Common_Lib.robot
Resource   ./Test_Suites/CCA_CertificateModule.robot

*** Variables ***
${NEW_BLD_FILENAME1}
${OLD_TECH_CONTACT}
${OLD_BILL_CONTACT}
${OLD_LEGAL_CONTACT}

*** Keywords ***
Search for certificate
#    [Arguments]    ${ANY_CERTIFICATE_NAME}
    wait until page contains  Certificates    10s
    input text   xpath=//input[@class='form-control input-sm']   ${CERTIFICATE_NAME}
    sleep  5s

Click on action gear against certificate
    click element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/a
    wait until element is visible  xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']   10s

Verify Action gear actions
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View Certificate']
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='Edit Certificate']

Click on View applications action
    click element    xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']
    wait until element is visible   xpath=//th[text()='Application ID']   10s

Click on View certificate action
    click element    xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View Certificate']
    wait until element is visible   xpath=//div[text()='Mailing Address']   10s
    page should contain element   xpath=//div[text()='Mailing Address']
    page should contain element   xpath=//div[text()=' Physical Address']
    page should contain element   xpath=//a[text()='Edit']

Click on Edit certificate action
    click element    xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='Edit Certificate']
    wait until element is visible   xpath=//div[text()='Mailing Address']   10s

Click view difference on certificate action
    click element    xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View Difference From Last Update']



Click on company tab
    click element   id=company_tab
    wait until element is visible   xpath=//span[text()='Company Name']  10s
    page should contain element   xpath=//span[text()='Company Name']
    page should contain element  xpath=//span[text()='Business License Document']
    sleep  3s

Click on contact tab
    click element   id=contact_tab
    wait until element is visible   xpath=//div[text()='Technical Contact ']  10s
    page should contain element   xpath=//div[contains(text(),'Technical Contact')]
    page should contain element  xpath=//div[contains(text(),'Billing Contact')]
    page should contain element  xpath=//div[contains(text(),'Legal Contact')]
    sleep  3s

Click on application tab
    click element   id=application_tab
    wait until element is visible   xpath=//th[text()='Application ID']  10s
    page should contain element   xpath=//th[text()='Application ID']
    sleep  3s

Click on assessment tab
    click element   id=assessment_tab
    wait until element is visible   xpath=//th[text()='Assessment Name']  10s
    page should contain element   xpath=//th[text()='Assessment Name']

Capture old address values
    click element   id=general_tab
    wait until element is visible   id=mailingaddress    10s
    ${OLD_STREET} =   get value   id=mailingaddress
    set global variable   ${OLD_STREET}
    ${OLD_STREET} =   get value   id=mailingaddress
    set global variable   ${OLD_STREET}
    ${OLD_COUNTRY} =  get selected list label    id=mailingcountry
    set global variable   ${OLD_COUNTRY}
    ${OLD_STATE} =  get selected list label     id=mailingstate
    set global variable   ${OLD_STATE}
    ${OLD_CITY} =  get value  id=mailingcity
    set global variable   ${OLD_CITY}
    ${OLD_ZIP} =  get value   id=mailingzipcode
    set global variable   ${OLD_ZIP}



Edit certificate mailing address
    click element   id=general_tab
    input text   id=mailingaddress    ${NEW_STREET}
    select from list by label    id=mailingcountry      ${NEW_COUNTRY}
    select from list by label    id=mailingstate    ${NEW_STATE}
    input text   id=mailingcity    ${NEW_CITY}
    input text   id=mailingzipcode   ${NEW_ZIP}
    click element   id=submitAddress
    wait until element is visible   xpath=//li[text()='Certificate address updates sent successfully for staff approval']   15s

Verify the address difference on the view difference popup
    element text should be    //td[text()='Mailing Address Street']/../td[2]   ${OLD_STREET}
    element text should be    //td[text()='Mailing Address City']/../td[2]     ${OLD_CITY}
    element text should be    //td[text()='Mailing Address Zipcode']/../td[2]  ${OLD_ZIP}
    element text should be    //td[text()='Mailing Address State']/../td[2]    ${OLD_STATE}
    element text should be    //td[text()='Mailing Address Country']/../td[2]   ${OLD_COUNTRY}
    log   old values successfully verified for mailing address
    log to console   old values successfully verified for mailing address

    element text should be    //td[text()='Mailing Address Street']/../td[3]   ${NEW_STREET}
    element text should be    //td[text()='Mailing Address City']/../td[3]     ${NEW_CITY}
    element text should be    //td[text()='Mailing Address Zipcode']/../td[3]  ${NEW_ZIP}
    element text should be    //td[text()='Mailing Address State']/../td[3]    ${NEW_STATE}
    element text should be    //td[text()='Mailing Address Country']/../td[3]   ${NEW_COUNTRY}
    log   new values successfully verified for mailing address
    log to console   new values successfully verified for mailing address

Click on Push to CRM for certificate address changes
    wait until element is visible   //div[text()='Changed field in Address']   15s
    mouse down   id=approve_url
    click element   id=approve_url
    wait until element is visible   //li[text()='Certificate has been approved']   15s


Click on Decline for certificate address changes
    wait until element is visible   //div[text()='Changed field in Address']   15s
    mouse down   id=decline_url
    click element   id=decline_url
    wait until element is visible    //li[text()='Changes in the certificate have been declined']   15s

Capture old company values
    click element   id=company_tab
    wait until element is visible   id=companyName    10s
    ${OLD_COMPANY_NAME} =   get value   xpath=//input[@id='companyName']/../input[2]
    set global variable   ${OLD_COMPANY_NAME}
    ${OLD_BLD_FILENAME} =   get text   xpath=//span[@class='file-icon-label upload-application-document business_license_document_property']/a
    set global variable   ${OLD_BLD_FILENAME}

#-----------------------------------Csertificate Company Name change features------------------------------------------
Edit certificate company details
    click element   id=company_tab
    sleep  1s
    input text   id=companyName    ${NEW_COMPANY_NAME}
    Choose File  xpath=//input[@id='cmp_file']             C://Users//mayur.patidar//Desktop//Test Uploads//${NEW_BLD_FILENAME}
    wait until element is visible   id=bld_file_name   15s
    click element   id=submitCompany
    sleep  2s
    mouse down   xpath=//button[text()='Continue']
    click element   xpath=//button[text()='Continue']
    sleep  3s
    wait until element is visible   xpath=//li[text()='Certificate updates sent successfully for staff approval']   15s
    ${NEW_BLD_FILENAME1} =   get text   xpath=//span[@class='file-icon-label upload-application-document business_license_document_property']/a
    set global variable   ${NEW_BLD_FILENAME1}

Verify the company difference on the view difference popup
    element text should be    //td[text()='Company Name']/../td[2]   ${OLD_COMPANY_NAME}
    element should be visible   xpath=//td[text()='Company Document']/../td/ul/li[contains(text(),'${OLD_BLD_FILENAME}')]
    log   old values successfully verified for company name
    log to console   old values successfully verified for business file name

    element text should be    //td[text()='Company Name']/../td[3]   ${NEW_COMPANY_NAME}
    element should be visible   xpath=//td[text()='Company Document']/../td/ul/li[contains(text(),'${NEW_BLD_FILENAME1}')]
    log to console   new values successfully verified for company name
    log to console   new values successfully verified for business file name

Click on Push to CRM for certificate company changes
    wait until element is visible   //div[text()='Changed field in Company']   15s
    mouse down   id=approve_url
    click element   id=approve_url
    wait until element is visible   //li[text()='Certificate has been approved']   15s

Click on Decline for certificate company changes
    wait until element is visible   //div[text()='Changed field in Company']   15s
    mouse down   id=decline_url
    click element   id=decline_url
    wait until element is visible    //li[text()='Changes in the certificate have been declined']   15s

#-----------------------------------Csertificate Contact features------------------------------------------
Click on add new button for technical contact on the certificate
    click element   xpath=//div[text()='Technical Contact ']/../div[2]//a[@class='iframe-colorbox-addmore-certuser btn btn-default btn-add-new']
    sleep  3s
    wait until element is visible   xpath=//label[text()='Salutation']   10s

Fill the contact details
    [Arguments]   ${NEW_CONTACT_FNAME}     ${NEW_CONTACT_LNAME}  ${NEW_CONTACT_EMAIL}
    input text   id=fname     ${NEW_CONTACT_FNAME}
    input text   id=lname     ${NEW_CONTACT_LNAME}
    input text   id=email     ${NEW_CONTACT_EMAIL}
    input text   id=confirm_email     ${NEW_CONTACT_EMAIL}

Click on submit and add new contact details
    click element   xpath=//input[@name='submit']
    wait until element is visible   xpath=//li[text()='Contact added successfully']   10s

Verify the extra contact details are removed
    page should not contain element   xpath=//label[text()='Street']
    page should not contain element   xpath=//label[text()='City']
    page should not contain element   xpath=//label[text()='Zip/Pin Code']
    page should not contain element   xpath=//label[text()='State']
    page should not contain element   xpath=//label[text()='Country']

Capture old contacts of the certificate
    ${OLD_TECH_CONTACT}   get selected list label   id=applicanttechid
    set global variable   ${OLD_TECH_CONTACT}
    log to console     old tech contact is  '${OLD_TECH_CONTACT}'
    ${OLD_BILL_CONTACT}   get selected list label   id=applicantbillingid
    set global variable   ${OLD_BILL_CONTACT}
    ${OLD_LEGAL_CONTACT}   get selected list label   id=applicantlegalid
    set global variable   ${OLD_LEGAL_CONTACT}

Verify the old contacts of the certificate in the dropdown list
    ${LIST_OF_CONTACTS}    get list items   id=applicanttechid
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_TECH_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_BILL_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_LEGAL_CONTACT}
    ${LIST_OF_CONTACTS}    get list items   id=applicantbillingid
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_TECH_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_BILL_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_LEGAL_CONTACT}
    ${LIST_OF_CONTACTS}    get list items   id=applicantlegalid
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_TECH_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_BILL_CONTACT}
    list should contain value   ${LIST_OF_CONTACTS}     ${OLD_LEGAL_CONTACT}

Click on technical contact dropdpown
    wait until element is visible   xpath=//div[text()='Technical Contact ']  10s
    click element  id=applicanttechid

Click on billing contact dropdpown
    wait until element is visible   id=applicantbillingid   10s
    click element  id=applicantbillingid

Click on legal contact dropdpown
    wait until element is visible   id=applicantlegalid   10s
    click element  id=applicantlegalid

click on update contact button
    click element  id=submitContact
    wait until element is visible   xpath=//li[text()='Certificate contact updated successfully']  10s