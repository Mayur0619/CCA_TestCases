*** Settings ***
Documentation    Certificate module UAT test cases for staff and contact
Library    Selenium2Library
Library    Collections
Resource   ../Resource/loginLogout.robot
#Resource  ../Resource/PO/CCA_CertificateModule_PO.robot
Resource   ../Resource/commonLib.robot
Resource   ../Resource/keywordLib.robot
Resource   ../Resource/commonViewEditCertificate.robot

Test Setup  Launch Browser
Test Teardown  Close BR

*** Variables ***
${BROWSER} =  gc                                            #Browser used
${CUSTOMER EMAIL} =  ibreccustomer1@yopmail.com             #Customer email address
${CUSTOMER_PASSWORD} =  Admin@2018                          #Customer portal password
${APP_URL} =  https://portal-qa.iasonline.org/              #Testing URL
${STAFF_ID} =  pbothara                                     #Staff portal username
${STAFF_PASSWORD} =  Welcome#1                              #Staff portal password
#------------------CCA certificate module----------------------
${CERTIFICATE_NAME} =  TL-8041                              #Name of the certificate TL-7890
${OLD_STREET}
${OLD_COUNTRY}
${OLD_STATE}
${OLD_CITY}
${OLD_ZIP}
${NEW_STREET} =   105,st                                     # For example - any free text
${NEW_COUNTRY} =  Egypt                                      #For example - USA; India; Greece; Italy; China
${NEW_STATE} =  LA                                           # For example - NY; FL; TX; CA;
${NEW_CITY} =  New York 5                                    # For example - any free text
${NEW_ZIP} =  1231365                                        #Zip should be alphanumeric and of 3-9 characters
${OLD_COMPANY_NAME}
${OLD_BLD_FILENAME}
${NEW_COMPANY_NAME} =  Zou Inc. 55                            #${NEW_COMPANY_NAME_NUMBER}
${NEW_BLD_FILENAME} =  Desired-Scope-of-Accreditation-for-TL_fillable-1.pdf
${NEW_T_CONTACT_FNAME} =  Zic
${NEW_T_CONTACT_LNAME} =  Technical User 55                   #${NEW_T_CONTACT_LNAME_NUMBER}
${NEW_T_CONTACT_EMAIL} =  zic.tuser55@yopmail.com

*** Test Cases ***
#TC30__TC31_Contact_Verify that the users have the following options in the action gear for the certificates and Verify that the users can view the applications linked with the particular certificate
#    [Tags]    Verify that the users have the following options in the action gear for the certificates and Verify that the users can view the applications linked with the particular certificate
#    Login as Customer
#    Click on Certificate Side Menu
#    wait until page contains  Certificates    10s
#    input text   xpath=//input[@class='form-control input-sm']   ${CERTIFICATE_NAME}
#    sleep  3s
#    click element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/a
#    wait until element is visible  xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']   10s
#    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']
#    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View Certificate']
#    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='Edit Certificate']

TC30_TC31_Staff_Verify that the users have the following options in the action gear for the certificates and Verify that the users can view the applications linked with the particular certificate
    [Tags]    Verify that the users have the following options in the action gear for the certificates and Verify that the users can view the applications linked with the particular certificate
    Login as Staff
    Click on Certificate Side Menu
    wait until page contains  Certificates    10s
    input text   xpath=//input[@class='form-control input-sm']   ${CERTIFICATE_NAME}
    sleep  5s
    click element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/a
    wait until element is visible  xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']   10s
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View Certificate']
    page should contain element   xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='Edit Certificate']

    click element    xpath=//td[contains(text(),'${CERTIFICATE_NAME}')]/../td[4]/div/ul/li/a[@title='View applications']
    wait until element is visible   id=application_tab   10s

#TC32_Contact_Verify that the contacts can access their applications from the Certificate listing only
#    [Tags]    Verify that the users can view the certificate details
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    Verify Action gear actions
#    Click on View applications action
#
#TC33_Contact_Verify that the users can view the certificate details
#    [Tags]    Verify that the users can view the certificate details
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    Verify Action gear actions
#    Click on View certificate action
#    Click on company tab
#    Click on contact tab
#    Click on application tab
#    Click on assessment tab
#
#TC33_Staff_Verify that the users can view the certificate details
#    [Tags]    Verify that the users can view the certificate details
#    Login as Staff
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    Verify Action gear actions
#    Click on View certificate action
#    Click on company tab
#    Click on contact tab
#    Click on application tab
#    Click on assessment tab
#
#TC34_Contact_Verify that the users can edit the address details on the certificate
#    [Tags]    Verify that the users can edit the address details on the certificate
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    Click on Edit certificate action
#    page should contain element   xpath=//div[text()='Mailing Address']
#    sleep  1s
#    Capture old address values
#    Edit certificate mailing address
#
#TC41_Staff_Verify that address changes declined by the staff user_for address
#    [Tags]    Verify that address changes would require staff approval.
#    Login as Staff
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    Click view difference on certificate action
#    sleep  3s
#    Verify the address difference on the view difference popup
#    Click on Decline for certificate address changes

TC35_Staff_Verify that address changes would require staff approval
    [Tags]    Verify that address changes would require staff approval.
    Login as Customer
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click on Edit certificate action
    page should contain element   xpath=//div[text()='Mailing Address']
    sleep  1s
    Edit certificate mailing address
    Logout
    Login as Staff
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click view difference on certificate action
    sleep  3s
    Click on Push to CRM for certificate address changes

TC37_Contact_Verify that the users can edit the Company name on the certificate
    [Tags]    Verify that the users can edit the address details on the certificate
    Login as Customer
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click on Edit certificate action
    page should contain element   xpath=//div[text()='Mailing Address']
    sleep  1s
    Click on company tab
    Capture old company values
    Edit certificate company details

TC40_TC41_Staff_Verify that once declined by the staff member, the changes would revert to old values_for company name
    [Tags]    Verify that once declined by the staff member, the changes would revert to old values_for company name
    Login as Staff
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click view difference on certificate action
    sleep  5s
    Verify the company difference on the view difference popup
    Click on Decline for certificate company changes

TC38_Staff_Verify that company name changes would require staff approval
    [Tags]    Verify that company name changes would require staff approval
    Login as Customer
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click on Edit certificate action
    page should contain element   xpath=//div[text()='Mailing Address']
    sleep  1s
    Click on company tab
    Edit certificate company details
    Logout
    Login as Staff
    Click on Certificate Side Menu
    Search for certificate
    Click on action gear against certificate
    Click view difference on certificate action
    sleep  3s
    Click on Push to CRM for certificate company changes

#TC47_TC48_Contact_Verify that the user can add a new contact on the certificate__Verify that the address fields are removed from the 'Add Contact' pop up
#    [Tags]    Verify that the user can add a new contact on the certificate__Verify that the address fields are removed from the 'Add Contact' pop up
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    click on edit certificate action
#    click on contact tab
#    sleep  3s
#    Click on add new button for technical contact on the certificate
#    Verify the extra contact details are removed
#    Fill the contact details   ${NEW_T_CONTACT_FNAME}    ${NEW_T_CONTACT_LNAME}   ${NEW_T_CONTACT_EMAIL}
#    Click on submit and add new contact details

TC49_Staff_Verify that the address fields are removed from the 'Add Contact' pop up
    [Tags]    Verify that the address fields are removed from the 'Add Contact' pop up
    Login as Staff
    Click on Certificate Side Menu
    Search for certificate
    sleep  2s
    Click on action gear against certificate
    click on edit certificate action
    click on contact tab
    sleep  3s
    Click on add new button for technical contact on the certificate
    Verify the extra contact details are removed
    log   Extra contact details are removed from add contact popup

#TC44_TC45_Contact_Verify that the user can change the contacts on the certificate__Verify that contact dropdown is present and clickable on the certificate details page
#    [Tags]    Verify that the user can change the contacts on the certificate__Verify that contact dropdown is present and clickable on the certificate details page
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    click on edit certificate action
#    click on contact tab
#    sleep  3s
#    Capture old contacts of the certificate
#    Verify the old contacts of the certificate in the dropdown list
#    log   All the contacts are listed in the technical, billing anf legal contact dropdown
#    select from list by index  id=applicanttechid    2
#    sleep  2s
#    select from list by index   id=applicantbillingid    3
#    sleep  2s
#    select from list by index   id=applicantlegalid    1
#    sleep  2s
#    click on update contact button
#
#TC46_Contact_Verify that there will be an option to List all available contacts of the logged in userp
#    [Tags]    Verify that there will be an option to List all available contacts of the logged in user
#    Login as Customer
#    Click on Certificate Side Menu
#    Search for certificate
#    Click on action gear against certificate
#    click on edit certificate action
#    click on contact tab
#    sleep  3s
#    select from list by index  id=applicanttechid    4
#    sleep   3s
#    click element   id=cboxClose
#    select from list by index   id=applicantbillingid    4
#    sleep   3s
#    click element   id=cboxClose
#    select from list by index   id=applicantlegalid    4
#    sleep   3s
#    click element   id=cboxClose
#    log   All the contacts are listed in the technical, billing anf legal contact dropdown