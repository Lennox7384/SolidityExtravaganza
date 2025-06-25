// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26; // The solidity versions acceptable for this file. 

contract SimpleStorage{
    //Favorite number gets initialized to zero if no value is given.
    //State variables: These are variables outside of a function like below.
    //The keyword "public" changes the visibility of the content stored to public.
    //Absence of Key word means the variable is internal 
    
    uint256  myfavoriteNumber;

    //An Array
    //uint256[] listOfFavoriteNumbers;

    //Creating a custom general variable with specific characteristics.
    //Solidity automatically idexes the characteristics of custom type definition. 
    struct Person {
        uint256 favoriteNumber;
        string Name;
    }

    //Dynamic array
    Person[] public listOfPeople;



    //Defining a general variable and assigning those characteristics.
    Person  public pat = Person({favoriteNumber:7, Name: "Pat"});

    //What if you have many friends?Might get very tedious!
    //Therefore we have to use an array. 

                              
    //creating function store
    function store (uint256 _favoriteNumber) public {
    
        myfavoriteNumber= _favoriteNumber;
        
    }

    // Getter function similar to a public variable
    //Key word "view": (Only read state from the blockchain is allow)The associated function does not have to send a transaction for it to return intended result. 
    //Key word "pure": (Disallow both updating and reading from state or storage)

    //"View" and "pure" therefore consume no gas.
    //If another function that does cost gas calls them, gas will be consumed. 

    function retrieve() public view returns(uint256){
        return myfavoriteNumber;
    }


    // Function to add people to the array we just created
    function addPerson (string memory _name, uint256 _favoriteNumber) public {
        
        listOfPeople.push( Person(_favoriteNumber, _name));
    }


}


