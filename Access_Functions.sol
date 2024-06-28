// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract FunContract {
    uint256 public temp;

    constructor(uint _num) {
        temp = _num;
    }

    function get_temp() public view returns (uint) {  // this function can only read
        return temp;
    }

    function MulNum(uint x, uint y) public pure returns (uint) { // this will not read by anyone
        return x * y;
    }

    function getEth() public payable {
        require(msg.value > 0, "Ether sent is zero");
        temp += msg.value;
    }
}

contract DerivedContract is FunContract {
    constructor(uint _init) FunContract(_init) {} // initialized constructor

    function callget_temp() public view returns (uint) {
        return temp;
    }

    function call_MulNum(uint a, uint b) public pure returns (uint) {
        return MulNum(a, b);
    }

    function callget_Eth() public payable {
        getEth();
    }
}
