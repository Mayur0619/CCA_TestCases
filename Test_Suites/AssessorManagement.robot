*** Settings ***
Documentation    Suite description
Resource  ../Resource/PO/Login.robot
Resource  ../Resource/Common_Lib.robot
Resource  ../Resource/PO/LeftSidePanel.robot
Resource  ../Resource/PO/AssessorEditProfile.robot
Resource  ../Resource/PO/Assessor_SubmitFeedback.robot
Resource  ../Resource/PO/Assessor_UpdateMyCalendar.robot


Test Setup  Launch Browser
Test Teardown  Close BR


*** Variables ***
${LHS_HEADER} =  Assessors

*** Test Cases ***
#Add new assessor
#    [Documentation]  Add new assessor
#    [Tags]  TC_0001
#    Staff Login to Portal
#
#
#
#Edit Assessor Profile
#    [Documentation]  Edit Assessor Profile
#    [Tags]  TC_0002
#    Assessor Login to portal
#    Click on Edit Profile Side Menu
#    Edit Basic Profile
#    Edit Contact Information
#    Edit Emergency Contact Information
#
#Edit Assessor Skills
#    [Documentation]  Edit Assessor Profile
#    [Tags]  TC_0003
#    Assessor Login to portal
#    Click on Edit Profile Side Menu
#    Add Skills Expertise
#
#Submit Feedback Feature
#    [Documentation]  Submit Feedback Feature
#    [Tags]  TC_0003
#    Assessor Login to portal
#    Submit Feedback

Update My Calendar
    [Documentation]  Update My Calendar
    [Tags]  TC_0004
    Assessor Login to portal
    Click on My Calendar Side Menu
    Mark Available Date