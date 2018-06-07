*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Resource  ../Resource/Common_Lib.robot

*** Keywords ***

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


