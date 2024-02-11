*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***
${DELAY}    0.5s
${PROFILE PAGE}    http://${SERVER}/profile
${PASSWORD SETTINGS PAGE}    Password Settings
${PROFILE SETTINGS PAGE}    Profile Settings
${OLD PASSWORD INVALID}    3210123
${PASSWORD VALID}    12345Student
${NEW PASSWORD INVALID}    111
${CURRENT PASSWORD ERROR}    current password is incorrect
${CNEW ERROR}    New password and Confirm new password must match
${NEW ERROR}    New password must have atleast 8 characters

*** Test Cases ***
Open Student Profile
    Open Student Profile Page
    Student Profile Page Should Be Open
    Sleep   ${DELAY}
    [Teardown]    Close Browser

Open Password Settings
    Open Student Profile Page
    Student Profile Page Should Be Open
    Click Link    password-tab
    Sleep   ${DELAY}
    Password Settings Should Be Open
    [Teardown]    Close Browser

Change Password With Invalid Old Password
    Open Student Profile Page
    Student Profile Page Should Be Open
    Click Link    password-tab
    Sleep   ${DELAY}
    Password Settings Should Be Open
    Input Text    inputpassword    ${OLD PASSWORD INVALID}
    Input Text    newpassword    ${PASSWORD VALID}
    Input Text    cnewpassword    ${PASSWORD VALID}
    Click Button    up-date-btn
    Sleep   ${DELAY}
    Element Should Contain    old-error    ${CURRENT PASSWORD ERROR}
    [Teardown]    Close Browser


Change Password With Invalid Confirm Password
    Open Student Profile Page
    Student Profile Page Should Be Open
    Click Link    password-tab
    Sleep   ${DELAY}
    Password Settings Should Be Open
    Input Text    inputpassword    ${PASSWORD VALID}
    Input Text    newpassword    ${PASSWORD VALID} 
    Input Text    cnewpassword    ${NEW PASSWORD INVALID}
    Click Button    up-date-btn
    Sleep   ${DELAY}
    Element Should Contain    cnew-error    ${CNEW ERROR}
    [Teardown]    Close Browser
Change Password With Invalid New Password
    Open Student Profile Page
    Student Profile Page Should Be Open
    Click Link    password-tab
    Sleep   ${DELAY}
    Password Settings Should Be Open
    Input Text    inputpassword    ${PASSWORD VALID}
    Input Text    newpassword    ${NEW PASSWORD INVALID}
    Input Text    cnewpassword    ${NEW PASSWORD INVALID}
    Click Button    up-date-btn
    Sleep   ${DELAY}
    Element Should Contain    new-error    ${NEW ERROR}
    [Teardown]    Close Browser

Change Password With Valid Data
    Open Student Profile Page
    Student Profile Page Should Be Open
    Click Link    password-tab
    Sleep   ${DELAY}
    Password Settings Should Be Open
    Input Text    inputpassword    ${PASSWORD VALID}
    Input Text    newpassword    ${PASSWORD VALID}
    Input Text    cnewpassword    ${PASSWORD VALID}
    Click Button    up-date-btn
    Sleep   ${DELAY}
    [Teardown]    Close Browser

    
*** Keywords ***
Open Student Profile Page
    Login Resource Student
    Submit RegisterButton
    Dashboard Student Should Be Open
    Click Link    ${PROFILE PAGE}

Student Profile Page Should Be Open
    Location Should Be    ${PROFILE PAGE}


Password Settings Should Be Open
    Element Should Contain    password_settings    ${PASSWORD SETTINGS PAGE}

