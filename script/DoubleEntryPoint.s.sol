// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../src/DoubleEntryPoint.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    DoubleEntryPoint victim;
    CryptoVault vault;
    LegacyToken token;
    Forta forta;

    function setUp() external {
        victim = DoubleEntryPoint(0x0821B6E4AA25E61E5a015A8d8DBBFF7B7B1713E7);
        vault = CryptoVault(victim.cryptoVault());
        token = LegacyToken(victim.delegatedFrom());
        forta = Forta(victim.forta());
    }

    function run() external {
        vm.startBroadcast();

        DetectionBot bot = new DetectionBot();
        forta.setDetectionBot(address(bot));

        vm.stopBroadcast();
    }
}

contract DetectionBot {
    function handleTransaction(address user, bytes calldata msgData) external {
        msg.sender.call(abi.encodeWithSignature("raiseAlert(address)", user));
    }
}