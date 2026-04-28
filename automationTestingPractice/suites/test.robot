*** Settings ***
Resource    ../resources/main.robot
Suite Setup    Set Selenium Speed    0.1s

Test Setup    dado que eu acesso o site
Test Teardown    e fecho o browser

*** Test Cases ***

TC01 - Preencher formulário GUI Elements

    e preencho o nome
    e preencho o email
    e preencho o telefone
    e preencho o endereço

    e seleciono genero masculino
    e seleciono genero feminino

    e seleciono domingo
    e seleciono segunda-feira
    e seleciono terça-feira
    e seleciono quarta-feira
    e seleciono quinta-feira
    e seleciono sexta-feira
    e seleciono sábado

    e seleciono o seguinte pais   brazil

    e seleciono as seguintes cores    white    green    yellow

    e verifico se a lista de animais está ordenada
    e seleciono os seguintes animais    cat    fox    lion    dog    deer

    e preencho o Date Picker 1 (mm/dd/yyyy)    04/31/2018
    e preencho o Date Picker 2 (dd/mm/yyyy)    28    7    2017

*** Comments ***

Available Colors:

red
blue
green
yellow
white

Available Animals:

cat
cheetah
deer
dog
elephant
fox
giraffe
lion
rabbit
zebra