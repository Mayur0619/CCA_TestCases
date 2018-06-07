*** Settings ***
Documentation    Suite description1
Library   Selenium2Library
#Library   SeleniumLibrary
Library           Collections

*** Variables ***
${ADMIN_ID} =  iasportal2017@gmail.com
${ADMIN_PASSWORD} =  ibcitp@2016
${position} =  2

*** Keywords ***
Launch Browser
   OPEN BROWSER   https://portal-qa.iasonline.org/   GC
   MAXIMIZE BROWSER WINDOW
   set selenium timeout  300 seconds
#   Set Browser Implicit Wait  300 seconds

Close BR
  log to console  Test Case Ends Here

Login as admin
   input text  id=user_login  ${ADMIN_ID}
   input password  id=user_pass  ${ADMIN_PASSWORD}
   Click button  xpath =//*[@id="wp-submit"]
   wait until page contains  Dashboard



Add client id
   sleep  3s
   wait until page contains element  xpath=//div[text()='Programs']  60s
   scroll page to location    0   2500
#   log to console  focus set
   mouse over  xpath=//div[text()='Programs']
   click element  xpath=//div[text()='Programs']
   sleep  4s
   scroll page to location    0   2500
   click element  xpath=//a[text()='Assign Staff']
   sleep  10s

   wait until page contains element  xpath=//div[text()='Staff Associations']  60s
   mouse over  xpath=//select[@id='prog_id']

#------------------------------------------------------------------
#   ${Sel_value}=  get text  xpath=//select[@id='prog_id']/option[${position}]
#   log to console  ${Sel_value}
#   select from list  xpath=//select[@id='prog_id']  ${Sel_value}
#------------------------------------------------------------------

   sleep  2s
   ${one} =   Get List Items      id=prog_id     #get all values from 1st drop down
   log to console  ${one}
   :FOR    ${position}     IN RANGE    19
   \    Select program
   \    Exit For Loop If   ${position} ==  19

Select program
   sleep  2s
   ${Sel_value}=  get text  xpath=//select[@id='prog_id']/option[${position}]
   log to console  now going to select pogram ${Sel_value}
   select from list  xpath=//select[@id='prog_id']  ${Sel_value}
   log to console  now incrementing position
   ${position}  convert to integer   ${position}

   ${position}  set variable if   '${position}' < '20'     ${position}+1      ${position}
   log to console   new position is ${position}
   sleep  4s
   select from list  name=tbl_assign_staff_length   50
#   select from list  xpath=//select[@name='tbl_assign_staff_length']/option[3]


Scroll Page To Location
    [Arguments]    ${x_location}    ${y_location}
    Execute JavaScript    window.scrollTo(${x_location},${y_location})


*** Test Cases ***
Add Client ID
    [Tags]    Adding the client ID
    Launch Browser
    Login as admin
    Add client id


Remove Client ID
    [Tags]    Adding the client ID
    Launch Browser
    Login as admin