//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {ERC404} from "./ERC404simple.sol";
import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";

contract LumxQuack is ERC404 {
    string private _baseURI;

    string private _initURI;
    constructor(
    string memory name,
    string memory symbol,
    string memory initURI) ERC404(name, symbol, 18, 10000, msg.sender) {
        balanceOf[msg.sender] = 10000 * 10 ** 18;//quantidade de tokens que vem para a carteira do owner
        setWhitelist(msg.sender, true);//ele nao tem direito de mint e nem burn de NFTs com intuito de economizar gas
        _initURI = initURI;
    }

    function mint(address to) public {
        _mint(to);
    }

    function tokenURI(uint256 id) public view override returns (string memory result){
      if (bytes(_baseURI).length != 0) {
            result = string(abi.encodePacked(_baseURI, Strings.toString(id)));
      } else {
        result = _initURI;
      }
    }

    function setBaseURI(string calldata baseURI_) public onlyOwner {
        _baseURI = baseURI_;
    }
}