// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BankAI is ERC20, Ownable {
    constructor() ERC20("BankAI", "BKI") {
        _mint(msg.sender, 200000000 * 10 ** decimals());
    }
address public endCrowdSale;
address public endAirDrop;

function setCrowdSale (address crowdSale) public
{
    endCrowdSale = crowdSale;

}

function setAirDrop (address airDrop) public
{
    endAirDrop = airDrop;

}

 function bankaiStartICO () public onlyOwner {
     transfer(endCrowdSale, 100000000 * 10 ** decimals());
     transfer(endAirDrop, 100000000 * 10 ** decimals());
}
}