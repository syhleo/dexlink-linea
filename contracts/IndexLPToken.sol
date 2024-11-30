// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
0x111F608A01119707Dc70032B7738Af8B5131E949
LP Token for Index
LP代币
 */
contract IndexLPToken is ERC20, Ownable {
    constructor(address indexOwnerContract)
        ERC20("Index LP Token", "ILP")
        Ownable(indexOwnerContract)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address account, uint256 value) public onlyOwner {
        _burn(account, value);
    }

    function burn(uint256 amount) public onlyOwner {
        _burn(msg.sender, amount);
    }
}