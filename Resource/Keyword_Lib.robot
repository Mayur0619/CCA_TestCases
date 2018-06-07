*** Settings ***
Documentation  Keyword used for different TC's are written here
Library   Selenium2Library
Resource  ../Resource/PO/Login.robot
Resource  ../Resource/PO/LeftSidePanel.robot
#Resource   ../Test_Suites/Assessments.robot



*** Keywords ***
Login as Staff
    Login.Staff Login to Portal

Login as Assessor
    Login.Assessor Login to portal

Navigate on Left Side Panel
    Click on Side Header

Login as Customer
    Login.Customer Login to Portal