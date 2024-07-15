// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Crowdfunding {
    address public owner;
    mapping(address => uint) public contributions;
    uint public totalContributions;
    uint MinimumContributions;
    uint raisedAmount;
    uint public goal;
    uint public deadline;

    // Events
    event ContributionReceived(address contributor, uint amount);

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
        MinimumContributions = 100 wei;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Funding period has ended.");
        require(msg.value >= MinimumContributions, "The Minimum contributions not met!");

        if(contributions[msg.sender] == 0){
            totalContributions++;
        }
        contributions[msg.sender] += msg.value;
        raisedAmount += msg.value;

        emit ContributionReceived(msg.sender, msg.value);
    }
    
     function checkGoalReached() public view returns (bool) {
        if (raisedAmount >= goal) {
            return true;
        } else {
            return false;
        }
     }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // Fallback function to accept contributions
    receive() external payable {
        contribute();
    }
}
