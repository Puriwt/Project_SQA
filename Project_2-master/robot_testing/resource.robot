*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary
*** Variables ***

${SERVER}         127.0.0.1:8000
${INDEX PAGE}    http://${SERVER}/
${LOGIN PAGE}    http://${SERVER}/login 
${DASHBORD PAGE}    http://${SERVER}/dashboard
${BROWSER}        Chrome
${WELCOME ADMIN}    ผู้ดูแลระบบ
${WELCOME TEACHER}    อาจารย์ ภาคคอม
${WELCOME STUDENT}    สวัสดี นักศึกษา วิทยาการคอมพิวเตอร์
${WELCOME HEADER}    หัวหน้าโครงการ
${WELCOME STAFF}    เจ้าหน้าที่ ทดสอบ
${WELCOME TITLE}    ยินดีต้อนรับเข้าสู่ระบบจัดการข้อมูลวิจัยของสาขาวิชาวิทยาการคอมพิวเตอร์

*** Keywords ***
Open Event Registration Page
    Open Browser    ${INDEX PAGE}     chrome
    Maximize Browser Window
    Index Page Should Be Open

Index Page Should Be Open
    Location Should Be    ${INDEX PAGE} 
    Title Should Be    ระบบข้อมูลงานวิจัย วิทยาลัยการคอมพิวเตอร์


Open Even Login Page
    Open Browser    ${LOGIN PAGE}    chrome
    Maximize Browser Window
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN PAGE}
    Title Should Be    Login

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password Column
    [Arguments]    ${password}
    Input Text    password    ${password}


Submit RegisterButton
    Click Button    loginbutton



Login Resource Admin
    Open Even Login Page
    Input Username    admin@gmail.com
    Input Password Column    12345678

Login Resource Student
    Open Even Login Page
    Input Username    students.cs@kkumail.com
    Input Password Column    12345Student

Login Resource Teacher
    Open Even Login Page
    Input Username    teacher.cs@kku.ac.th
    Input Password Column    12345678

Login Resource Header Project
    Open Even Login Page
    Input Username    header.p@kku.ac.th
    Input Password Column    12345678

Login Resource Staff
    Open Even Login Page
    Input Username    staff.t@kku.ac.th
    Input Password Column    12345678staff


Dashboard Admin Should Be Open
    Location Should Be    ${DASHBORD PAGE}
    Element Should Contain    welcome_title    ${WELCOME TITLE}
    Element Should Contain    welcome_user    ${WELCOME ADMIN}

Dashboard Student Should Be Open
    Location Should Be    ${DASHBORD PAGE}
    Element Should Contain    welcome_title    ${WELCOME TITLE}
    Element Should Contain    welcome_user    ${WELCOME STUDENT}

Dashboard Teacher Should Be Open
    Location Should Be    ${DASHBORD PAGE}
    Element Should Contain    welcome_title    ${WELCOME TITLE}
    Element Should Contain    welcome_user    ${WELCOME TEACHER}

Dashboard Header Project Should Be Open
    Location Should Be    ${DASHBORD PAGE}
    Element Should Contain    welcome_title    ${WELCOME TITLE}
    Element Should Contain    welcome_user    ${WELCOME HEADER}

Dashboard Staff Should Be Open
    Location Should Be    ${DASHBORD PAGE}
    Element Should Contain    welcome_title    ${WELCOME TITLE}
    Element Should Contain    welcome_user    ${WELCOME STAFF}


Login Page Still Open
    Location Should Be    ${LOGIN PAGE}