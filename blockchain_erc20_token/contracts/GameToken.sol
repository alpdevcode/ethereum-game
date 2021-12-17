pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract GameToken is ERC20 {

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) public {}

    function mint(address to, uint256 amount) public virtual {
        _mint(to, amount);
    }
}