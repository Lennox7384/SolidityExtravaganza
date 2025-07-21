// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {SimpleStorage} from "./SimpleStorage.sol";

//Inheritance at work
contract AddFiveStorage is SimpleStorage{

//Custom functionality specific to AddFiveStorage
function store(uint256 _favouriteNumber) public override {
    myfavoriteNumber=_favouriteNumber+5;
}

}
