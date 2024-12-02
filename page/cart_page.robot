*** Settings ***
Library         SeleniumLibrary
Library         string
Library         Collections
Variables       ../resources/locator/base_locator.py
Variables       ../resources/data/testdata.py
Variables       ../resources/locator/cart_locator.py
Variables    ../resources/locator/checkout_locator.py
Resource        ../base/base.robot


*** Keywords ***
Go To Shopping Cart
    Wait Until Element Is Enabled    locator=${viewCartButton}    timeout=${timeOutMedium}
    Click Element    locator=${viewCartButton}
    Wait Until Element Is Visible    locator=${cartCheckoutButton}    timeout=${timeOutLong}

Get Product Name From Minicart
    Wait Until Element Is Visible    locator=${cartProductList}    timeout=${timeOutLong}
    ${totalItem}=    Get Element Count    locator=${cartProductList}
    ${CartItemList}=    Create List
    FOR    ${Item}    IN RANGE    1    ${totalItem+1}
        ${cartItemName}=    Get Text    ${produuctNameLabelByIndex.format(${Item})}
        Append To List    ${CartItemList}    ${cartItemName}
    END
    RETURN    ${CartItemList}

Validate The Similarity Of Item Added To Cart
    [Arguments]    &{Argument}
    ${Argument1}=    Set Variable    ${Argument['productName']}
    ${Argument2}=    Set Variable    ${Argument['MinicartProductNameValue']}
    Log    productName----: ${Argument1}
    Log    MinicartProductNameValue---: ${Argument2}
    ${TotalItem}=    Get Length    ${Argument2}
    IF    ${TotalItem} > 1
        Sort List    ${Argument1}
        Sort List    ${Argument2}
    END
    FOR    ${index}    IN RANGE    0    ${TotalItem}
        ${element1}=    Get From List    ${Argument1}    ${index}
        ${element2}=    Get From List    ${Argument2}    ${index}
        ${ValidateResult}=    Run Keyword And Return Status    Should Contain    ${element2}    ${element1}
        IF    '${ValidateResult}'=='False'
            Run Keyword And Continue On Failure    Error Item Added To Cart Not Match
        END
    END

Error Item Added To Cart Not Match
    Fail
    ...    Data Nama Product yang ditambahkan ke kerangjang, tidak sesuai dengan data product dikeranjang

Select All Item In Cart
    ${totalBeforeRaw}=    Get Text    locator=${productPriceTotalLabel}
    ${totalBefore}=    base.Clean Currency Value    value=${totalBeforeRaw}
    Wait Until Element Is Enabled    locator=${checkAllItemCheckbox}    timeout=${timeOutShort}
    Click Element    locator=${checkAllItemCheckbox}
    ${totalAfterRaw}=    Get Text    locator=${productPriceTotalLabel}
    ${totalAfter}=    base.Clean Currency Value    value=${totalAfterRaw}
    Should Be True
    ...    ${totalAfter} > ${totalBefore}
    ...    Total After (${totalAfter}) is not greater than Total Before (${totalBefore})

Click Checkout button
    Wait Until Element Is Enabled    locator=${cartCheckoutButton}    timeout=${timeOutMedium}
    Click Element    locator=${cartCheckoutButton}
    Wait Until Element Is Visible    locator=${checkoutPage}    timeout=${timeOutLong}
    Wait Until Element Is Not Visible
    ...    locator=${pageSkaleton}
    ...    timeout=${timeOutLong}
