*** Settings ***
Documentation       Use for update keywords of buy_page
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../variable.robot
Variables           element.yml

*** Keywords ***
Open Website
    [Documentation]       Use for set up open browser
    [Arguments]         ${link}                          ${BROWSER}=chrome
    Open Browser        ${URL}                           ${BROWSER}
    Set Selenium Speed  1 seconds
    
Close Browser After Finish
    [Documentation]       Use close browser
    Close Browser

Verify Summary page 
    [Arguments]                         ${locator}
    Wait Until Page Contains Element    ${locator}

Click Auction menu
    [Arguments]                         ${locator}
    Click Button	                    ${locator}

Verify Auction page 
    [Arguments]                         ${locator}
    Wait Until Page Contains Element    xpath=//*[@id="testid-btn-auction-sidebar"]
    Element Should Be Visible           xpath=${login_page.placebid_btn.locator}

Login
    [Documentation]     Use for login success
    Input Text          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=//*[@id="testid-btn-auction-sidebar"]   
    Click Element                       xpath=//*[@id="testid-svg-auction-sidebar"]
    Verify Auction page                 xpath=${login_page.auction_title.locator}

Input Onpeak
    [Documentation]     Use for input onpeak value
    Click Element                       xpath=//*[@id="testid-input-onpeak"]
    Input Text                          xpath=//*[@id="testid-input-onpeak"]    2.53
    Click Button                        xpath=${auction_page.placebid_btn.locator}
    Wait Until Page Contains Element        xpath=//*[@class="ant-modal-content"]
    Element Should Be Visible               xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/button
    Click Button                            xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/button
    ${latest_bid}       Get Text            xpath=//*[@id="testid-value-price"]
    Log to console      ${latest_bid}
    Click Button                            xpath=//*[@id="testid-link-lastBid"]
    ${his_value}         Get Text           xpath=//*[@id="testid-value-onPeakPrice"]/span
    Log to console      ${his_value}
    Should Be Equal     ${his_value}        ${latest_bid}
    ${user_name}        Get Text            xpath=//*[@class="bidding_history"]
    Log to console      ${user_name}

Input Offpeak


Verify Valid Onpeak
    [Documentation]                         Bidding Success
