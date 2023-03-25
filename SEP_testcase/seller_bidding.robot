*** Settings ***
Documentation       Use for test Buy Auction
Resource            ../resource/auction_page/keywords.robot
# Test Template       ฺฺBuyer_bidding_onpeak
Test Template       ฺฺBuyer_bidding_offpeak

Test Teardown       Close All Browsers

*** Test Case ***               onpeak      case

Order1                          3.5         passed_1
    [Documentation]     Verify input price case : more than at least (2.51)
Order2                          2.51        passed_1
    [Documentation]     Verify input price case : equal at least (2.51)
Order3                          1           failed_1
    [Documentation]     Verify input price case : less than at least (2.51)
Order4                          2.56        passed_1
    [Documentation]     Verify input price case : update bidding price
Order5                          1.7         passed_1
    [Documentation]     Verify input price case : valid offpeak