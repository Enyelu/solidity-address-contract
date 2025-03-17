// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.13;


contract AddressContract {

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
     require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Caller is not owner");
     _;
   }
   function  getTransactionInfo  () onlyOwner public returns(ResponseModel memory){

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