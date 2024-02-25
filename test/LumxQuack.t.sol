// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { Test, console } from "forge-std/Test.sol";
import { StdCheats } from "forge-std/StdCheats.sol";

import { LumxQuack } from "../../src/LumxQuack.sol";

import { HelperConfig } from "../../script/HelperConfig.s.sol";

contract LumxERC404 is StdCheats, Test {
    LumxQuack public nftLumx;

    //HelperConfig public config;

    address owner = makeAddr("owner");
    address user = makeAddr("user");

    function setUp() public {
        //config = new HelperConfig();
        //uint256 key = config.activeNetworkConfig();

        vm.startBroadcast(owner);

        nftLumx = new LumxQuack("QuackLumxERC404", "LMX404", "testUri");

        vm.stopBroadcast();
        console.log("Nft Lumx:", address(nftLumx));
    }

    // function testMint() external {
    //     vm.startPrank(owner);
    //     nftLumx.mint(user);
    //     address OwnerID1 = nftLumx.ownerOf(1);
    //     uint256 saldoB = nftLumx.balanceOf(user);
    //     console.log("SaldoB", saldoB);
    //     console.log("OwnerID-1", OwnerID1);
    //     vm.stopPrank();
    // }

    function testTranferAndBalance() external {
        vm.startPrank(owner);
        //nftLumx.setWhitelist(user, true); se colocarmos o endereco na whitelist ele nao recebe seus NFTs na hora da transferencia
        nftLumx.transfer(user, 10000000000000000000); //tranferindo 10 tokens
        // uint256 saldoB = nftLumx.balanceOf(user);
        // console.log("SaldoB", saldoB); //saldo atualizado
        //address OwnerID1 = nftLumx.ownerOf(10);
        // ele vai ser o owner do id 1 ao 10, ou seja, a cada 1 token completo 1 NFT
        //console.log("OwnerID-1", OwnerID1);
        vm.stopPrank();

        vm.startPrank(user);
        nftLumx.transfer(owner, 10000000000000000000);
        // uint256 saldoB2 = nftLumx.balanceOf(user);
        // console.log("SaldoB", saldoB2); //saldo atualizado

        // vm.expectRevert(0xc5723b51);
        // nftLumx.ownerOf(10);

        vm.stopPrank();
    }

    // function testURI() external {
    //     vm.startPrank(owner);
    //     nftLumx.transfer(user, 5);
    //     string memory tokenURI = nftLumx.tokenURI(10);
    //     console.log("tokenUri is init:", tokenURI);
    //     vm.stopPrank();
    // }

    // function testbaseURI() external {
    //     vm.startPrank(owner);
    //     nftLumx.mint(user);
    //     nftLumx.setBaseURI("baseURI/");
    //     string memory tokenURI = nftLumx.tokenURI(1);
    //     console.log("tokenUri is init:", tokenURI);
    //     vm.stopPrank();
    // }
}
