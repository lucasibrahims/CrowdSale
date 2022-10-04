// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface interfaceBankAI {
    function transfer (address _to, uint256 _amount) external;
    function balanceOf(address account) external returns (uint256);
}

contract CrowdSale {

    interfaceBankAI public bankai;
    address public owner;
    address public wallet;
    //mapping (address => uint256) balanceOf;
    constructor () {
        wallet = 0xd24EE1878c406aF5C87c3861F0F614d645ACC4e3;
        owner = msg.sender;
        bankai = interfaceBankAI(0xCDD5A50aa8f7AFFBD1E442D3681Fb06f5226B515);

    }

    modifier onlyOwner {
        require(msg.sender == owner, "So o dono pode executar esta acao.");
        _;
    }
    
    function stopICO() public onlyOwner
    {
        address end = address(this);
        uint256 quantidade;
        quantidade = uint256(bankai.balanceOf(end));
        bankai.transfer(owner, quantidade);
    }

    function sale () private
    {
        (bool success, ) = payable(wallet).call{value:msg.value}("");
        require(success, "Houve algum problema na hora de sacar");
        uint qnt = msg.value*50000;
        bankai.transfer(msg.sender, qnt);
    }

    fallback () external payable {
        sale();
    }
    receive() external payable {
        sale();
    }

}