// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./VotingPoll.sol";

contract MultiSigFactory {
    VotingPoll[] votingClones;

    function createNewVoting() external returns (VotingPoll newVoting_, uint256 length_) {
        newVoting_ = new VotingPoll();

        votingClones.push(newVoting_);

        length_ = votingClones.length;
    }

    function getNewVoting() external view returns(VotingPoll[] memory) {
        return votingClones;
    }
}