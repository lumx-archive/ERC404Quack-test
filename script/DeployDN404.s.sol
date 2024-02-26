// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { SimpleDN404 } from "../src/DN404.sol";
import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";

import { HelperConfig } from "../../script/HelperConfig.s.sol";

//simple deploy ERC404
contract Deploy is Script {
 SimpleDN404 public nftLumx;

 HelperConfig public config;

function run() public {
    config = new HelperConfig();
    uint256 key = config.activeNetworkConfig();

    vm.startBroadcast(vm.rememberKey(key));

    nftLumx = new SimpleDN404();

    vm.stopBroadcast();
    console.log("Nft Lumx DN404:", address(nftLumx));
}
}
