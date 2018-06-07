*** Settings ***
Documentation  Common functions used for different TC's are written here
Library    Selenium2Library
Resource   ../Test_Suites/Assessments.robot
Resource   ../Test_Suites/CCA_EditProfileModule.robot


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
${NEW_STREET} =   101,st
${NEW_COUNTRY} =  USA
${NEW_STATE} =  NY
${NEW_CITY} =  New York
${NEW_ZIP} =  672343
${OLD_COMPANY_NAME}
${OLD_BLD_FILENAME}
${NEW_COMPANY_NAME} =  Zou Inc.
${NEW_BLD_FILENAME} =  Desired-Scope-of-Accreditation-for-TL_fillable-1.pdf
${NEW_T_CONTACT_FNAME} =  Zic
${NEW_T_CONTACT_LNAME} =  Technical User 3
${NEW_T_CONTACT_EMAIL} =  zic.tuser2@yopmail.com

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

Clicm JAVA
    [Arguments]    ${x_location}    ${y_location}
    execute javascript