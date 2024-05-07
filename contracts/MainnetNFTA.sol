// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@dirtroad/sediment/contracts/authority/Authority.sol";
import "erc721a/contracts/ERC721A.sol";
import "@skalenetwork/ima-interfaces/mainnet/DepositBoxes/IDepositBoxERC721.sol";


contract MainnetNFTA is Authority, ERC721A {
        
    IDepositBoxERC721 public depositBox;

    constructor(
        string memory name,
        string memory symbol,
        uint256 quantity
    ) ERC721A(name, symbol) {
        depositBox = IDepositBoxERC721(0x9f8196D864ee9476bF8DBE68aD07cc555d6B7986);
        _mint(address(depositBox), quantity);
    }
    
    function mint(uint256 quantity) external onlyRole(MINTER_ROLE) {
        _mint(address(depositBox), quantity);
    }

     function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721A, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
