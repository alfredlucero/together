pragma solidity 0.4.24;

contract Election {
    // Model a Candidate
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Read/Write Candidates
    // Mapping id to a Candidate like object lookup to the candidates state variable
    // No way to determine size of mapping cause any key not assigned a value defaults to empty Candidate
    mapping(uint => Candidate) public candidates;

    // Store Candidates Count
    uint public candidatesCount;
        
    constructor() public {
        addCandidate("Obama");
        addCandidate("Romney");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
