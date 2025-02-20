// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract YDDCoin is ERC20 {
    //给我的代币起一个名字
    string public constant NAME = "YidengERC20Token";
    //给代币一个缩写
    string public constant SYMBOL = "YDD";
    //初始发行量
    uint256 public constant INITIAL_SUPPLY = 10000;

    constructor() ERC20(NAME, SYMBOL) {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function decimals() public view virtual override returns (uint8) {
        return 0;
    }
}
