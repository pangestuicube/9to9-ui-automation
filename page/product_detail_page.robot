*** Settings ***
Library         SeleniumLibrary
Library         Collections
Variables       ../resources/data/testdata.py
Variables       ../resources/locator/product_detail_locator.py


*** Keywords ***
Get Product Name From PDP
    Wait Until Element Is Visible    locator=${productNameLabel}    timeout=${timeOutMedium}
    ${PDPProductNameValue} =    Get Text    ${productNameLabel}
    RETURN    ${PDPProductNameValue}

Select Configurable Product Option
    ${totalVarian} =    Get Element Count    ${ConfigurableOptionIndex}
    FOR    ${Varian}    IN RANGE    1    ${totalVarian+1}
        Click Element    ${ProductConfigurableOptionItem.format(${Varian})}
    END

Add To Cart
    ${PDPProductNameValue} =    Get Product Name From PDP
    ${ProductNameList} =    Create List
    Append To List    ${ProductNameList}    ${PDPProductNameValue}
    ${IsConfigurableProduct} =    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${ConfigurableOptionIndex}
    ...    timeout=${timeOutMedium}
    IF    ${IsConfigurableProduct}    Select Configurable Product Option
    Wait Until Element Is Enabled    locator=${AddToCartButton}    timeout=${timeOutShort}
    Click Element    ${AddToCartButton}
    RETURN    ${ProductNameList}
