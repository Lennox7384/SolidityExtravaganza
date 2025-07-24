// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract FundMe{

    uint256 public myValue = 1;

    //Function to send money to the contract
    function fund() public payable{

        myValue=myValue+2;
        require(msg.value > 1e18, "didn't send enough ETH"); //To send the message users are required to spend more than 1 ETH.

    }

    //Function to withdraw money from the contract
    function withdraw() public {}





    
}









































