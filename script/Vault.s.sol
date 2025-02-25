// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";

contract Solve is Script {
    function run() external {
        address victim = 0x9762560603609168Be54BD6e85BD13b35DE89FE9;
        bytes32 slot = bytes32(uint256(1));
        
        bytes32 data = vm.load(victim, slot);
        console.logBytes32(data);
    }
}