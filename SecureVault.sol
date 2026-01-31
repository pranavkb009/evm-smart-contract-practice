// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title SecureVault
 * @author Pranav
 * @notice A minimal and secure Ether vault demonstrating
 *         best practices for access control and safe withdrawals.
 */
contract SecureVault {
    address public owner;

    event Deposited(address indexed sender, uint256 amount);
    event Withdrawn(address indexed receiver, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /**
     * @notice Deposit Ether into the vault
     */
    function deposit() external payable {
        require(msg.value > 0, "Zero value not allowed");
        emit Deposited(msg.sender, msg.value);
    }

    /**
     * @notice Withdraw Ether from the vault
     * @param amount Amount of Ether to withdraw
     */
    function withdraw(uint256 amount) external onlyOwner {
        require(amount <= address(this).balance, "Insufficient balance");

        // Effects
        emit Withdrawn(owner, amount);

        // Interaction
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Transfer failed");
    }

    /**
     * @notice Get vault balance
     */
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
