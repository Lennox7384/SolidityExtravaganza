// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Prior to versiion 0.8 of Solidity, when the maximum size of a mariable was reached 
//It overflowed to start again from zero. Version 0.8 solves this problem by reverting back the transaction
// Rather than getting the variable to start over again. 
contract SafeMathTester{

    uint8 public bigNumber =255;

    function add() public {
       unchecked { bigNumber =bigNumber+1;} 
    }

}
