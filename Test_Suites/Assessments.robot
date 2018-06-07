*** Settings ***
Documentation  TC's are written here
Library   Selenium2Library
Library   String
Library   Dialogs
Library   ExcelLibrary
Resource  ../Resource/Common_Lib.robot
Resource  ../Resource/PO/Login.robot
Resource  ../Resource/PO/LeftSidePanel.robot
Resource  ../Resource/PO/AssessmentListingPage.robot
Resource  ../Resource/PO/AssessmentDetailsScheduleTab.robot
Test Setup  Launch Browser
Test Teardown  Close BR


*** Variables ***
${LHS_HEADER} =  Assessments

*** Test Cases ***

Add Assessor to Assessment
   [Documentation]  Adding an assessor to assessment
   [Tags]  TC_Add Assessor to Assessment
   Staff Login to Portal
#   Collapse Side Bar
#   Expand Side Bar
   Click on Side Header
   Search For Assessment
   Click on View Assessment Action
   Click on schedule tab
#   Click on Add New Scheduling Activity
#   Enter Activity Details
#   Click on Add Activity Button
   Click on Add Assessors
   Search for Assessor
   Select Assessor Chekbox
   Set as Lead Assessor
   Click on Add Selected Assessor


Accept assessment by assessor
    Assessor Login to portal
    Click on Side Header
    Search For Assessment
    Click on View Assessment Action