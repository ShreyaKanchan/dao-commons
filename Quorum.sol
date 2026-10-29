// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
library Quorum { function reached(uint256 participation, uint256 electorate, uint256 basisPoints) internal pure returns (bool) { return electorate > 0 && participation * 10_000 >= electorate * basisPoints; } }
