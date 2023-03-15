// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;


contract BootcampContract {

    uint256 number;
    address deployer;

    function store(uint256 num) public {
        number = num;
    }

    constructor() {
        deployer = msg.sender;
    }
    function retrieve() public view returns (uint256){
        return number;
    }
    function returnAddress() external view returns(address) {
        if (deployer == msg.sender){
            return 0x000000000000000000000000000000000000dEaD;
        }
        return deployer; 
    }


}