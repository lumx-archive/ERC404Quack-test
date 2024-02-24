// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Test, console } from "forge-std/Test.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

import { SimpleDN404 } from "../../src/DN404.sol";

import { HelperConfig } from "../../script/HelperConfig.s.sol";

contract LumxERC404 is StdCheats, Test {
    SimpleDN404 public nftLumx;

    //HelperConfig public config;

    address owner = makeAddr("owner");
    address user = makeAddr("user");

    function setUp() public {
        //config = new HelperConfig();
        //uint256 key = config.activeNetworkConfig();

        vm.startBroadcast(owner);

        nftLumx = new SimpleDN404("QuackLumxERC404", "quack", 10000 * 10 ** 18, address(owner));

        vm.stopBroadcast();
        console.log("Nft Lumx:", address(nftLumx));
    }

    function testMint() external {
        vm.startPrank(owner);
        nftLumx.mint(user,1000);
        uint256 saldoB = nftLumx.balanceOf(user);
        console.log("SaldoB", saldoB);
        vm.stopPrank();
    }

    function testTranferAndBalance() external {
        vm.startPrank(owner);
        nftLumx.transfer(user, 10000000000000000000); //tranferindo 10 tokens
        uint256 saldoB = nftLumx.balanceOf(user);
        console.log("SaldoB", saldoB); //saldo atualizado
        vm.stopPrank();

        vm.startPrank(user);
        nftLumx.transfer(owner, 10000000000000000000);
        uint256 saldoB2 = nftLumx.balanceOf(owner);
        console.log("SaldoB", saldoB2); //saldo atualizado
        vm.stopPrank();
    }

    function testURI() external {
        vm.startPrank(owner);
        nftLumx.transfer(user, 5);
        string memory tokenURI = nftLumx.tokenURI(10);
        console.log("tokenUri is init:", tokenURI);
        vm.stopPrank();
    }

    function testbaseURI() external {
        vm.startPrank(owner);
        nftLumx.mint(user,100);
        nftLumx.setBaseURI("baseURI/");
        string memory tokenURI = nftLumx.tokenURI(1);
        console.log("tokenUri is init:", tokenURI);
        vm.stopPrank();
    }
}
