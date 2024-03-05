// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Counter} from "../src/Counter.sol";

contract Deploy is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);
        console.log(address(new Counter()));
    }
}

contract CounterScript is Script {
    function setUp() public {}

    function run() public {
        address sender = 0x5b73C5498c1E3b4dbA84de0F1833c4a029d90519;
        require(sender.code.length > 0, "Sender must be a contract");
        vm.startBroadcast(sender);
        require(1 == vm.getNonce(sender), "Nonce should be 1");
        Counter ct = new Counter();
        require(2 == vm.getNonce(sender), "Nonce should be 2 pre-call");
        ct.increment();
        require(2 == vm.getNonce(sender), "Nonce should be 2 post-call");
    }
}
