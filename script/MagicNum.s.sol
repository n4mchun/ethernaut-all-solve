// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/MagicNum.sol";

contract Solve {
    function run() external {
        MagicNum victim = MagicNum(0x04dD37310D3263C77de5DB57d1E10c5D12d44E84);

        bytes memory bytecode = hex"600a600c600039600a6000F3602a60205260206020F3";
        address contractAddr;
        assembly {
            contractAddr := create(0, add(bytecode, 0x20), mload(bytecode))
            switch iszero(contractAddr)
            case 1 { revert(0, 0) }
        }
        
        victim.setSolver(contractAddr);
    }
}