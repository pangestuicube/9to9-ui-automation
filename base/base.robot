*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/data/testdata.py
Variables       ../resources/locator/base_locator.py


*** Keywords ***
Close Banner If Visible
    ${isVisible}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${CloseBannerButton}
    ...    timeout=${timeOutMedium}
    IF    ${isVisible}
        Wait Until Element Is Enabled    locator=${CloseBannerButton}    timeout=${timeOutLong}
        Click Element    locator=${CloseBannerButton}
    END

Alert Success Validation
    Wait Until Element Is Visible    locator=${MessageSuccessAlert}    timeout=${timeOutLong}

Clean Currency Value
    [Arguments]    ${value}
    ${cleanedValue}    Evaluate    '${value}'.replace("IDR", "").replace(",", "").strip()
    ${cleanedValue}    Convert To Number    ${cleanedValue}
    RETURN    ${cleanedValue}
