*** Settings ***
Documentation    All the common keywords for the different test cases are here
Library    Selenium2Library
Library           String

*** Variables ***
${BROWSER} =  gc
${CUSTOMER EMAIL} =  ibreccustomer1@yopmail.com
${CUSTOMER_PASSWORD} =  Admin@2018
${APP_URL} =  https://portal-qa.iasonline.org/
${Select Accreditation Program} =  Metal Building Inspection   # Building Department Accreditation  #Inspection Agency
${STAFF_ID} =  pbothara
${STAFF_PASSWORD} =  Welcome#1
${ASSESSOR_EMAIL} =  ibtmassessor1@yopmail.com
${ASSESSOR_PASSWORD} =  Admin@2017
${ASSESSMENT_NAME} =  AssessmentTest1-Pre-Assessment-2017
${ACTIVITY_TYPE} =  Field Visit           #Option shhould be "Office Visit" or "Field Visit"
${ACTIVITY_DURATION} =  1                  #Duartion is in number of day(s)
${Assessor1_Email} =  ibtmassessor1@yopmail.com
${url} =  https://portal-qa.iasonline.org/assessment-details/?key=YXNtaWQ9MTQ2Ng==
${SKILLS_PROGRAM} =  BDA
${calMonth} =  December
${calDate} =  22
#------------------CCA certificate module----------------------
${CERTIFICATE_NAME} =  TL-8041   #TL-7890
${OLD_STREET}
${OLD_COUNTRY}
${OLD_STATE}
${OLD_CITY}
${OLD_ZIP}
${NEW_STREET} =   103,st       # For example - any free text
${NEW_COUNTRY} =  Egypt         #For example - USA; India; Greece; Italy; China
${NEW_STATE} =  LA              # For example - NY; FL; TX; CA;
${NEW_CITY} =  New York 1        # For example - any free text
${NEW_ZIP} =  1231362          #Zip should be alphanumeric and of 3-9 characters
${OLD_COMPANY_NAME}
${OLD_BLD_FILENAME}
${NEW_COMPANY_NAME} =  Zou Inc. 6   #${NEW_COMPANY_NAME_NUMBER}
${NEW_BLD_FILENAME} =  Desired-Scope-of-Accreditation-for-TL_fillable-1.pdf
${NEW_T_CONTACT_FNAME} =  Zic
${NEW_T_CONTACT_LNAME} =  Technical User 6  #${NEW_T_CONTACT_LNAME_NUMBER}
${NEW_T_CONTACT_EMAIL} =  zic.tuser6@yopmail.com

*** Keywords ***
Launch Browser
  OPEN BROWSER   ${APP_URL}   ${BROWSER}
  Maximize Browser Window
  set selenium timeout   90 seconds
  set selenium implicit wait  5 seconds

Navigate URL
  go to  ${url}

Close BR
  close browser
  log to console  Test Case Ends Here

Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})

Assessor Accept contract
    ${present} =  Run Keyword And Return Status  Element Should Be Visible    xpath=//button[text()='Accept']
    Run Keyword If   '${present}' == 'TRUE'  click element   xpath=//button[text()='Accept']

#Company Contact for the contact/staff login
Verify company contact menu removed
    wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a   30s
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Company')]
    page should not contain element   xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li/a[contains(text(),'Contact')]

Navigate URL to Portal
    Go to  http://172.16.7.53
    wait until page contains  Sign In


#Side menu options for Assessor login
Click on Side Header
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[10]/a  30s
  Run keyword if  "${LHS_HEADER}" == "Assessments"  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[10]/a
  Run keyword if  '${LHS_HEADER}' == "Assessors"  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[13]/a

Click on My Calendar Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[6]/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[6]/a

Click on Assessors Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[10]/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[13]/a

Click on My Profile Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-editprofile']/a

Click on Quotation Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-quotations']/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-quotations']/a

Click on New Applications Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-application']/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-application']/a
  wait until page contains  Applications    20s

Click on Certificate Side Menu
  wait until page contains element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a  30s
  click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[@class='menu-my-certificates']/a
  wait until page contains  Certificates    20s

Expand Side Bar
  wait until page contains element  xpath=//span[@id='main_icon']  50s
  ${SIDEBAR_STATUS}=   Run Keyword And Return Status    Element Should Be Visible    xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[10]/a
  Run keyword if  ${SIDEBAR_STATUS} == "False"  click element  xpath=//span[@id='main_icon']


Collapse Side Bar
    log to console  starting collapse
    wait until page contains element  xpath=//span[@id='main_icon']  50s
    ${SIDEBAR_STATUS}=   Run Keyword And Return Status    element should be visible    xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[10]/a
    log to console  ${SIDEBAR_STATUS}
    Run keyword if  ${SIDEBAR_STATUS}  click element    xpath=//span[@id='main_icon']