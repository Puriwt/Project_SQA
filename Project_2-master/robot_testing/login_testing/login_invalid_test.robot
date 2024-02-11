*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***
${ERROR ALERT}    Login Failed: Your user ID or password is incorrect
${DELAY}    1s


*** Test Cases ***
Invalid Username Login
    Open Even Login Page
    Input Username    students.cs@kku.ac.th
    Input Password Column    12345Student
    Submit RegisterButton
    Login Page Still Open
    Sleep    ${DELAY}
    [Teardown]    Close Browser

Blank Username Login
    Open Even Login Page
    Input Username    ${EMPTY}
    Input Password Column    12345678
    Submit RegisterButton
    Login Page Still Open
    Sleep    ${DELAY}
    [Teardown]    Close Browser
    

Blank Password Login
    Open Even Login Page
    Input Username    admin@gmail.com
    Input Password Column    ${EMPTY}
    Submit RegisterButton
    Login Page Still Open
    Sleep    ${DELAY}
    [Teardown]    Close Browser


*** Keywords ***
Alert Error Message
    Login Page Still Open
    Element Should Contain    error_alert    ${ERROR ALERT}