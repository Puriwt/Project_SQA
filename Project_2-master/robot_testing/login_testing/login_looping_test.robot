*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***
${ALERT LOOP ERROR}    Too many login attempts. Please try again
*** Test Cases ***
Login Loop Test
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    Login Loop 1-10 Time
    
    [Teardown]    Close Browser

*** Keywords ***
Login Loop 1-10 Time
    Login Resource Student
    Submit RegisterButton
    Dashboard Student Should Be Open
    [Teardown]    Close Browser

Login Loop 11 Time Alert Error
    Login Resource Student
    Submit RegisterButton
    Element Should Contain    error_alert    ${ALERT LOOP ERROR}
    Sleep    2s