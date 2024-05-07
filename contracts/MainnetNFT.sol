// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@dirtroad/sediment/contracts/authority/Authority.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@skalenetwork/ima-interfaces/mainnet/DepositBoxes/IDepositBoxERC721.sol";


contract MainnetNFT is Authority, ERC721 {
        
    IDepositBoxERC721 public depositBox;

    constructor(
        string memory name,
        string memory symbol,
        uint256[] memory tokenIds
    ) ERC721(name, symbol) {
        depositBox = IDepositBoxERC721(0x9f8196D864ee9476bF8DBE68aD07cc555d6B7986);
        _mintTokenIds(tokenIds);
    }
    
    function mint(uint256[] memory tokenIds) external onlyRole(MINTER_ROLE) {
        _mintTokenIds(tokenIds);
    }

    function _mintTokenIds(uint256[] memory tokenIds) internal {
        for (uint256 i = 0; i < tokenIds.length;) {
   
            _safeMint(address(depositBox), tokenIds[i]);

            unchecked {
                i++;
            }
        }
    }

     function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
