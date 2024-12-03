checkoutPage    = "//body[contains(@class,'isCheckoutPage')]"
checkoutEmailInput  = "//input[@name='email']"
checkoutAddAddress = "//div[@id='checkoutAddress']//button[@tdata='add-address-button']"
checkoutAddNewAddress = "//div[@id='checkoutListAddress']//div//div//div//button"
ShippingGroupIndex  = "//div[@tdata='shipinggroup-index']"
shippingMethodInput = "//div[@tdata='shipinggroup-index']//input[@type='radio']"
paymentMethodInput = "//div[@id='checkoutPayment']//input[@name='radio']"
checkoutButton  = "//button[@tdata='checkout-button']"

# AddressForm
addressFistNameInput   = "//div[@id='formAddressInputContainer']//input[@id='addressForm-firtsName-textField']"
addressLastNameInput   = "//div[@id='formAddressInputContainer']//input[@id='addressForm-lastName-textField']"
addressPhoneNumberInput = "//input[@id='addressForm-phoneNumber-textField']"
addressCountryInput = "//input[@id='country']"
addressRegionInput ="//input[@id='controlled-region']"
addressCityInput    ="//input[@id='controlled-city']"
addressDistricktInput   ="//input[@id='controlled-district']"
addressDetailInput  ="//input[@id='addressForm-addressDetail-textField']"
addressPinpoinCheckbox  ="//input[@id='addressForm-confirmPinPoint-checkbox']"
addressDefaultCheckbox = "//input[@id='addressForm-addressDefault-checkbox']"
addressSubmitButton ="//div[@id='formAddressInputContainer']//button[@type='submit']"
closeAddressList	= "//div[@id='checkoutListAddress']//button[@tdata='button-back']" #https://prnt.sc/vIXry0dUS8TF

# Thankyoupage
GuestOrderNumber = "//b[@tdata='orderNumberLabel']"
CustomerOrderNumber = "//a[@tdata='orderNumberLabel']/b"

# Mitrans
MidtransFrame                           = 'snap-midtrans'
MidtransPopup                           = 'id:application'
CloseMitransPopup                       = "//div[@class='close-snap-button clickable']"
MidtransVANumberField                   = 'id:vaField'

