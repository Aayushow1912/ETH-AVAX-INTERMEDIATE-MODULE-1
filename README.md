# Solidity Contract Readme

📄 **Crowdfunding** - A Simple Solidity Contract for Crowdfunding with error handling

# CrowdFunding

This is a simple Solidity contract that demonstrates error handling in Solidity using the `assert`, `revert`, and `require` statements. The contract implements a Crowdfunding system where the contributor can contribute the amount,also they can refund their amount whatever they wants, alongwith the owner can withdraw the funds whenever needed.

## Contract Overview

The `CrowdFunding` contract includes the following functionality:

- A `owner` variable that stores the address of the contract deployer.
- A `totalcontributions` mapping to track which addresses have done with contributions.
- A `refundAmount` for the contributors, if they want a refund.
- Functions to contribute, for withdrawal of funds, for refund and for checking the goal reached or not.

## Error Handling

### `require()`

The `require()` statement is used to validate certain conditions before further execution of a function.

Example:
```solidity
require(<condition to be validated>, <message to be displayed if the condition fails>);
```

### `assert()`

The `assert()` statement is similar to `require()` and checks for conditions. If a condition fails, the function execution is terminated with an error message.

Example:
```solidity
assert(<condition to be checked/validated>);
```

### `revert()`

The `revert()` statement can be used to flag an error and revert the current call. It can also include a message providing details about the error, which will be passed back to the caller.

Example:
```solidity
revert("This function always reverts");
```

## Using the Contract in Remix IDE

To use this contract in the Remix IDE, follow these steps:

1. Open the Remix IDE (https://remix.ethereum.org/).
2. Create a new Solidity file and name it "CrowdFunding.sol".
3. Copy and paste the contract code into the "CrowdFunding.sol" file.
4. Select the appropriate Solidity compiler version (0.8.0 or higher) in the Remix IDE.
5. Compile the contract by clicking the "Compile" button.
6. Once compiled successfully, you can interact with the contract using the Remix IDE's built-in console or by deploying it to a test network.


## Contract Functionality

### `contribute(uint256 _amount)`

The `contribute` function allows the contributor to contribute the amount for fundings.

Example usage:
```solidity
contractInstance.contribute("Contributions");
```

### `withdrawFunds()`

The `withdrawFunds` function is for the owner, only owner can withdraw the funds if the funds reached the goal amount.

Example usage:
```solidity
contractInstance.withdrawFunds();
```

### `issueRefund()`

The `issueRefund` function is for the contributors, if they wants to refund the amount, then they can call this function.

Example usage:
```solidity
contractInstance.issueRefund();
```

### `checkGoalReached()`

The `checkGoalReached` function checks if the fund goal has been reached or not.

Example usage:
```solidity
contractInstance.checkGoalReached();
```

### `Fallback Function`
##  `Recieve()`

The `Recieve` function is a payable function which is used to accept the contributions.

Example usage:
```solidity
contractInstance.Recieve();
```

### State Variables

- **`owner`**: The address of the contract owner with special privileges. It is of type `address`.
- **`contributions`**:  A mapping that tracks the amount of Ether contributed by each address. It is of type `mapping(address => uint)`.
- **`totalContributions`**:  The total amount of contributions received in Ether. It is a type of `uint`.
- **`goal`**:The funding goal of the crowdfunding campaign in Ether. It is a type of `uint`.
- **`deadline`**:  The timestamp marking the end of the crowdfunding campaign. It is a type of `uint`.
- **`refundAmount`**: The amount of Ether to be refunded to a contributor. It is a type of `uint`.

This detailed breakdown of the contxract functions and state variables should help you understand and present the functionality of the CrowdFunding contract effectively.


## 🌟 **Acknowledgement** 🌟

This project was built under the guidance of the [Metacrafters](https://www.metacrafters.io) team as part of their comprehensive [Eth-Avax Proof-intermediate](https://academy.metacrafters.io/content/solidity-avax-intermediate). I express my gratitude to the MetaCrafters team for their support and guidance throughout this learning journey.

## Authors
Aayush Tewari
