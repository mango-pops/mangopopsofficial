// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title MangoPops Token
/// @notice Community-driven meme token on Base
contract MangoPops is ERC20, Ownable {
    /// @dev Constructor sets token name, symbol, and mints total supply to deployer
    constructor() ERC20("Mango Pops", "POPS") {
        uint256 initialSupply = 10_000_000_000 * 10 ** decimals(); // 10 billion POPS with 18 decimals
        _mint(msg.sender, initialSupply);
    }

    /// @notice Burn function to allow holders to destroy their tokens
    /// @param amount Number of tokens to burn
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    /// @notice Optional owner-only burn (if needed for cleanup or liquidity adjustments)
    /// @param account Address to burn tokens from
    /// @param amount Number of tokens to burn
    function burnFrom(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }
}
