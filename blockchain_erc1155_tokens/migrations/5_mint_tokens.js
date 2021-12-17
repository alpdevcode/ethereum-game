var GameToken2 = artifacts.require("./GameToken2.sol");
var Marketplace = artifacts.require("./Marketplace.sol");

module.exports = async function(deployer) {
  let token = await GameToken2.deployed();
  let market = await Marketplace.deployed();

  // Mint tokens and transfer to the Marketplace
  await token.mint(1, [market.address], [30]);
  await token.mint(2, [market.address], [20]);
  await token.mint(3, [market.address], [10]);
};
