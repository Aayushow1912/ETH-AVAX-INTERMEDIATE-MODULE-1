// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Crowdfunding {
    address public owner;
    mapping(address => uint) public contributions;
    uint public totalContributions;
    uint public goal;
    uint public deadline;

    // Events
    event ContributionReceived(address contributor, uint amount);
    event FundsWithdrawn(uint amount);
    event RefundIssued(address contributor, uint amount);

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute() public payable {
        require(block.timestamp < deadline, "Funding period has ended.");
        require(msg.value > 0, "Contribution must be greater than 0.");
        
        contributions[msg.sender] += msg.value;
        totalContributions += msg.value;
        assert(totalContributions <= goal);
        
        emit ContributionReceived(msg.sender, msg.value);
    }

    function withdrawFunds() public {
        require(msg.sender == owner, "Only owner can withdraw funds.");
        require(block.timestamp >= deadline, "Funding period has not ended.");
        require(totalContributions >= goal, "Funding goal not reached.");

        uint amount = totalContributions;
        totalContributions = 0;
        payable(owner).transfer(amount);

        emit FundsWithdrawn(amount);
    }

    function issueRefunds() public {
        require(block.timestamp >= deadline, "Funding period has not ended.");
        require(totalContributions < goal, "Funding goal reached, no refunds.");

        uint contributedAmount = contributions[msg.sender];
        require(contributedAmount > 0, "No contributions to refund.");
        
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(contributedAmount);

        emit RefundIssued(msg.sender, contributedAmount);
    }

    function checkGoalReached() public view returns (bool) {
        if (block.timestamp >= deadline) {
            return totalContributions >= goal;
        } else {
            return false;
        }
    }

    // Fallback function to accept contributions
    receive() external payable {
        contribute();
    }
}
