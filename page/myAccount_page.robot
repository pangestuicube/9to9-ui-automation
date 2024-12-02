*** Settings ***
Library         SeleniumLibrary
Variables       ../resources/data/testdata.py


*** Keywords ***
Go to My Acccount Page
    Go To    url=${URLAccount}
