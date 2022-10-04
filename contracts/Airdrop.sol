// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface interfaceBankAI {
    function transfer (address _to, uint256 _amount) external;
    function balanceOf(address account) external returns (uint256);
}


contract AirDrop {
    address public owner;
    interfaceBankAI public bankai;
    constructor ()
    {
        owner=msg.sender;
        bankai = interfaceBankAI(0xCDD5A50aa8f7AFFBD1E442D3681Fb06f5226B515);
    }

    modifier onlyOwner {
        require (owner==msg.sender, "So o dono pode executar isso.");
        _;
    }
    
    function sendAirDrop (address _to, uint256 _amount) public onlyOwner
    {
        bankai.transfer(_to, _amount);
    }
}