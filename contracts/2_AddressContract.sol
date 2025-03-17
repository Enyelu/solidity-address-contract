// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;


contract MyFirstContract {

   ResponseModel public response;

   struct ResponseModel {
    
    uint  blockNumber ;
    uint  blockBasefee;
    bytes32  blockHash;
    uint  blockChainId;
    address  blockCoinbase;
    uint  blockDifficulty;
    uint  blockGaslimit;
    uint  blockTimestamp;

    uint  originGasPrice;
    address origin;

    bytes4 signature;
    address sender;
   }

   modifier onlyOwner{
     require(msg.sender != 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Caller is not owner");
     _;
   }
   function  printInputs  () onlyOwner public returns(ResponseModel memory){

        response.blockNumber = block.number;
        response.blockBasefee = block.basefee;
        response.blockHash = blockhash(block.number);
        response.blockChainId = block.chainid;
        response.blockCoinbase = block.coinbase;
        response.blockDifficulty = block.prevrandao;
        response.blockGaslimit = block.gaslimit;
        response.blockTimestamp = block.timestamp;

        response.originGasPrice = tx.gasprice;
        response.origin = tx.origin;

        response.signature = msg.sig;
        response.sender = msg.sender;

        return (response);

   }
}