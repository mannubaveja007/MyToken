// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

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

// Please explicitly add the transfer function in your code


    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    function mint(address to, uint256 amount) public OnlyOwnerBro {
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
