*** Settings ***
Resource    ../main.robot

*** Variables ***

&{GUIElements}
...    input_name=//input[@id="name"]
...    input_email=//input[@id="email"]
...    input_phone=//input[@id="phone"]
...    textarea_address=//textarea[@id="textarea"]

...    input_genderMale=//input[@id="male"]
...    input_genderFemale=//input[@id="female"]

...    input_sunday=//input[@id="sunday"]
...    input_monday=//input[@id="monday"]
...    input_tuesday=//input[@id="tuesday"]
...    input_wednesday=//input[@id="wednesday"]
...    input_thursday=//input[@id="thursday"]
...    input_friday=//input[@id="friday"]
...    input_saturday=//input[@id="saturday"]

...    select_country=//select[@id="country"]
...    select_colors=//select[@id="colors"]
...    select_animalSortedList=//select[@id="animals"]

...    input_datePicker1=//input[@id="datepicker"]

...    input_datePicker2=//input[@id="txtDate"]
...    select_datePicker2Month=//select[@class="ui-datepicker-month"]
...    select_datePicker2Year=//select[@class="ui-datepicker-year"]


*** Keywords ***

e preencho o nome
    Input Text    ${GUIElements.input_name}    ${formData.name}

e preencho o email
    Input Text    ${GUIElements.input_email}    ${formData.email}

e preencho o telefone
    Input Text    ${GUIElements.input_phone}    ${formData.phone}

e preencho o endereço    
    Input Text    ${GUIElements.textarea_address}    ${formData.address}


e seleciono genero masculino
    Click Element    ${GUIElements.input_genderMale}

e seleciono genero feminino
    Click Element    ${GUIElements.input_genderFemale}


e seleciono domingo
    Click Element    ${GUIElements.input_sunday}

e seleciono segunda-feira
    Click Element    ${GUIElements.input_monday}

e seleciono terça-feira
    Click Element    ${GUIElements.input_tuesday}

e seleciono quarta-feira
    Click Element    ${GUIElements.input_wednesday}

e seleciono quinta-feira
    Click Element    ${GUIElements.input_thursday}

e seleciono sexta-feira
    Click Element    ${GUIElements.input_friday}

e seleciono sábado
    Click Element    ${GUIElements.input_saturday}


e seleciono o seguinte pais
    [Arguments]    ${country}

    Select From List By Value    ${GUIElements.select_country}    ${country}


e seleciono as seguintes cores
    [Arguments]    @{colors}
    Unselect All From List    ${GUIElements.select_colors}
    FOR    ${color}    IN    @{colors}
        Select From List By Value    ${GUIElements.select_colors}    ${color}
    END


e verifico se a lista de animais está ordenada
    ${items}=    Get List Items    ${GUIElements.select_animalSortedList}
    ${expectedList}=    Copy List    ${items}
    Sort List    ${expectedList}
    Lists Should Be Equal    ${items}    ${expectedList}

e seleciono os seguintes animais
    [Arguments]    @{animals}

    FOR    ${animal}    IN    @{animals}
        Select From List By Value    ${GUIElements.select_animalSortedList}    ${animal}
    END


e preencho o Date Picker 1 (mm/dd/yyyy)
    [Arguments]    ${dmy}
    Click Element    ${GUIElements.input_datePicker1}
    Input Text    ${GUIElements.input_datePicker1}    ${dmy}
    Press Keys    ${GUIElements.input_datePicker1}    TAB
    
e preencho o Date Picker 2 (dd/mm/yyyy)
    [Arguments]    @{dmy}
    Click Element    ${GUIElements.input_datePicker2}
    Select From List By Value    ${GUIElements.select_datePicker2Month}    ${dmy}[1]
    Select From List By Value    ${GUIElements.select_datePicker2Year}    ${dmy}[2]
    Click Element    //a[contains(text(), '${dmy}[0]')]