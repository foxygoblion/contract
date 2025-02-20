const YDDCoin = artifacts.require("YDDCoin");
const YDDShow = artifacts.require("YDDShow");

module.exports = function(deployer) {
  deployer.deploy(YDDCoin);
  deployer.deploy(YDDShow);
}; 