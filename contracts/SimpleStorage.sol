// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20; // The solidity versions acceptable for this file. 

contract SimpleStorage{

    
    uint256  myfavoriteNumber; // Storage varible because it exists whithin a contract but outside of a function. 

    //Setter
    function store (uint256 _favoriteNumber) public {
        myfavoriteNumber= _favoriteNumber; 
    }

    //Getter
    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }

    //Even better: Custom General variable
    struct Person {
        uint256 favoriteNumber;
        string Name;
    }

    //Instances of the above custom general variable with characteristics assigned
    //When creating an instance of a  custom type, you have to state the custom type twice, both on the left and on the right

    Person public pat =Person({favoriteNumber:7, Name: "Pat"}); 
    Person public emma =Person({favoriteNumber:10, Name:"Emma"});
    Person public noah = Person({favoriteNumber:12, Name:"Noah"});
    Person public liam = Person ({favoriteNumber:17, Name:"Liam"});

    //Above instantiation can get tidious. 
    //Lets use dynamic arrays

    Person[] public listOfPeople;

    //Mappings:A getter for the array sub-characteristics
    // So we don't have to use the tidious indexing approach
    
    mapping (string => uint256) public nameToFavouriteNumber;
    
    // A "memory" parameter variable can be modified within its scope (the associated function) 
    //while a "calldata" parameter variable cannot be modified within the function

    function addPerson (string memory _name, uint256  _favoriteNumber) public {
        listOfPeople.push( Person(_favoriteNumber, _name));
        nameToFavouriteNumber [_name] = _favoriteNumber;
    }
























}


