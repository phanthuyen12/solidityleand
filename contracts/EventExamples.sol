// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract EventExample {
    mapping(address => uint) public tokenBalance;  // Sửa chính tả từ `tokenBalace` thành `tokenBalance`

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns (bool) {
        require(tokenBalance[msg.sender] >= _amount, "NOT ENOUGH TOKENS");
        require(tokenBalance[_to] + _amount >= tokenBalance[_to], "TRANSFER CAUSES OVERFLOW");  // Thay assert bằng require để kiểm tra tràn số
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        return true;
    }
}
