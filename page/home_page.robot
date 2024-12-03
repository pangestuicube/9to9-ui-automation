*** Settings ***
Library         SeleniumLibrary
Library         string
Variables       ../resources/locator/base_locator.py
Variables       ../resources/data/testdata.py
Variables       ../resources/locator/product_list_locator.py


*** Keywords ***
Search Product by Keyword in Searchbox
    [Arguments]    ${keyword}
    Click Element    locator=${Searchinput}
    Input Text    locator=${Searchinput}    text=${keyword}
    Press Keys    None    ENTER

Search Product Not Match
    [Arguments]    ${Keyword}    ${Result}
    Fail    Data Nama Product '${Result}' tidak sesuai dengan katakunci : ${Keyword}

Search Product result Validation
    [Arguments]    ${keyword}
    ${ShowProduct}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${ProductItemCardName.format(1)}
    ...    timeout=${timeOutShort}
    ${keyword}    Evaluate    '${keyword}'.lower()
    IF    ${ShowProduct}
        ${txtProductresult}    Get Text    ${ProductItemCardName.format(1)}
        ${txtProductresult}    Evaluate    '${txtProductresult}'.lower()
        ${validasiProduct_name}    Run Keyword And Return Status
        ...    Should Contain
        ...    ${txtProductresult}
        ...    ${keyword}
        IF    '${validasiProduct_name}'=='False'
            Run Keyword And Continue On Failure    Search Product Not Match    ${keyword}    ${txtProductresult}
        END
    END

Go To Homepage
    Go To    url=${URLWEB}
    Wait Until Element Is Not Visible    locator=${pageSkaleton}    timeout=${timeOutLong}