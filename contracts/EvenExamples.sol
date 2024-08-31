// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EvenExample {
    mapping(address => uint) public tokenBalace;
    constructor() public {
        tokenBalace[msg.sender] = 100;
    }
}