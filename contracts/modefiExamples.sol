// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Owned {
    address owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "you are not allowed");
        _;
    }
}

contract ModifierExample is Owned {
    mapping(address => uint256) public tokenBalance;
    uint tokenPrice = 1 ether;

    constructor() {
        tokenBalance[owner] = 100;
    }

    function createNewToken() public onlyOwner {
        tokenBalance[owner]++;
    }

    function burnToken() public onlyOwner {
        require(tokenBalance[owner] > 0, "No tokens to burn");
        tokenBalance[owner]--;
    }
}
