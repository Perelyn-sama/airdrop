// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DropToken is ERC20, Ownable {
    constructor() ERC20("Drop Token", "DROP") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // Array of address for the airdrop
    address[] public whiteList;

    // Amount each participant will receive 
    uint airdropAmount = 5000 * 10 ** decimals();

    // Function to add participants for the airdrop
    function addAirdropParticipant(address participant) public returns(bool success){
        whiteList.push(participant);
        return true;
    }

    // Function to trigger the airdrop
    function airdrop() public onlyOwner() returns(bool success) {
        for(uint i = 0; i < whiteList.length; i++){
            transfer(whiteList[i], airdropAmount);
        }
        return true;
    }
}