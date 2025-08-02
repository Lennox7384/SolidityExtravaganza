// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {PriceConverter} from "./PriceConverter.sol";
error NotOwner();
contract FundMe{
    using PriceConverter for uint256; //Attaches PriceConverter functions to all our uint256 variables
    address public immutable  i_owner;
    // 439 gas when marked as immutable
    // 2,573 gas when not marked as immutable

    uint256 public constant MINIMUM_USD =5e18;
    //347 GAS when a costant
    //2000 gas when not explicitly a constant

    address[] public funders;
    mapping(address funder => uint256 amountFunded) public addressToAmountFunded;

    //Constructor
    constructor(){
        i_owner=msg.sender;
    }

    //Function to send money to the contract and map senders to amount sent
    function fund() public payable{
        require(msg.value.getConversionRate() > MINIMUM_USD, "didn't send enough ETH");
        //Remember msg.value is a uint256
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]+=msg.value;  
    }

    //Function to withdraw money from the contract
    function withdraw() public onlyOwner {
        //for loop
        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder]=0; //Resetting the ammount they sent us back to zero
        }
        funders = new address[](0); //Resetting the array to empty

        //actual withdrawal in different lower level functions
        //transfer(good)
        payable (msg.sender).transfer(address(this).balance);

        //send (better)
        bool sendSuccess=payable (msg.sender).send(address(this).balance);
        require(sendSuccess, "Send failed for some reason");

        //call (best, recommended)
        (bool callSuccess, )=payable (msg.sender).call{value:address(this).balance}("");
        require(callSuccess, "Call failed"); //revert.

    }

    //Modifier
    modifier onlyOwner(){
        if(msg.sender!=i_owner){revert NotOwner();}
       // require(msg.sender==i_owner, "Sender is not Owner!");
        _; //Underscore is a special symbol that says "run the rest of the code"
    }

    //What happens when someone sends ETH OR data without use the available functions
    receive () external payable{
        fund();

    }

    fallback() external payable {
        fund();
    }
}







































































