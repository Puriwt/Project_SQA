*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***

*** Test Cases ***
Open Login Page For Admin
    Login Resource Admin
    Submit RegisterButton
    Dashboard Admin Should Be Open
    [Teardown]    Close Browser
    
Open Login Page For Student
    Login Resource Student
    Submit RegisterButton
    Dashboard Student Should Be Open    
    [Teardown]    Close Browser

Open Login Page For Teacher
    Login Resource Teacher
    Submit RegisterButton
    Dashboard Teacher Should Be Open
    [Teardown]    Close Browser


Open Login Page For Header Project
    Login Resource Header Project
    Submit RegisterButton
    Dashboard Header Project Should Be Open
    [Teardown]    Close Browser


Open Login Page For Staff
    Login Resource Staff
    Submit RegisterButton
    Dashboard Staff Should Be Open
    [Teardown]    Close Browser

    
*** Keywords ***