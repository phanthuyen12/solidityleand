// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract FunctionsExample {
    // Mapping lưu trữ số dư của mỗi địa chỉ người dùng
    mapping(address => uint) public balanceReceived;

    // Hàm nhận tiền từ người gửi
    function receiveMoney() public payable {
        // Cập nhật số dư của người gửi
        balanceReceived[msg.sender] += msg.value;
    }

    // Hàm rút tiền từ hợp đồng và gửi tới địa chỉ cụ thể
    function withdrawMoney(address payable _to, uint _amount) public {
        // Kiểm tra xem người gọi có đủ số dư để rút không
        require(balanceReceived[msg.sender] >= _amount, "You don't have enough ether");
        // Cập nhật số dư trước khi chuyển tiền để tránh lỗi reentrancy
        balanceReceived[msg.sender] -= _amount;
        // Chuyển tiền tới địa chỉ người nhận
        _to.transfer(_amount);
    }

    // Hàm receive để nhận Ether không có dữ liệu
    receive() external payable {
        receiveMoney();
    }

    // Hàm fallback để nhận Ether với dữ liệu hoặc gọi hàm không tồn tại
    fallback() external payable {
        receiveMoney();
    }
}
