*** Settings ***
Documentation       Use for verify and execute for To Do List page
Resource            ../resource/keywords.robot
Resource            ../resource/variable.robot
Test Teardown       Close All Browsers

*** Test Cases ***
01 Enter The Website
    [Documentation]                     User can enter the website for To Do List
    Open Website                        ${BROWSER}=chrome
    Verify URL Success   
    Log to console      ${URL}               

02 Verify UI Of The Page
    [Documentation]                     User can see the UI of the page display correctly
    Open Website                        ${BROWSER}=chrome
    Verify Detail page  

03 Add Item Success
    [Documentation]                     User can add item successful
    Open Website                        ${BROWSER}=chrome
    Verify URL Success  
    Verify To Add Item
    Verify Add success

04 Case Add Item Then Click Checkbox 
    [Documentation]                     User can add iten and display correctly case : click checkbox
    Open Website                        ${BROWSER}=chrome
    Verify URL Success  
    Verify To Add Item                  
    Verify Add success
    Click Element                       xpath=${todolist_page.tab_2.checkbox.locator}
    Click Element                       xpath=${todolist_page.tab_3.locator}
    Element Should Be Visible           xpath=${todolist_page.tab_3.done.locator}
    Element Should Be Visible           xpath=${todolist_page.tab_3.del_btn.locator}       
    Click Element                       xpath=${todolist_page.tab_3.del_btn.locator}

05 Case Add Item Then Click Delete Button 
    [Documentation]                     User can add iten and display correctly case : click delete button
    Open Website                        ${BROWSER}=chrome
    Verify URL Success  
    Verify To Add Item                  
    Verify Add success
    Click Element                       xpath=${todolist_page.tab_2.del_btn.locator}





