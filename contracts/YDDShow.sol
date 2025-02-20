// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract YDDShow {
    uint256 private age;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Function to set age
    function setAge(uint256 _age) public {
        require(_age > 0 && _age < 150, "Invalid age value");
        age = _age;
    }

    // Function to get age
    function getAge() public view returns (uint256) {
        return age;
    }
} 