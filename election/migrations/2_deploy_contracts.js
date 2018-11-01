// We number our files so Truffle knows which order to execute them
var Election = artifacts.require("./Election.sol");

// then do "truffle migrate" to migrate it to local blockchain
// truffle console -> "Election.deployed().then(function(instance) { app = instance })"
// It gets the deployed instance of Election contract and assigns it to app inside Promise's callback function
// -> "app.candidate()"
module.exports = function(deployer) {
  // Add it to the manifest of deployed contracts to ensure it gets deployed when we run the migrations
  deployer.deploy(Election);
};
