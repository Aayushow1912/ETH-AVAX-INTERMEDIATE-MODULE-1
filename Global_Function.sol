// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract GlobalFun {
    event LogMessage(
        address indexed sender,
        string message,
        uint256 timestamp,
        uint256 blockNumber,
        uint256 gasPrice,
        uint256 valueSent
    );

    // Function to log a message with global variables
    function logMessage(string memory message) public payable {
        emit LogMessage(
            msg.sender,
            message,
            block.timestamp,
            block.number,
            tx.gasprice,
            msg.value
        );
    }

    // Function to get the current block timestamp
    function getcrrTime() public view returns (uint256) {
        return block.timestamp;
    }

    // Function to get the sender address
    function getSendAdd() public view returns (address) {
        return msg.sender;
    }

    // Function to get the current block number
    function getCrrBlockNo() public view returns (uint256) {
        return block.number;
    }

    // Function to get the previous block's random number
    function getCurrentBlock_prev() public view returns (uint256) {
        return block.prevrandao;
    }

    // Function to get the current transaction's gas price
    function getprice() public view returns (uint256) {
        return tx.gasprice;
    }

    // Function to get the contract's balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // Function to get all global variables at once
    function getAllGV() public view returns (
        address sender,
        uint256 timestamp,
        uint256 blockNumber,
        uint256 prevR,
        uint256 gasPrice
    ) {
        sender = msg.sender;
        timestamp = block.timestamp;
        blockNumber = block.number;
        prevR = block.prevrandao;
        gasPrice = tx.gasprice;
    }
}
