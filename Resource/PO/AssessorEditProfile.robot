*** Settings ***
Documentation    Suite description
Resource  ../Resource/Common_Lib.robot
Library   Selenium2Library



*** Keywords ***
Edit Basic Profile
    wait until element is visible  xpath=//div[text()='Basic Information']  30s
    click element  xpath=//button[@id='basic_information']/i
    input text  xpath=//label[text()='Title/Position']/../input  Quality Analyst
    input text  xpath=//label[text()='Company']/../input  HOL Ltd.
    input text  xpath=//label[text()='Years of Experience']/../input  09
    click element  id=basic_information
#    wait until element is visible  xpath=//li[text()='Profile updated successfully']  20s

Edit Contact Information
    wait until element is visible  xpath=//div[text()='Contact Information']  30s
    Scroll Page To Location  300  300
    click element  id=contact_information
    input text  id=assessor-mobile  9991111111
    input text  id=address  101,St Lane
    input text  id=city  Los Angeles
    select from list by label  id=state  LA

    select from list by label  id=country  USA
    input text  id=zipcode  454512
    sleep  3s
    click element  id=contact_information

Edit Emergency Contact Information
    wait until element is visible  xpath=//div[text()='Emergency Contact Information']  30s
    Scroll Page To Location  300  600
    click element  xpath=//button[@id='emergency_contact_information']/i
    input text  id=eci-name1   C Name 1
    input text  id=eci-relation1  Brother
    input text  id=eci-mobile1  8881240929
    input text  id=eci-email1  roy@yopmail.com
    input text  id=eci-name2   C Name 2
    input text  id=eci-relation2  Sister
    input text  id=eci-mobile2  8881240829
    input text  id=eci-email2  jen@yopmail.com
    click element  id=emergency_contact_information
#    wait until element is visible  xpath=//li[text()='Profile updated successfully']  20s

Add Skills Expertise
    wait until element is visible  xpath=//div[text()='Skills & Experience']  30s
    Scroll Page To Location  300  1900

    click element  xpath=//a[text()='${SKILLS_PROGRAM}']
    Run Keyword If   '${SKILLS_PROGRAM}' == 'BDA'  click element   id=building_department_accreditation
    Run Keyword If   '${SKILLS_PROGRAM}' == 'CL'  click element   id=calibration_lab
    select checkbox  id=structural_1
    select checkbox  id=plumbing_1
    select checkbox  id=fire_1
    select checkbox  id=mechanical_1
    Run Keyword If   '${SKILLS_PROGRAM}' == 'BDA'  click element   id=building_department_accreditation
    Run Keyword If   '${SKILLS_PROGRAM}' == 'CL'  click element   id=calibration_lab


