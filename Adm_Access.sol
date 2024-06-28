// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Admin_Access{
    string public TokenName = "Ubuntu";
    string public TokenAbbrv = "UB";
    uint public totalSupply = 0;
    address own;

    constructor(){
        own = msg.sender;
    }

    mapping (address => uint ) public balances;

    modifier Owner(){
        require(own == msg.sender,"Admin Access Only");
        _;
    }
}
