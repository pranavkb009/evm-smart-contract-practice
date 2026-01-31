# SecureVault – EVM Smart Contract Practice

This repository contains Solidity-based smart contract implementations
focused on security, correctness, and clean design.

## Overview
`SecureVault` is a minimal Ether vault contract that demonstrates:
- Secure access control
- Safe Ether deposits and withdrawals
- Proper use of events
- Checks-Effects-Interactions pattern

## Key Concepts Demonstrated
- Solidity ^0.8.x overflow safety
- Access modifiers
- Secure external calls
- State transparency via view functions

## Security Considerations
- Unauthorized withdrawals are prevented
- Balance checks are enforced
- External calls are made after state effects

## Purpose
This repository is part of my preparation and technical screening work
for EVM smart contract engineering roles.
- `PaymentEscrow.sol`  
  Secure escrow contract demonstrating role separation,
  controlled fund release, and refund logic.
