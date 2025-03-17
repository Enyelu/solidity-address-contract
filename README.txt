# A Solidity Contract

This is a simple Solidity contract called `AddressContract` that demonstrates how to interact with blockchain properties and capture transaction details. The contract allows a specific address (the owner) to fetch various blockchain-related information such as block properties, transaction details, and more.

## Contract Features

- **Owner-Only Access:** The contract restricts certain functionalities to a specific address (the owner).
- **Blockchain Information Retrieval:** It retrieves various blockchain properties, including block number, base fee, gas limit, timestamp, etc.
- **Transaction Information:** It captures transaction details such as the sender's address, gas price, and transaction value.

## Functionality

### `getTransactionInfo()`

This is the primary function of the contract, which returns a struct (`ResponseModel`) containing the following information:

- **Block Information:**
  - Block Number
  - Block Base Fee
  - Block Hash
  - Block Chain ID
  - Block Coinbase (Miner's address)
  - Block Difficulty
  - Block Gas Limit
  - Block Timestamp

- **Transaction Information:**
  - Transaction Origin Gas Price
  - Transaction Origin (the sender's address of the transaction)
  - Transaction Signature (the function signature that was called)
  - Transaction Sender (the address that initiated the transaction)
  - Gas Remaining (`gasleft()`)
  - Transaction Value (Ether sent with the transaction)

The function is restricted to the owner address, which is hardcoded for demonstration.

### Requirements

- **Solidity Version:** `^0.8.13`
- **Ethereum Network:** Can be deployed on Ethereum-based networks (e.g., Ethereum, Binance Smart Chain, Polygon, etc.)
- **Owner Address:** The contract checks if the caller matches the hardcoded owner address (0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2).

### Security

- The `onlyOwner` modifier ensures that only a specific address (the owner) can call the `getTransactionInfo()` function.
- The contract currently uses a hardcoded owner address, which should be updated before deployment for real-world use.

## Contract Deployment

1. **Compile the Contract:**
   - Use an IDE like [Remix](https://remix.ethereum.org) to compile the contract or any Ethereum development tool of your choice.
   
2. **Deploy the Contract:**
   - Deploy the contract to your preferred Ethereum network (testnet or mainnet).
   - Ensure you use the correct owner address when deploying.

3. **Interacting with the Contract:**
   - The owner can call the `printInputs()` function to retrieve the block and transaction data.
   - The contract will return a `ResponseModel` struct containing the requested information.

### Example of calling `printInputs()`

```javascript
const myContract = new web3.eth.Contract(abi, contractAddress);

// Call the function as the owner
const response = await myContract.methods.printInputs().call({ from: ownerAddress });
console.log(response);
```

## Contract Code

```solidity
// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract AddressContract {

    ResponseModel public response;

    struct ResponseModel {
        uint blockNumber;
        uint blockBasefee;
        bytes32 blockHash;
        uint blockChainId;
        address blockCoinbase;
        uint blockDifficulty;
        uint blockGaslimit;
        uint blockTimestamp;
        uint originGasPrice;
        address origin;
        bytes4 signature;
        address sender;
        uint gas;
        uint value;
    }

    modifier onlyOwner {
        require(msg.sender == 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Caller is not owner");
        _;
    }

    function getTransactionInfo() onlyOwner public returns (ResponseModel memory) {
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
        response.gas = gasleft();
        response.value = msg.value;

        return response;
    }
}
```

## Notes

- **Gas Estimation:** Calling the `printInputs()` function will require gas, as it interacts with blockchain data and performs some calculations.
- **Owner Management:** Ensure you update the `owner address` in the contract before deploying to ensure only the designated account can access the functionality.

## License

This contract is licensed under the **GPL-3.0** License.

---

This README provides an overview of the contract's functionality and usage, along with the code and deployment instructions. Let me know if you need further details!