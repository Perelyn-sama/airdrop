// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DropToken is ERC20 {
    constructor() ERC20("Drop Token", "DROP") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    address[] public whiteList;

    function addAirdropParticipant(address participant) public returns(bool success){
        
    }
}