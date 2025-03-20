// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicroDonation {
    address payable public recipient;
    address public owner;
    uint256 public totalDonations;
    uint256 public platformFeeBps; // e.g., 100 = 1%

    event DonationReceived(address indexed donor, uint256 amount);

    constructor(address payable _recipient, uint256 _feeBps) {
        owner = msg.sender;
        recipient = _recipient;
        platformFeeBps = _feeBps;
    }

    function donate() external payable {
        require(msg.value > 0, "Donation amount must be > 0");
        
        uint256 fee = (msg.value * platformFeeBps) / 10000;
        uint256 recipientAmount = msg.value - fee;

        (bool sent, ) = recipient.call{value: recipientAmount}("");
        require(sent, "Failed to send ETH to recip// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MicroDonation {
    address payable public recipient;
    address public owner;
    uint256 public totalDonations;
    uint256 public platformFeeBps; // e.g., 100 = 1%

    event DonationReceived(address indexed donor, uint256 amount);
…    }
}ient");

        totalDonations += msg.value;
        emit DonationReceived(msg.sender, msg.value);
    }

    // Withdraw platform fees (restricted to owner)
    function withdrawFees(address payable _to) external onlyOwner {
        uint256 balance = address(this).balance;
        (bool sent, ) = _to.call{value: balance}("");
        require(sent, "Withdrawal failed");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }
}
