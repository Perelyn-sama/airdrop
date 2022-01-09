// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract DropToken is ERC20, Ownable,ReentrancyGuard {

    // Array of address for the airdrop
    address[] public whiteList;

    // Amount each participant will receive
    uint airdropAmount = 500 * 10 ** decimals();

    constructor() ERC20("Drop Token", "DROP") {
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // Function to add participants for the airdrop
    function addAirdropParticipant(address participant) public returns(bool success){
        whiteList.push(participant);
        return true;
    }

    // Function to trigger the airdrop
    function startAirdrop() public onlyOwner() nonReentrant() returns(bool success) {
        for(uint i = 0; i < whiteList.length; i++){
            transfer(whiteList[i], airdropAmount);
        }
        return true;
    }
}