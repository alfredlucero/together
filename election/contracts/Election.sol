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

    // Store accounts that have voted
    mapping(address => bool) public voters;

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

    function vote(uint _candidateId) public {
        // require that they haven't voted before
        // require statements will stop execution if the conditions are not met
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that the voter has voted
        // msg.sender is global variable provider by Solidity
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount++;
    }
}
