// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;


contract MyFirstContract {
    string public hey;
    int8 public no;
    int public minNumber;
    int public maxNumber;
    address public Addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    uint[] public arrayNumbers;
    uint public blockNumber;
    uint public gasprice;
    address origin;
    bytes4 signature;
    address contractOwner;
    uint public startTime;
    uint public endTime;



   modifier onlyOwner{
     require(msg.sender != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Caller is not owner");
     _;
   }
   function  printInputs  () onlyOwner public returns(address, address,uint, uint){

        minNumber = type(int).min;
        maxNumber = type(int).max;
      
        signature = msg.sig;
        contractOwner = msg.sender;

        blockNumber = block.number;

        gasprice = tx.gasprice;
        origin = tx.origin;
        startTime = block.timestamp;
        endTime = block.timestamp + 7 days;


        uint pinter = Addr.balance;
        arrayNumbers.push(pinter);
        return (msg.sender, tx.origin, startTime, endTime);

   }
}