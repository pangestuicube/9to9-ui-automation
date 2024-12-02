*** Settings ***
Library         SeleniumLibrary
Library         string
Variables       ../resources/locator/checkout_locator.py
Variables       ../resources/data/testdata.py
Resource        ../base/base.robot


*** Keywords ***
Add User Email If Empty
    [Arguments]    ${CheckoutEmail}
    ${EmailAddressIsEmpty}    Run Keyword And Return Status
    ...    Wait Until Element Is Enabled
    ...    locator=${checkoutEmailInput}
    ...    timeout=${timeOutShort}
    IF    ${EmailAddressIsEmpty}
        Click Element    ${checkoutEmailInput}
        Input Text    ${checkoutEmailInput}    ${CheckoutEmail}
    END
    Click Element    locator=${checkoutPage}

Manage Shipping Address
    Wait Until Element Is Not Visible
    ...    locator=${pageSkaleton}
    ...    timeout=${timeOutLong}
    ${addressNotEmpty}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${ShippingGroupIndex}
    ...    timeout=${timeOutShort}
    IF    ${addressNotEmpty}
        Wait Until Element Is Enabled    locator=${ShippingGroupIndex}
        Click Element    locator=${ShippingGroupIndex}
        Wait Until Element Is Enabled
        ...    locator=${shippingMethodInput}
        ...    timeout=${timeOutMedium}
        Click Element    locator=${shippingMethodInput}
    ELSE
        Input Form Address
        Click Save Address
        ${CloseAddressIsvisible}    Run Keyword And Return Status
        ...    Wait Until Element Is Visible
        ...    locator=${closeAddressList}
        ...    timeout=${timeOutLong}
        IF    ${CloseAddressIsvisible}
            Wait Until Element Is Enabled
            ...    locator=${closeAddressList}
            ...    timeout=${timeOutLong}
            Click Element    locator=${closeAddressList}
        END
        Select Shipping Method
    END

Input Form Address
    Wait Until Element Is Not Visible
    ...    locator=${pageSkaleton}
    ...    timeout=${timeOutLong}
    Wait Until Element Is Enabled    locator=${checkoutAddAddress}    timeout=${timeOutLong}
    Click Element    locator=${checkoutAddAddress}

    ${addressFromNotVisible}    Run Keyword And Return Status
    ...    Wait Until Element Is Visible
    ...    locator=${checkoutAddNewAddress}
    ...    timeout=${timeOutShort}
    IF    ${addressFromNotVisible}
        Wait Until Element Is Enabled    locator=${checkoutAddNewAddress}
        Click Element    locator=${checkoutAddNewAddress}
    END

    Wait Until Element Is Enabled    locator=${addressFistNameInput}    timeout=${timeOutMedium}
    Input text    locator=${addressFistNameInput}    text=${FirstName}
    Input text    locator=${addressLastNameInput}    text=${LastName}
    Input text    locator=${addressPhoneNumberInput}    text=${PhoneNumber}
    Input text    locator=${addressRegionInput}    text=${Region}
    Sleep    1
    Press Keys    ${addressRegionInput}    ARROW_DOWN
    Press Keys    ${addressRegionInput}    ENTER

    Wait Until Element Is Enabled    locator=${addressCityInput}    timeout=${timeOutMedium}
    Input text    locator=${addressCityInput}    text=${city}
    Sleep    1
    Press Keys    ${addressCityInput}    ARROW_DOWN
    Press Keys    ${addressCityInput}    ENTER

    Wait Until Element Is Enabled    locator=${addressDistricktInput}    timeout=${timeOutMedium}
    Input text    locator=${addressDistricktInput}    text=${district}
    Sleep    1
    Press Keys    ${addressDistricktInput}    ARROW_DOWN
    Press Keys    ${addressDistricktInput}    ENTER

    Wait Until Element Is Enabled    locator=${addressDetailInput}    timeout=${timeOutMedium}
    Input text    locator=${addressDetailInput}    text=${detailAddress}
    Sleep    1
    Press Keys    ${addressDetailInput}    ARROW_DOWN
    Press Keys    ${addressDetailInput}    ENTER

    Select Checkbox    locator=${addressDefaultCheckbox}
    Select checkbox    locator=${addressPinpoinCheckbox}

Click Save Address
    Scroll Element Into View    locator=${addressSubmitButton}
    Wait Until Element Is Enabled    locator=${addressSubmitButton}    timeout=${timeOutShort}
    Click Element    locator=${addressSubmitButton}
    Wait Until Element Is Not Visible    locator=${addressSubmitButton}    timeout=${timeOutMedium}

Select Shipping Method
    Wait Until Element Is Enabled    locator=${ShippingGroupIndex}    timeout=${timeOutMedium}
    ${shippingMethodInputIsVisible}    Run Keyword And Return Status
    ...    Wait Until Element Is visible
    ...    locator=${shippingMethodInput}
    ...    timeout=${timeOutLong}
    IF    not ${shippingMethodInputIsVisible}
        Wait Until Element Is Enabled    locator=${ShippingGroupIndex}    timeout=${timeOutMedium}
        Click Element    locator=${ShippingGroupIndex}
    END
    Wait Until Element Is Enabled    locator=${shippingMethodInput}    timeout=${timeOutLong}
    Click Element    locator=${shippingMethodInput}

Selec Payment Method
    Wait Until Element Is Not Visible
    ...    locator=${pageSkaleton}
    ...    timeout=${timeOutMedium}
    Wait Until Element Is Enabled    locator=${paymentMethodInput}    timeout=${timeOutMedium}
    Click Element    locator=${paymentMethodInput}

Click Create Order
    Scroll Element Into View    locator=${checkoutButton}
    Wait Until Element Is Enabled    locator=${checkoutButton}    timeout=${timeOutLong}
    Click Element    locator=${checkoutButton}

Midtrans Virtual Account Transaction
    Wait Until Element Is Visible    locator=${MidtransFrame}    timeout=60
    Select Frame    ${MidtransFrame}
    Wait Until Page Contains Element    ${MidtransPopup}    10
    Wait Until Page Contains Element    ${MidtransVANumberField}
    Click Element    ${CloseMitransPopup}
    Unselect Frame

Thankyou Page Validation
    Wait Until Keyword Succeeds    15    1    Check Order Number Is visible

Check Order Number Is visible
    ${pass}    Run Keyword And Return Status    Element Should Be Visible    ${GuestOrderNumber}    timeout=1
    ${pass}    Run Keyword And Return Status    Element Should Be Visible    ${CustomerOrderNumber}    timeout=1
    IF    ${pass}    Pass Execution    message=pass
