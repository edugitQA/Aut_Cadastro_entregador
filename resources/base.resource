*** Settings ***
Documentation    Arquivo principal do projeto

Library     Browser
Resource    actions/register.resource


*** Keywords ***
Start Session
    New Browser    browser=chromium    headless=False
    New Page       https://buger-eats.vercel.app/

    Wait For Elements State    css=h1>> text=eja um parceiro entregador pela Buger Eats
    ...        visible    5

finish session
    Take Screenshot     fullPage=True
