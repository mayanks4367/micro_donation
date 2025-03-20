# 🎗️ MicroDonate: Decentralized Micro-Donation Platform 🌍

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Solidity v0.8.0+](https://img.shields.io/badge/Solidity-0.8.0%2B-brightgreen)](https://soliditylang.org/)
[![Tested-with-Hardhat](https://img.shields.io/badge/Tested%20with-Hardhat-yellow)](https://hardhat.org/)

A blockchain-based platform for seamless, transparent, and gas-efficient micro-donations in ETH. Perfect for charities, DAOs, and community projects!

![MicroDonation Workflow](https://i.imgur.com/3XzQ7Lj.png)

## 📖 Table of Contents
- [🌟 Features](#-features)
- [🛠️ Smart Contract Architecture](#%EF%B8%8F-smart-contract-architecture)
- [🔑 Core Functionality](#-core-functionality)
- [🚀 Quick Start](#-quick-start)
- [🔒 Security Audit](#-security-audit)
- [🧪 Testing](#-testing)
- [🌍 Deployment](#-deployment)
- [🤝 Contributing](#-contributing)
- [📜 License](#-license)

## 🌟 Features

- **Tiny Donations** ➡️ Accept donations as small as 0.001 ETH
- **Dynamic Fees** 💸 Configurable platform fee (0-10%)
- **Real-Time Tracking** 📈 Track total donations & contributors
- **Transparent** 🔍 All transactions recorded on-chain
- **No Middlemen** 🚫 Direct donor-to-recipient transfers
- **Gas Optimized** ⛽ Efficient Solidity code

## 🛠️ Smart Contract Architecture

### Contract Structure
```solidity

![WhatsApp Image 2025-03-20 at 3 57 29 PM](https://github.com/user-attachments/assets/63f33433-4a25-404c-8a4b-04a6593553d0)

contract MicroDonation {
    address payable public recipient;
    address public owner;
    uint256 public totalDonations;
    uint256 public platformFeeBps;
    
    constructor(address payable _recipient, uint256 _feeBps) {
        owner = msg.sender;
        recipient = _recipient;
        platformFeeBps = _feeBps;
    }
    
    function donate() external payable {
        // Core donation logic
    }
    
    function withdrawFees(address payable _to) external onlyOwner {
        // Fee withdrawal logic
    }
}




function withdrawFees(address payable _to) external onlyOwner {
    uint256 balance = address(this).balance;
    (bool sent, ) = _to.call{value: balance}("");
    require(sent, "Withdrawal failed");
}



sequenceDiagram
    Donor->>Contract: Send ETH
    Contract->>Recipient: Forward (ETH - Fees)
    Contract->>Contract: Track Fees
    Owner->>Contract: Withdraw Fees

function withdrawFees(address payable _to) external onlyOwner {
    uint256 balance = address(this).balance;
    (bool sent, ) = _to.call{value: balance}("");
    require(sent, "Withdrawal failed");
}


## Contract Address:
0x9E9786F7d57e43C2B44587A96137980a9a3d0803



![WhatsApp Image 2025-03-20 at 3 57 29 PM](https://github.com/user-attachments/assets/bff91375-4ef4-4d37-8dc1-5bab8c576392)
