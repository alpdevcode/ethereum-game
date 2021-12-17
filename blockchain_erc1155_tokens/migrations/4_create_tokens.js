var GameToken2 = artifacts.require("./GameToken2.sol");
var Marketplace = artifacts.require("./Marketplace.sol");

module.exports = async function(deployer) {
  let token = await GameToken2.deployed();
  let market = await Marketplace.deployed();

  // Creating 3 token for 3 items
  await token.create(0, "");
  await token.create(0, "");
  await token.create(0, "");

};
