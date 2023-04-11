// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Store {

    struct payments {
        address sender;
        uint8 paymentType;
        bool valid;
        bool checked;
        address receiver;
        uint256 amount;
        uint256 finalAmount;
        uint256 initialAmount;

    }
    bool flag1;
    bool flag2;
    bool flag3;
    address admin;
    uint8 index;
    address admin2;

    uint256 public number;
    mapping (address=>uint256) balances;
    payments[8] topPayments;


    constructor(){

    }


    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}
