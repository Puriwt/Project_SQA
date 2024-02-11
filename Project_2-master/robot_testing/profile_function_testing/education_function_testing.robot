*** Settings ***
Library   SeleniumLibrary
Resource    ../resource.robot

*** Variables ***
${PROFILE PAGE}    http://${SERVER}/profile
${B NAME ID}    inputlBUName
${ALERT B NAME ID}    alertBUName
${BQU NAME ID}    inputlBQuName
${ALERT BQU NAME ID}    alertBQuName
${BL YEAR ID}    inputlYear
${ALERT BL YEAR ID}    alertbYear
${MU NAME ID}    inputlMUName
${ALERT MU NAME ID}    alertMUName
${MQU NAME ID}    inputlMQuName
${ALERT MQU NAME ID}    alertMQuName
${ML YEAR ID}    inputlYear
${ALERT ML YEAR ID}    alertmYear
${D NAME ID}    inputlDUName
${ALERT D NAME ID}    alertDUName
${DQU NAME ID}    inputlDQuName
${ALERT DQU NAME ID}    alertDQuName
${DL YEAR ID}    inputlYear
${ALERT DL YEAR ID}    alertdYear
${Y BEFORE ALERT}    ปีที่จบการศึกษาไม่ถูกต้อง
${BY ALERT}    ระดับปริญญาตรีไม่สามารถเรียนจบก่อนระดับปริญญาโท หรือปริญญาเอกได้ กรุณากรอกข้อมูลให้ถูกต้อง
${MY ALERT}    ระดับปริญญาโทไม่สามารถเรียนจบก่อนระดับปริญญาเอกได้ กรุณากรอกข้อมูลให้ถูกต้อง




*** Test Cases ***
Open Education Tab
    Login And Click Profile
    Click Link    education-tab
    Education Tab Should Be Open

Input Valid Year
    Login And Click Profile
    Click Link    education-tab
    Education Tab Should Be Open
    Clear Text Fill
    Input Name And QU Name
    Input B Year    2555
    Input M Year    2558
    Input D Year    2561
    Click Button    update-edu
    [Teardown]    Close Browser

Input Invalid B Year
    Login And Click Profile
    Click Link    education-tab
    Sleep    1
    Education Tab Should Be Open
    Clear Text Fill
    Input Name And QU Name
    Input B Year    2600
    Input M Year    2558
    Input D Year    2555
    Click Button    update-edu
    Element Should Contain    ${ALERT B NAME ID}    ${BY ALERT}
    [Teardown]    Close Browser

Input Invalid M Year
    Login And Click Profile
    Click Link    education-tab
    Sleep    1
    Education Tab Should Be Open
    Clear Text Fill
    Input Name And QU Name
    Input B Year    2555
    Input M Year    2600
    Input D Year    2555
    Click Button    update-edu
    Element Should Contain    ${ALERT B NAME ID}    ${BY ALERT}
    [Teardown]    Close Browser

Input Invalid Year Future
    Login And Click Profile
    Click Link    education-tab
    Education Tab Should Be Open
    Clear Text Fill
    Input Name And QU Name
    Input B Year    2600
    Input M Year    2650
    Input D Year    2700
    Click Button    update-edu
    Element Should Contain    ${ALERT B NAME ID}    ${Y BEFORE ALERT}
    [Teardown]    Close Browser

*** Keywords ***
Login And Click Profile
    Login Resource Teacher
    Submit RegisterButton
    Click Link    ${PROFILE PAGE}

Education Tab Should Be Open
    Element Should Contain    education-title    ประวัติการศึกษา

Clear Text Fill
    Clear Element Text    ${B NAME ID}
    Clear Element Text    ${BQU NAME ID}
    Clear Element Text    ${BL YEAR ID}
    Clear Element Text    ${MU NAME ID}
    Clear Element Text    ${MQU NAME ID}
    Clear Element Text    ${ML YEAR ID}
    Clear Element Text    ${D NAME ID}
    Clear Element Text    ${DQU NAME ID}
    Clear Element Text    ${DL YEAR ID}


Input Name And QU Name
    Input B Name    มหาวิทยาลัยราชภัฏเชียงใหม่
    Input B Qu Name    วิทยาศาตร์บัณฑิต สาขาคณิตศาสตร์
    Input M Name    มหาวิทยาลัยขอนแก่น
    Input M Qu Name    วิศวกรรมศาสตร์คอมพิวเตอร์
    Input D Name    มหาวิทยาลัยเชียงใหม่
    Input D Qu Name    บริหารธุรกิจบัณฑิต สาขาการตลาด

Input B Name
    [Arguments]    ${B NAME}
    Input Text    ${B NAME ID}    ${B NAME}

Input B Qu Name
    [Arguments]    ${BQU NAME}
    Input Text    ${BQU NAME ID}    ${BQU NAME}

Input B Year
    [Arguments]    ${BL YEAR}
    Input Text    ${BL YEAR ID}    ${BL YEAR}

Input M Name
    [Arguments]    ${MU NAME}
    Input Text    ${MU NAME ID}    ${MU NAME}

Input M Qu Name
    [Arguments]    ${MQU NAME}
    Input Text    ${MQU NAME ID}    ${MQU NAME}

Input M Year
    [Arguments]    ${ML YEAR}
    Input Text    ${ML YEAR ID}    ${ML YEAR}

Input D Name
    [Arguments]    ${D NAME}
    Input Text    ${D NAME ID}    ${D NAME}

Input D Qu Name
    [Arguments]    ${DQU NAME}
    Input Text    ${DQU NAME ID}    ${DQU NAME}

Input D Year
    [Arguments]    ${DL YEAR}
    Input Text    ${DL YEAR ID}    ${DL YEAR}