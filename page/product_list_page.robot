*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/data/testdata.py
Resource        ../page/home_page.robot


*** Keywords ***
Go To PDP Product By Index
    [Arguments]    ${index}
    Wait Until Element Is Visible    locator=${ProductItemCardName.format(${index})}    timeout=${timeOutLong}
    Click Element    ${ProductItemCardName.format(${index})}

Validate Search Product And Go To PDP
    [Arguments]    ${keyword}
    Search Product result Validation    ${keyword}
    Go To PDP Product By Index    index=1
