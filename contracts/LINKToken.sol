// SPDX-License-Identifier: GPL-3.0
pragma solidity =0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LINKToken is ERC20 {
    constructor() ERC20("Link Token", "LINK") {
        _mint(msg.sender, 10000000000000000000000000);
    }
}
