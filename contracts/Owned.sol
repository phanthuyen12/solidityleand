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