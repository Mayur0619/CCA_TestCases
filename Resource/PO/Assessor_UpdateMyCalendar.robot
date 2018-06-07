*** Settings ***
Documentation    Suite description
Library   Selenium2Library
Library   DateTime
Resource  ../Resource/Common_Lib.robot

*** Keywords ***
Mark Available Date
#    Run keyword if  '${LHS_HEADER}' ==   click element  xpath=//div[@id='sidebar_menu_aside']/*/*/*/*/li[13]/a
#    ${currentDate} =   Get Current Date
#    ${currentDate} =	Convert Date	${currentDate}	   date_format=%m-%d-%Y %H:%M:%S
#    ${currentDate} =	Convert Date	${currentDate}		result_format=%m-%d-%Y
#    log to console  ${currentDate}
#    Scroll Page To Location   300  1400
#    click element  //div[text()='${calMonth}']/../div[2]/*/*/*/*/div[text()='${calDate}']
##    click element  //input[@class='btn btn-primary pull-right btn-calendar-upper']
##    wait until element is visible  //li[text()='Calendar updated successfully']  30s

    ${currentDate} =   Get Current Date
    ${currentDate} =  Convert Date    ${currentDate}  date_format=%Y-%m-%d    result_format=%m-%d-%y
#    ${currentDate} =  Get Current Date  result_format='%Y-%m-%d %H:%M'
    log to console  ${currentDate}
    ${updatedDate} =  get text  //div[@class='pull-right hidden-md hidden-sm hidden-xs']/span

    ${datetime} =  Convert Date  ${updatedDate}  datetime
    Should Be Equal As Integers  ${datetime.year}  2017

    log to console  ${updatedDate}


Mark Unavailable Date
    click element  //div[text()='${calMonth}']/../div[2]/*/*/*/*/div[text()='${calDate}']