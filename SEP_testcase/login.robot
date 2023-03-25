*** Settings ***
Documentation       Use for test SEP_login
Resource            ../resource/login_page/keywords.robot
Test Template       Input Login
Test Teardown       Close All Browsers


*** Test Cases ***          email                   password        case
LI001_02                    ssoip@                  12345           failed_type_2
    [Documentation]     Verify email text box case : input invalid format
LI001_03                    ssoip@sertiscorp.com    12345           failed_type_3
    [Documentation]     Verify email text box case : input valid format
LI001_04                     ${EMPTY}               ${EMPTY}        failed_type_4
    [Documentation]     Verify Login failed case : case : not input all data
LI001_05                    pphak@sertiscorp.com    ${EMPTY}        failed_type_5
    [Documentation]     Verify Login failed case : input email only
LI001_06                    ${EMPTY}                test12345       failed_type_6
    [Documentation]     Verify Login failed case : input password only
LI001_07                    ssoip@sertiscorp.com    @test1111       failed_type_7
    [Documentation]     Verify Login failed case : email and password are not matched
LI001_08                    prakb@sertiscorp.com    @Test12345       success
    [Documentation]     Verify Login success
