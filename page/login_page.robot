*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/locator/login_locator.py
Variables       ../resources/locator/base_locator.py
Variables       ../resources/data/testdata.py


*** Keywords ***
To Login Page
    Wait Until Element Is Enabled    locator=${customerName}    timeout=${timeOutMedium}
    Click Element    locator=${customerName}
    Wait Until Element Is Enabled    locator=${loginButton}    timeout=${timeOutMedium}
    Click Element    locator=${loginButton}
    Wait Until Element Is Visible    locator=${submitLoginFormButton}    timeout=${timeOutMedium}

Input Login Form
    [Arguments]    ${userEmail}    ${userPassword}
    Wait Until Element Is Enabled    locator=${emailInput}    timeout=${timeOutShort}
    Input Text    locator=${emailInput}    text=${userEmail}
    Wait Until Element Is Enabled    locator=${passwordInput}    timeout=${timeOutShort}
    Input Text    locator=${passwordInput}    text=${userPassword}

Submit Login Form
    Wait Until Element Is Enabled    locator=${submitLoginFormButton}    timeout=${timeOutShort}
    Click Element    locator=${submitLoginFormButton}

Login Validation
    Wait Until Element Is Visible    ${dashboardPage}    timeout=${timeOutLong}
    Wait Until Element Is Enabled    locator=${customerName}
    ${txtCustomerName}    Get Text    locator=${customerName}
    ${customerNameLower}    Evaluate    '${txtCustomerName}'.lower()
    ${usernameLower}    Evaluate    '${username}'.lower()
    Should Contain    ${customerNameLower}    ${usernameLower}

Customer Login
    [Arguments]    ${userEmail}    ${userPassword}
    To Login Page
    Input Login Form    ${userEmail}    ${userPassword}
    Submit Login Form
    Login Validation
