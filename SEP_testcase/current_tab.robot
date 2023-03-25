*** Settings ***
Documentation       Use for verify ui of auction page
Resource            ../resource/auction_page/keywords.robot
Test Teardown       Close All Browsers

*** Test Cases ***
01 User must sign in
    [Documentation]                     Login for see UI of Buy page
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}

02 Login success
    [Documentation]                     Redirect to Summary page
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}     
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Verify Summary page                 xpath=${Summary_buy.period_dropdown.locator}

03 Verify auction menu
    [Documentation]                     User Can click auction menu
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=${auction_page.auction_menu.locator}   
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}

04 Verify dropdown   
    [Documentation]                     Verify dropdown and component  
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=${auction_page.auction_menu.locator}   
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    ${group_title}      Get Text       xpath=${auction_page.group_title.locator}
    Should Be Equal     ${group_title}  Group 
    ${group_name}       Get Text        xpath=${auction_page.group_name.locator}
    Click Element                       xpath=${auction_page.group_dropdown.locator} 
    ${group_list}       Get Text        xpath=${auction_page.group_list.locator} 
    Log to console      ${group_list}
    Click Element                       xpath=${auction_page.group_list.locator}
    Should Be Equal     ${group_name}   ${group_list} 
    Click Button                        xpath=${auction_page.meter_list.locator}
    ${meter_list}       Get Text        xpath=${auction_page.meter_list.locator}
    Log to console      ${meter_list}
    ${meter_name}       Get Text        xpath=${auction_page.meter_name.locator}
    Log to console      ${meter_name}
    Should Be Equal     ${meter_list}   ${meter_name}
    Element Should Be Visible           xpath=${auction_page.renewable.locator}             Renewable Energy Market Prices
    Element Should Be Visible           xpath=${auction_page.countdown.locator}             Days
    Element Should Be Visible           xpath=${auction_page.buy.highest_on.locator}        Highest On Peak Price
    Element Should Be Visible           xpath=${auction_page.buy.highest_off.locator}       Highest Off Peak Price

05 Verify default contract type
    [Documentation]                     Verify default contract type of Buy side
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=${auction_page.auction_menu.locator} 
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    ${buy_contract}     Get Text        xpath=${auction_page.contract_type.locator}
    Should Be Equal     ${buy_contract}         Buy

06 Verify onpeak tab of buy side
    [Documentation]                     Verify onpeak tab display is correct 
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=${auction_page.auction_menu.locator} 
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    Element Should Be Visible           xpath=${auction_page.remark.locator}        Grid TOU Price : On Peak = 
    ${onpeak_price}     Get Text        xpath=${auction_page.onpeak_price.locator}
    Should Be Equal     ${onpeak_price}         On Peak Price (Baht/kWh)
    ${onpeak_atleast}   Get Text        xpath=${auction_page.onpeak.locator}
    Should Be Equal     ${onpeak_atleast}       Price must be at least 2.52 Baht/kWh
    
07 Verify offpeak tab of buy side
    [Documentation]                     Verify offpeak tab display is correct  
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=${auction_page.auction_menu.locator} 
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    Click Element                       xpath=${auction_page.offpeak.offpeak_tab.locator}
    ${offpeak}              Get Text            xpath=${auction_page.offpeak.offpeak_tab.locator}
    Should Be Equal         ${offpeak}               Off Peak
    ${offpeak_price}        Get Text            xpath=${auction_page.offpeak.offpeak_price.locator}
    Should Be Equal         ${offpeak_price}         Off Peak Price (Baht/kWh)
    ${offpeak_atleast}      Get Text            xpath=${auction_page.offpeak.offpeak_atleast.locator}
    Should Be Equal         ${offpeak_atleast}       Price must be at least 1.57 Baht/kWh