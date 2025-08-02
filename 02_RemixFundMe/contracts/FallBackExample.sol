// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FallBackExample{
    uint256 public result;

    //Only gets triggered if our call data to it is blank. 
    receive () external payable{
        result=1;
    }

    //Similar to the receive function , but can work even when data is sent with the transaction
    fallback() external payable {
        result =2;
    }

}