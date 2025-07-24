// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

//Named Imports better preffered
import {SimpleStorage} from "./SimpleStorage.sol"; 

contract StorageFactory {

    //Array variable to store lists of deployed SimpleStorage contracts
    //Intended to be a running list of all the different SimpleStorage contracts that we are deploying
    SimpleStorage [] public listOfSimpleStorageContracts;

    //Intended to deploy the above SimpleStorage contract 
    function createSimpleStorageContract() public {

        //Deploying & Storing the contract
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorageContract);
    }

    //Interacting with SimpleStorage from Storage Factory
    //Remember address and ABI 
    function sfStore (uint256 _simpleStorageindex, uint256 _newSimpleStorageNumber) public {
        //Chery Picking
        SimpleStorage mySimpleStorage =listOfSimpleStorageContracts[_simpleStorageindex];
        mySimpleStorage.store(_newSimpleStorageNumber);

    }

    //Function to  retrieve _newSimpleStorageNumber from simpleStorageContract
    function sfRetrieve(uint256 _simpleStorageIndex) public view returns (uint256){
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
    }

    


















}






































