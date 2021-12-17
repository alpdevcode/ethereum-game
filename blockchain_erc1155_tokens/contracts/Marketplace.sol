pragma solidity ^0.5.0;

import "../lib/IERC1155.sol";

contract Marketplace {

    IERC1155 private _token;

    mapping (uint => uint) price;

    constructor(IERC1155 token) public {
        require(address(token) != address(0));
        _token = token;

        // setting default token values
        price[1] = 100000000000000;
        price[2] = 200000000000000;
        price[3] = 300000000000000;
    }
    
    function () external payable {
        buyToken(1);
    }

    function buyToken(uint tokenId) public payable {
        uint paidAmount = msg.value;
        require(paidAmount >= price[tokenId] && price[tokenId] != 0);

        _token.safeTransferFrom(address(this), msg.sender, tokenId, 1, "");
    }

    // a mark of approval that this contract can handle the token being received
    // safeguard against people accidentally sending wrong tokens to a smart contract which cannot be handled by the contract
    // in other words, you can't send tokens that is not supported by the contract
    function onERC1155Received(address _operator, address _from, uint256 _id, uint256 _value, bytes calldata _data) external returns(bytes4){
        return bytes4(keccak256("onERC1155Received(address,address,uint256,uint256,bytes)"));
    }

}