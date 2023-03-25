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

# [Buy on bid]
# ฺฺBuyer_bidding_onpeak
#     [Documentation]     Use for input bidding order for Onpeak and Offpeak
#     [Arguments]         ${on}     ${case0}
#     Open Website        ${URL}
#     Input Text          xpath=${login_page.email_textbox.locator}   text=${str1}
#     Input Text          xpath=${login_page.pass_textbox.locator}    text=${str2}
#     Click Button        xpath=${login_page.signin_btn.locator}
#     Wait Until Page Contains Element    xpath=//*[@id="testid-btn-auction-sidebar"]   
#     Click Element                       xpath=//*[@id="testid-svg-auction-sidebar"]
#     Verify Auction page                 xpath=${login_page.auction_title.locator}
#     Click Button                        xpath=//*[@id="testid-input-onpeak"]
#     Input Text                          xpath=//*[@id="testid-input-onpeak"]      text=${on}
#     Click Button                        xpath=//*[@id="testid-button-auction"]
#     IF      "${case0}" == "passed_1"
#         Verify Valid Onpeak of buyer
#     ELSE IF     "${case0}" == "failed_1"
#         Verify Invalid Onpeak of buyer
#     END

Verify Valid Onpeak of buyer
    [Documentation]                         Bidding Success
    Wait Until Page Contains Element        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div
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
    # ${place_by}         Get Element Attribute            xpath=//*[@id="testid-label-placedBy"]    Panuwat Phakaew
    # Should Be Equal     ${user_name}         ${place_by}

# Verify Invalid Onpeak of buyer
#     [Documentation]                     Verify error msg of onpeak 
#     Wait Until Page Contains Element    xpath=//*[@id="testid-text-onpeak-error"]
#     Element Should Be Visible           xpath=//*[@id="testid-text-onpeak-error"]
#     ${error_onpeak}     Get Text        xpath=//*[@id="testid-text-onpeak-error"]
#     Log to console      ${error_onpeak}
#     Should Be Equal     ${error_onpeak}     Price must be at least 2.51 Baht/kWh

# [Buy off bid]
ฺฺBuyer_bidding_offpeak
    [Documentation]     Use for input bidding order for Onpeak and Offpeak
    [Arguments]         ${off}     ${case0}
    Open Website        ${URL}
    Input Text          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button        xpath=${login_page.signin_btn.locator}
    Wait Until Page Contains Element    xpath=//*[@id="testid-btn-auction-sidebar"]   
    Click Element                       xpath=//*[@id="testid-svg-auction-sidebar"]
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    Click Element                       xpath=//*[@id="root"]/div/div/div[2]/div/div[2]/div/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/label[2]
    Input Text                          xpath=//*[@id="testid-input-offpeak"]      text=${off}
    Click Button                        xpath=//*[@id="testid-button-auction"]
    IF      "${case0}" == "passed_1"
        Verify Valid Offpeak of buyer
    ELSE IF     "${case0}" == "failed_1"
        Verify Invalid Offpeak of buyer
    END

Verify Valid Offpeak of buyer
    [Documentation]                         Bidding Success
    Wait Until Page Contains Element        xpath=/html/body/div[3]/div/div[2]/div/div[2]/div
    Element Should Be Visible               xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/button
    Click Button                            xpath=/html/body/div[3]/div/div[2]/div/div[2]/div/button
    ${latest_off}       Get Text            xpath=//*[@id="testid-value-price"]
    Log to console      ${latest_off}
    Click Button                            xpath=//*[@id="testid-link-lastBid"]
    ${his_value}         Get Text           xpath=//*[@id="testid-value-offPeakPrice"]/span
    Log to console      ${his_value}
    Should Be Equal     ${his_value}         ${latest_off}
    ${user_name}        Get Element Attribute         xpath=//*[@id="root"]/div/div/div[2]/div/div[2]/div/div[2]/div[1]/div[2]/div/div[3]/div[1]/div[2]/div[1]/div[1]/div[2]/div[2]/span    Panuwat Phakaew
    Log to console      ${user_name}
    ${place_by}         Get Element Attribute            xpath=//*[@id="testid-label-placedBy"]    Panuwat Phakaew
    Should Be Equal     ${user_name}         ${place_by}

Verify Invalid Offpeak of buyer
    [Documentation]                     Verify error msg of onpeak 
    Wait Until Page Contains Element    xpath=//*[@id="testid-text-offpeak-error"]
    Element Should Be Visible           xpath=//*[@id="testid-text-offpeak-error"]
    ${error_off}     Get Text           xpath=//*[@id="testid-text-offpeak-error"]
    Log to console      ${error_off}
    Should Be Equal     ${error_off}     Price must be at least 1.56 Baht/kWh




# Verify Invalid Onpeak of Seller
#     [Documentation]                     Verify error msg
#     Wait Until Page Contains Element    xpath=//*[@id="testid-text-onpeak-error"]
#     Element Should Be Visible           xpath=//*[@id="testid-text-onpeak-error"]
#     ${error_onpeak}     Get Text        xpath=//*[@id="testid-text-onpeak-error"]
#     Log to console      ${error_onpeak}
#     Should Be Equal     ${error_onpeak}     Price must be between 2.51 - 4.18 Baht/kWh


Test case เก่า


*** Settings ***
Documentation       Use for test Buy Auction [ONPEAK]
Resource            ../resource/auction_page/keywords.robot
Test Template       ฺฺBuyer_bidding_onpeak
Test Teardown       Close All Browsers

*** Test Case ***               offpeak      case

Order1                          2.52           passed_1
    [Documentation]     Verify input price case : more than at least (2.51)
Order2                          2.51        passed_1
    [Documentation]     Verify input price case : equal at least (2.51)
Order3                          1           failed_1
    [Documentation]     Verify input price case : less than at least (2.51)
Order4                          2.80         passed_1
    [Documentation]     Verify input price case : update bidding price


07 for Sell side
    [Documentation]                     Verify UI when select contract type sell on the dropdown 
    Open Website                        ${BROWSER}=chrome
    Input Text                          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text                          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button                        xpath=${login_page.signin_btn.locator}
    Wait Until Element Is Enabled       xpath=${auction_page.auction_menu.locator} 
    Click Element                       xpath=${auction_page.auction_icon.locator}
    Verify Auction page                 xpath=${login_page.auction_title.locator}
    Click Element                       xpath=${auction_page.contract_type.locator}
    Wait Until Element Is Enabled       xpath=/html/body/div[2]/div/div  
    Element Should Be Visible           xpath=//*[contains(text(),'sell')]
    Click Element                       xpath=//*[contains(text(),'sell')]
    ${sell_txt}              Get Text        xpath=//*[contains(text(),'sell')]
    Should Be Equal     ${sell_txt}     Sell

# 08 Test case of Sell side verify
    # Element Should Be Visible           xpath=//*[@id="testid-label-onpeak"]        On Peak Commission Fee (Baht/kWh)
    # ${onpeak_minimum}     Get Text        xpath=//*[@id="testid-text-onpeak-error"]
    # Should Be Equal      ${onpeak_minimum}         Price must be between 