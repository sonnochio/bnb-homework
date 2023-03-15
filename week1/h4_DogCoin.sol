// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

contract DogCoin {
    uint256 totalSupply = 2000000;
    address owner;
    event supplyChange(uint256);
    event transferMade(uint256, address);
    mapping (address => uint256) public balences;
    struct TransactData{
        address addr;
        uint256 amount;
    }

    mapping (address => TransactData[]) record;


    function getRecord (address user) public view returns (TransactData[] memory)  {
        return record[user];
    }

    function creatRecord (address _recipient, uint256 _amountSent) private {
        record[msg.sender].push(TransactData({addr:_recipient, amount:_amountSent}));
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not the owner");
        _;
    }

    function getTotalSuplly() public view onlyOwner returns(uint256){
        return totalSupply;
    }

    //function to increase supply by 1000
    function increaseSupply() public onlyOwner{
        totalSupply += 1000;
        emit supplyChange(totalSupply);
    }

    function transfer(address recipient, uint amount) public {
        balences[msg.sender] -= amount;
        balences[recipient] += amount;
        creatRecord(recipient, amount);

        emit transferMade(amount, recipient);
        //we do not need the sender's address because we can access it as msg.sender, and the mapping doesn't require it.
        //If the sender's address is required as a parameter, it might be at risk of exposure?

    }

    constructor(){
        owner = msg.sender;
        balences[owner] = totalSupply;
    }











}