// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract MappingStructExample {
    // Mapping để lưu số dư của các địa chỉ
    mapping(address => uint) public balanceReceived;

    // Hàm để lấy số dư Ether của hợp đồng
    function getBalance() public view returns (uint) {
        return address(this).balance;
    } 

    // Hàm để gửi tiền vào hợp đồng
    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    // Hàm để rút một số tiền cụ thể từ người gửi đến địa chỉ cụ thể
    function withdrawAmount(address payable _to, uint _amount) public {
        require(balanceReceived[msg.sender] >= _amount, "not enough funds"); // Kiểm tra số dư của người gửi
        require(address(this).balance >= _amount, "not enough contract balance"); // Kiểm tra số dư của hợp đồng
        balanceReceived[msg.sender] -= _amount; // Cập nhật số dư của người gửi
        _to.transfer(_amount); // Chuyển tiền
    }

    // Hàm để rút toàn bộ tiền của hợp đồng đến địa chỉ cụ thể
    function withdrawAllMoney(address payable _to) public {
        uint contractBalance = getBalance(); // Lấy số dư của hợp đồng
        require(contractBalance > 0, "No balance to withdraw"); // Kiểm tra số dư của hợp đồng
        _to.transfer(contractBalance); // Chuyển toàn bộ số dư đến địa chỉ _to
    }
}
