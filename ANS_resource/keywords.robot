*** Settings ***
Documentation       Use for common keywords
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../resource/variable.robot
Variables           element.yml


*** Keywords ***
Open Website
    [Documentation]         Use for set up open browser
    [Arguments]             ${link}                          ${BROWSER}=chrome
    Open Browser            ${URL}                           ${BROWSER}
    Set Selenium Speed      1 seconds

Close Browser After Finish
    [Documentation]         Use close browser
    Close Browser

Verify URL Success
    [Documentation]                             Verify Enter the website correctly
    Wait Until Page Contains Element            xpath=${todolist_page.main_text.locator}
    Element Should Be Visible                   xpath=${todolist_page.main_text.locator}
    ${current_url}=         Get Location
    Should Be Equal         ${current_url}      ${URL}

Verify Detail page
    [Documentation]                             Verify detail of the page
    Wait Until Page Contains Element            xpath=${todolist_page.main_text.locator}
    Element Should Be Visible                   xpath=${todolist_page.main_text.locator}        To Do List
    ${add_item}             Get Text            xpath=${todolist_page.tab_1.locator}
    Should Be Equal         ${add_item}         ADD ITEM
    ${todo_tasks}           Get Text            xpath=${todolist_page.tab_2.locator}
    Should Be Equal         ${todo_tasks}       TO-DO TASKS
    ${complete}             Get Text            xpath=${todolist_page.tab_3.locator}
    Should Be Equal         ${complete}         COMPLETED

Verify To Add Item
    [Documentation]                             Verify input data success on Add Item tab
    Wait Until Page Contains Element            xpath=${todolist_page.main_text.locator}
    Element Should Be Visible                   xpath=${todolist_page.main_text.locator}            To Do List
    Input Text                                  xpath=${todolist_page.tab_1.textbox.locator}        text=${str1}   
    Click Element                               xpath=${todolist_page.tab_1.add_btn.locator}

Verify Add success
    [Documentation]                             Verify add success and update on to-do tasks tab
    Click Element                               xpath=${todolist_page.tab_2.locator}
    Element Should Be Visible                   xpath=${todolist_page.tab_2.checkbox.locator}
    ${text_1}               Get Text            xpath=${todolist_page.tab_2.text_1.locator}
    Should Be Equal         ${text_1}           ${str1}         
    Element Should Be Visible                   xpath=${todolist_page.tab_2.del_btn.locator}
