// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

// Functionality
// Only contract owner should be able to mint tokens
// Any user can transfer tokens
// Any user can burn tokens


import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";


contract MyToken is ERC20 {
    address public owner;
    constructor() ERC20("MannuBaveja", "ManB") {
        owner = msg.sender;
    }

modifier OnlyOwnerBro {
        require(msg.sender==owner,"You are not authorized to perform this action!");
        _;
}

    function mint(address to, uint256 amount) public OnlyOwnerBro {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
