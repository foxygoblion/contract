// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YDDCoin is ERC20 {
    // Token parameters
    uint256 public constant INITIAL_SUPPLY = 10000 * 10**18; // 10000 tokens with 18 decimals
    uint256 public constant TOKEN_PRICE = 0.0001 ether; // 0.0001 ETH per token

    constructor() ERC20("YDDCoin", "YDD") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    // Function to buy tokens
    function buyTokens() public payable {
        require(msg.value > 0, "Must send ETH to buy tokens");
        uint256 tokenAmount = (msg.value * 1 ether) / TOKEN_PRICE;
        require(balanceOf(address(this)) >= tokenAmount, "Not enough tokens available");
        _transfer(address(this), msg.sender, tokenAmount);
    }

    // Function to withdraw ETH (only owner)
    function withdrawETH() public {
        require(msg.sender == owner(), "Only owner can withdraw");
        payable(msg.sender).transfer(address(this).balance);
    }

    // Function to get owner
    function owner() public view returns (address) {
        return msg.sender;
    }
} 