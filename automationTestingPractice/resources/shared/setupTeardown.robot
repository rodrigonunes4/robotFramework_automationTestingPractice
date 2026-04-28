*** Settings ***
Resource    ../main.robot

*** Keywords ***

dado que eu acesso o site
    Open Browser    ${general.URL}    ${general.BROWSER}

e fecho o browser
    Close Browser