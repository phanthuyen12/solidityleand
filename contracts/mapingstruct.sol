// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MappingStructExample {
    // Khai báo một mapping để lưu trữ số dư của mỗi địa chỉ người dùng
    mapping(address => uint) public  balances;

    // Hàm để cập nhật số dư của một địa chỉ
    struct Payment{
        uint amout;
        uint timestamp;

    }
    struct Balance{
        uint totalBalance;
        uint numpaymet;
        mapping (uint => Payment)  paymets;
    }
}
