var DropToken = artifacts.require("./DropToken.sol");

module.exports = function (deployer) {
  deployer.deploy(DropToken);
};
