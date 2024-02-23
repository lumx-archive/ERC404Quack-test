// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import { LumxQuack } from "../src/LumxQuack.sol";
import { Script, console } from "forge-std/Script.sol";
import { HelperConfig } from "./HelperConfig.s.sol";

import { HelperConfig } from "../../script/HelperConfig.s.sol";

//simple deploy ERC404
contract DeploySimpleERC404 is Script {
 LumxQuack public nftLumx;

 HelperConfig public config;

function run() public {
    config = new HelperConfig();
    uint256 key = config.activeNetworkConfig();

    vm.startBroadcast(vm.rememberKey(key));

    nftLumx = new LumxQuack(
        "QuackLumxERC404",
        "LMX404",
        "https://ipfs.io/ipfs/bafkreicmovbocngbid4jnsofvxvqpiq5jag6qbwnkgkvgnpmpmimt7t3em");
    
    nftLumx.transfer(0x5bb7dd6a6eb4a440d6C70e1165243190295e290B,1* 10 ** 18);

    vm.stopBroadcast();
    console.log("Nft Lumx:", address(nftLumx));
}
}
