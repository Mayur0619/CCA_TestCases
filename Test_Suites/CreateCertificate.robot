*** Settings ***
Documentation    Suite description
Library  Selenium2Library
Library  Dialogs
Resource  ../Resource/Common_Lib.robot
Resource  ../Resource/Keyword_Lib.robot
Resource  ../Resource/PO/CreateCertificateData.robot

*** Variables ***
${quoteid_captured}=  IASQ01127


*** Test Cases ***
#Submit a quote by customer
#    Launch Browser
#    Login as Customer
#    Click on Quotation Side Menu
#    ${quoteid_captured} =  Get a Quote
#    set global variable   ${quoteid_captured}
#
#Add quote amount by staff user
#    Launch Browser
#    Login as Staff
#    Click on Quotation Side Menu
#    log to console  ${quoteid_captured}
#    Add quote amount  ${quoteid_captured}

Submit application by customer
   Launch Browser
   Login as Customer
   Click on Quotation Side Menu
   Create application against quotation    ${quoteid_captured}

#Push application to CRM by Staff
#    Launch Browser
#    Login as Staff
#    Click on New Applications Side Menu
#    Push application to CRM by Staff