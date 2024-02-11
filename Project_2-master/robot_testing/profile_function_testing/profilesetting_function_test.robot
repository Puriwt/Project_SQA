*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***
${PROFILE PAGE}    http://${SERVER}/profile
${ACCOUNT TAB}    account-tab
${FNAME EN}    inputfNameEN
${LNAME EN}    inputlNameEN
${FNAME TH}    inputfNameTH
${LNAME TH}    inputlNameTH
${EMAIL}    inputEmail
${SOURCE FN EN}    Students
${SOURCE LN EN}    Computer Science
${SOURCE FN TH}    นักศึกษา
${SOURCE LN TH}    วิทยาการคอมพิวเตอร์

${ERROR EMAIL}    error-email
${ERROR FNAME EN}    error-fNameEN
${ERROR LNAME EN}    error-lNameEN
${ERROR FNAME TH}    error-fNameTH
${ERROR LNAME TH}    error-lNameTH

${ERROR EMAIL MSG BLANK}    The email field is required.
${ERROR EMAIL MSG DUPLICATE}    The email has already been taken.
${ERROR FNAME EN MSG BLANK}    The first name (EN) field is required.
${ERROR LNAME EN MSG BLANK}    The last name (EN) field is required.
${ERROR FNAME TH MSG BLANK}    The first name (TH) field is required.
${ERROR LNAME TH MSG BLANK}    The last name (TH) field is required.

${ERROR MSG INVALID}    The value may only contain letters.
${ERROR MSG FORMAT INVALID}    Invalid format input field.

*** Test Cases ***

First En BLANK
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${FNAME EN}
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR FNAME EN}    ${ERROR FNAME EN MSG BLANK}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Last En BLANK
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${LNAME EN}
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR LNAME EN}    ${ERROR LNAME EN MSG BLANK}
    Still Keep This Profile Page
    [Teardown]    Close Browser

First Th BLANK
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${FNAME TH}
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR FNAME TH}    ${ERROR FNAME TH MSG BLANK}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Last Th BLANK
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${LNAME TH}
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR LNAME TH}    ${ERROR LNAME TH MSG BLANK}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Email BLANK
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${EMAIL}
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR EMAIL}    ${ERROR EMAIL MSG BLANK}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Email Duplicate
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${EMAIL}
    Input Text    ${EMAIL}    puriwat.sr@kkumail.com
    Click Button    up-date-btn-pro
    Element Should Contain    ${ERROR EMAIL}    ${ERROR EMAIL MSG DUPLICATE}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Invalid Input
    Login And Click Profile
    Still Keep This Profile Page
    Clear Element Text   ${FNAME EN}
    Input Text    ${FNAME EN}    +@$%&^!~$^
    Click Button    up-date-btn-pro
    Element Should Contain    ${FNAME EN}    ${ERROR MSG INVALID}
    Still Keep This Profile Page
    [Teardown]    Close Browser
    

Invalid Format Input
    Login And Click Profile
    Still Keep This Profile Page
    Clear Text Fill
    Input Text   ${FNAME EN}   ${SOURCE FN TH}
    Input Text    ${LNAME EN}    ${SOURCE LN TH}
    Input Text    ${FNAME TH}    ${SOURCE FN EN}
    Input Text    ${LNAME TH}    ${SOURCE LN EN}
    Input Text    ${EMAIL}    students.cs@kkumail.com
    Click Button    up-date-btn-pro
    Element Should Contain    ${FNAME EN}    ${ERROR MSG FORMAT INVALID}
    Still Keep This Profile Page
    [Teardown]    Close Browser

Valid Input
    Login And Click Profile
    Still Keep This Profile Page
    Clear Text Fill
    Input Text   ${FNAME EN}   ${SOURCE FN EN}
    Input Text    ${LNAME EN}    ${SOURCE LN EN}
    Input Text    ${FNAME TH}    ${SOURCE FN TH}
    Input Text    ${LNAME TH}    ${SOURCE LN TH}
    Input Text    ${EMAIL}    students.cs@kkumail.com
    Click Button    up-date-btn-pro
    [Teardown]    Close Browser




*** Keywords ***
Login And Click Profile
    Login Resource Student
    Submit RegisterButton
    Click Link    ${PROFILE PAGE}
    Click Link    ${ACCOUNT TAB}

Clear Text Fill
    Clear Element Text   ${FNAME EN}
    Clear Element Text    ${LNAME EN}
    Clear Element Text    ${FNAME TH}
    Clear Element Text    ${LNAME TH}
    Clear Element Text    ${EMAIL}

Still Keep This Profile Page
    Location Should Be    ${PROFILE PAGE}
    Element Should Contain    Profile_Setting    Profile Settings