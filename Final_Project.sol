// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Crowdfunding {
    address public owner;
    mapping(address => uint) public contributions;
    uint public totalContributions;
    uint public goal;
    uint public deadline;
    uint public refundAmount;

    // Events
    event ContributionReceived(address contributor, uint amount);
    event FundsWithdrawn(uint amount);
    event RefundIssued(address contributor, uint amount);

    constructor(uint _goal, uint _duration) {
        owner = msg.sender;
        goal = _goal;
        deadline = block.timestamp + _duration;
    }

    function contribute(uint _amount) public payable {
        require(block.timestamp < deadline, "Funding period has ended.");
        require(_amount > 0, "Contribution must be greater than 0.");
        require(msg.value == _amount, "Invalid contribution amount.");
        contributions[msg.sender] += _amount;
        totalContributions += _amount;
        emit ContributionReceived(msg.sender, _amount);
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

    function issueRefund() public {
        require(block.timestamp >= deadline, "Funding period has not ended.");
        require(totalContributions < goal, "Funding goal reached, no refunds.");
        uint contributedAmount = contributions[msg.sender];
        require(contributedAmount > 0, "No contributions to refund.");
        refundAmount = contributedAmount;
        contributions[msg.sender] = 0;
        payable(msg.sender).transfer(refundAmount);
        emit RefundIssued(msg.sender, refundAmount);
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
        contribute(msg.value);
    }
}
