*** Settings ***
Documentation       Suite description

Library             ScreenCapLibrary
Resource            ../base/setup.robot
Resource            ../page/login_page.robot
Resource            ../page/home_page.robot
Resource            ../page/product_list_page.robot
Resource            ../page/product_detail_page.robot
Resource            ../page/cart_page.robot
Resource            ../page/checkout_page.robot

Suite Teardown      Close All Browsers
Test Setup          Start Test Case
Test Teardown       End Test Case


*** Test Cases ***
TCCO1.Successful Checkout for Guest User Test with simple product
    home_page.Search Product by Keyword in Searchbox    keyword=${ProductSimpleNameForSearch}
    product_list_page.Validate Search Product And Go To PDP    keyword=${ProductSimpleNameForSearch}
    @{productName}    product_detail_page.Add To Cart
    base.Alert Success Validation
    cart_page.Go To Shopping Cart
    @{cartProductNameValue}    cart_page.Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{cartProductNameValue}
    cart_page.Validate The Similarity Of Item Added To Cart    &{Arguments}
    cart_page.Select All Item In Cart
    cart_page.Click Checkout button
    checkout_page.Add User Email If Empty    CheckoutEmail=${emailAddress}
    checkout_page.Manage Shipping Address
    checkout_page.Selec Payment Method
    checkout_page.Click Create Order
    checkout_page.Midtrans Virtual Account Transaction
    checkout_page.Thankyou Page Validation

TCCO2.Successful Checkout for Guest User Test with Configurable product
    login_page.Customer Login    userEmail=${email}    userPassword=${password}
    home_page.Search Product by Keyword in Searchbox    keyword=${ProductSimpleNameForSearch}
    product_list_page.Validate Search Product And Go To PDP    keyword=${ProductSimpleNameForSearch}
    @{productName}    product_detail_page.Add To Cart
    base.Alert Success Validation
    cart_page.Go To Shopping Cart
    @{cartProductNameValue}    cart_page.Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{cartProductNameValue}
    cart_page.Validate The Similarity Of Item Added To Cart    &{Arguments}
    cart_page.Select All Item In Cart
    cart_page.Click Checkout button
    checkout_page.Add User Email If Empty    CheckoutEmail=${emailAddress}
    checkout_page.Manage Shipping Address
    checkout_page.Selec Payment Method
    checkout_page.Click Create Order
    checkout_page.Midtrans Virtual Account Transaction
    checkout_page.Thankyou Page Validation

TCCO3.Successful Checkout for Customer Test with simple product
    home_page.Search Product by Keyword in Searchbox    keyword=${ProductConfigurableNameForSearch}
    product_list_page.Validate Search Product And Go To PDP    keyword=${ProductConfigurableNameForSearch}
    @{productName}    product_detail_page.Add To Cart
    base.Alert Success Validation
    cart_page.Go To Shopping Cart
    @{cartProductNameValue}    cart_page.Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{cartProductNameValue}
    cart_page.Validate The Similarity Of Item Added To Cart    &{Arguments}
    cart_page.Select All Item In Cart
    cart_page.Click Checkout button
    checkout_page.Add User Email If Empty    CheckoutEmail=${emailAddress}
    checkout_page.Manage Shipping Address
    checkout_page.Selec Payment Method
    checkout_page.Click Create Order
    checkout_page.Midtrans Virtual Account Transaction
    checkout_page.Thankyou Page Validation

TCCO4.Successful Checkout for Customer Test with Configurable product
    login_page.Customer Login    userEmail=${email}    userPassword=${password}
    home_page.Search Product by Keyword in Searchbox    keyword=${ProductConfigurableNameForSearch}
    product_list_page.Validate Search Product And Go To PDP    keyword=${ProductConfigurableNameForSearch}
    @{productName}    product_detail_page.Add To Cart
    base.Alert Success Validation
    cart_page.Go To Shopping Cart
    @{cartProductNameValue}    cart_page.Get Product Name From Minicart
    &{Arguments}    Create Dictionary
    ...    productName=@{productName}
    ...    MinicartProductNameValue=@{cartProductNameValue}
    cart_page.Validate The Similarity Of Item Added To Cart    &{Arguments}
    cart_page.Select All Item In Cart
    cart_page.Click Checkout button
    checkout_page.Add User Email If Empty    CheckoutEmail=${emailAddress}
    checkout_page.Manage Shipping Address
    checkout_page.Selec Payment Method
    checkout_page.Click Create Order
    checkout_page.Midtrans Virtual Account Transaction
    checkout_page.Thankyou Page Validation
