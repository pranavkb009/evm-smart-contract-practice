// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title AccessControlExample
 * @author Pranav
 * @notice Demonstrates role-based access control
 */
contract AccessControlExample {
    address public admin;

    mapping(address => bool) public approvedUsers;

    event UserApproved(address indexed user);
    event UserRevoked(address indexed user);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Admin only");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function approveUser(address user) external onlyAdmin {
        require(user != address(0), "Invalid address");
        approvedUsers[user] = true;
        emit UserApproved(user);
    }

    function revokeUser(address user) external onlyAdmin {
        approvedUsers[user] = false;
        emit UserRevoked(user);
    }

    function isApproved(address user) external view returns (bool) {
        return approvedUsers[user];
    }
}
