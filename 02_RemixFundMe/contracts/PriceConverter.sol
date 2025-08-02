//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library  PriceConverter{
    //To check whether msg.value is greater than minimum USD,
    //we need to convert it to usd at the current price
    //First, fetch current price
    function getPrice () internal view returns (uint256) {
        AggregatorV3Interface priceFeed= AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306); //Address inherently contrains a decimal place specifier
        (, int256 price, , ,)=priceFeed.latestRoundData();
        return uint256 (price*1e10); // Adds 10 additional decimal places to the price so it matches the  number of zeros (18) in msg.value 
    }

    function getConversionRate (uint256 ethAmount) internal view returns(uint256) {
       uint256 ethPrice=getPrice();
        uint256 ethAmountInUsd=(ethPrice*ethAmount)/1e18; //Dividing by 1e18 to remove the 18 decimal from the ethPrice, although the decimals places still remain
        return ethAmountInUsd;
    }

    //This single line of code helps fetch price or find
    //result of any other function declared in the interface
    //as long as you have the interface imported
    function getVersion () internal view returns(uint256) {
       return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

    }

}