var GameToken2 = artifacts.require("./GameToken2.sol");
var Marketplace = artifacts.require("./Marketplace.sol");

module.exports = function(deployer) {
  deployer.deploy(Marketplace, GameToken2.address);
};
