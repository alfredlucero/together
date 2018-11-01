var Election = artifacts.require("./Election.sol");

// Mocha and Chai built into Truffle framework
// Should test your smart contracts because 1. all of the code on Ethereum is immutable
// and if there are bugs, the old one must be disabled and deploy a new copy with a new address
// 2. deploying contracts cost gas to create a transaction and write to the blockchain
// 3. if there are bugs, account calling this function could potentially waste Ether and not behave as expected
// accounts represents all accounts in Ganache blockchain
// `truffle migrate --reset` to redeploy
// `truffle test` to run these tests
contract("Election", function(accounts) {
  var electionInstance;

  it("initializes with two candidates", function() {
    return Election.deployed()
      .then(function(instance) {
        return instance.candidatesCount();
      })
      .then(function(count) {
        assert.equal(count, 2);
      });
  });

  it("initializes the candidates with the correct values", function() {
    return Election.deployed()
      .then(function(instance) {
        electionInstance = instance;
        return electionInstance.candidates(1);
      })
      .then(function(candidate) {
        assert.equal(candidate[0], 1, "contains the correct ID");
        assert.equal(candidate[1], "Obama", "contains the correct name");
        assert.equal(candidate[2], 0, "contains the correct vote counts");
        return electionInstance.candidates(2);
      })
      .then(function(candidate) {
        assert.equal(candidate[0], 2, "contains the correct ID");
        assert.equal(candidate[1], "Romney", "contains the correct name");
        assert.equal(candidate[2], 0, "contains the correct vote counts");
      });
  });
});
