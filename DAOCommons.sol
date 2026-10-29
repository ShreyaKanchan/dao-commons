// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract DAOCommons {
    struct Proposal { address target; bytes data; uint256 yes; uint256 no; uint64 end; bool executed; }
    mapping(address => uint256) public votingPower; mapping(uint256 => Proposal) public proposals; mapping(uint256 => mapping(address => bool)) public voted; uint256 public nextId; uint64 public constant PERIOD = 3 days;
    function setVotingPower(address voter, uint256 power) external { votingPower[voter] = power; } // demo-only adminless setup
    function propose(address target, bytes calldata data) external returns (uint256 id) { require(votingPower[msg.sender] > 0, "no power"); id = nextId++; proposals[id] = Proposal(target, data, 0, 0, uint64(block.timestamp) + PERIOD, false); }
    function vote(uint256 id, bool support) external { Proposal storage p = proposals[id]; require(block.timestamp < p.end && !voted[id][msg.sender] && votingPower[msg.sender] > 0, "closed"); voted[id][msg.sender] = true; if (support) p.yes += votingPower[msg.sender]; else p.no += votingPower[msg.sender]; }
    function execute(uint256 id) external { Proposal storage p = proposals[id]; require(block.timestamp >= p.end && p.yes > p.no && !p.executed, "not passed"); p.executed = true; (bool ok,) = p.target.call(p.data); require(ok, "call failed"); }
}
