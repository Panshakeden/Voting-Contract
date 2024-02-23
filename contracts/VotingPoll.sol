//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract VotingPoll {

     address public owner;

    struct Candidate {
        string name;
        uint256 voteCount;
    }

    struct Voter {
        bool hasVoted;
        uint256 votedCandidateIndex;
    }

    Candidate[] public candidates;

    mapping(address => Voter) public voters;

  
    function onlyOwner()private view {
        require(msg.sender == owner, "Only the owner can perform this action");
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string memory _name,uint256 _voteCount) public{
        onlyOwner();
        
        candidates.push(Candidate({
            name:_name,
            voteCount:_voteCount
        }));
       
    }

    function vote(uint256 candidateId) public {
    
        require(!voters[msg.sender].hasVoted, "You have already voted");

        require(candidateId < candidates.length, "Invalid candidate id");

        candidates[candidateId].voteCount++;

        voters[msg.sender].hasVoted = true;
        voters[msg.sender].votedCandidateIndex = candidateId;
    }

    function getCandidateCount() public view returns (uint256) {
        return candidates.length;
    }

    function getCandidate(uint256 candidateId) public view returns (string memory, uint256) {
        require(candidateId < candidates.length, "Invalid candidate id");
        return (candidates[candidateId].name, candidates[candidateId].voteCount);
    }

    function getAllCandidates() external view returns (Candidate[] memory) {
        return candidates;
    }
   
}


     

  