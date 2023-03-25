*** Settings ***
Documentation       Use for update keywords
Library             BuiltIn
Library             SeleniumLibrary
Resource            ../variable.robot
Variables           element.yml


*** Keywords ***
Open Website
    [Documentation]       Use for set up open browser
    [Arguments]         ${link}                          ${BROWSER}=headlesschrome
    Open Browser        ${URL}                           ${BROWSER}
    Set Selenium Speed  1 seconds

Close Browser After Finish
    [Documentation]       Use close browser
    Close Browser

Input Login
    [Documentation]     Use for input login page
    [Arguments]         ${str1}     ${str2}     ${case1}
    Open Website        ${URL}
    Input Text          xpath=${login_page.email_textbox.locator}   text=${str1}
    Input Text          xpath=${login_page.pass_textbox.locator}    text=${str2}
    Click Button        xpath=${login_page.signin_btn.locator}
    IF      "${case1}" == "success"
        Verify Success
    ELSE IF     "${case1}" == "failed_type_2"
        Verify Failed 02
    ELSE IF     "${case1}" == "failed_type_3"
        Verify Failed 03
    ELSE IF     "${case1}" == "failed_type_4"
        Verify Failed 04
    ELSE IF     "${case1}" == "failed_type_5"
        Verify Failed 05
    ELSE IF     "${case1}" == "failed_type_6"
        Verify Failed 06
    ELSE IF     "${case1}" == "failed_type_7"
        Verify Failed 07
    END

# case:LI001_08

Verify Success
    [Documentation]                     Verify Login success
    Wait Until Page Contains Element    xpath=${login_page.redirect_home.locator}
    Element Should Be Visible           xpath=${login_page.profile_btn.locator}
    ${url_buy}=       Get Location
    Should Be Equal      ${url_buy}    ${url}buy

# case:LI001_02chromeDriver -v

Verify Failed 02
    [Documentation]                     Verify email text box case : input invalid format
    Wait Until Page Contains Element    xpath=${login_page.error_msg_text.locator}
    Element Should Be Visible           xpath=${login_page.error_msg_text.locator}
    Get Text                            xpath=${login_page.error_msg_text.locator}

# case:LI001_03

Verify Failed 03
    [Documentation]                     Verify email text box case : input valid format
    Element Should Not Be Visible       xpath=${login_page.error_msg_text.locator}
    Get Text                            xpath=${login_page.error_msg_text.locator}

# case:LI001_04

Verify Failed 04
    [Documentation]                     Verify Login failed case : case : not input all data
    Wait Until Page Contains Element    xpath=${login_page.error_email_text.locator}
    Element Should Be Visible           xpath=${login_page.error_email_text.locator}
    Element Should Be Visible           xpath=${login_page.error_password_text.locator}
    Get Text                            xpath=${login_page.error_email_text.locator}
    Get Text                            xpath=${login_page.error_password_text.locator}

# case:LI001_05

Verify Failed 05
    [Documentation]                     Verify Login failed case : input email only
    Wait Until Page Contains Element    xpath=${login_page.error_password_text.locator}
    Element Should Be Visible           xpath=${login_page.error_password_text.locator}
    Get Text                            xpath=${login_page.error_password_text.locator}

# case:LI001_06

Verify Failed 06
    [Documentation]                     Verify Login failed case : input password only
    Wait Until Page Contains Element    xpath=${login_page.error_email_text.locator}
    Element Should Be Visible           xpath=${login_page.error_email_text.locator}
    Get Text                            xpath=${login_page.error_email_text.locator}

# case:LI001_07

Verify Failed 07
    [Documentation]                     Verify Login failed case : email and password are not matched
    Wait Until Page Contains Element    xpath=${login_page.error_msg_text.locator}
    Get Text                            xpath=${login_page.error_msg_text.locator}
