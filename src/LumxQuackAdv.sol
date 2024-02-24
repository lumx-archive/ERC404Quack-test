//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Strings} from "@openzeppelin/contracts/utils/Strings.sol";
import {ERC404} from "./ERC404advanced.sol";

contract LumxQuackAdv is ERC404 {
  constructor(string memory name, string memory symbol) ERC404(name, symbol, 18) {
    _setERC721TransferExempt(msg.sender, true);
    _mintERC20(msg.sender, 10000 * units);
  }

  function tokenURI(uint256 id_) public pure override returns (string memory) {
    return string.concat("uri/", Strings.toString(id_));
  }

}