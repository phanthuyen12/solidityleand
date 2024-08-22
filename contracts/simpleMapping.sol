// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;
contract SimpleMapping{
    mapping(uint => bool) public myMapping;
    function setValue(uint _index) public {
        myMapping[_index] = true;
    }
}