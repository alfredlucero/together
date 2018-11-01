// Declare Solidity version here
pragma solidity 0.4.24;

// Declare smart contracts like this
// We'll need to migrate or deploy this to the blockchain
contract Election {
    // Read/write candidate
    // State variables allow us to write data to the blockchain
    // Since it's public, it provides us a getter function to access this outside of contract
    string public candidate;

    // Setting the candidate value that will be stored on blockchain
    constructor() public {
        candidate = "Obama";
    }
}
