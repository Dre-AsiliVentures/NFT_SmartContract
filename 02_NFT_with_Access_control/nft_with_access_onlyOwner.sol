//SPDX-License-Identifier: MIT
// NFT Contract with onlyOwner Function modifier for Mint Access control
pragma solidity ^0.8.14;

//=======LIBRARY IMPORT=============================
import "@openzeppelin/contracts@4.6.0/token/ERC721/ERC721.sol";
/*ERC 721 Library provides NFT functions: 
  _mint(), _safeMint(), transferFrom(), safeTransferFrom(), approve()
*/
import "@openzeppelin/contracts@4.6.0/access/Ownable.sol"; //For access control
/*Ownable Library provides ownership functions: 
 owner(), transferOwnership(newOwner), renounceOwnership() and onlyOwner modifier
*/

// ===============CONTRACT=============================================
contract myNFT is ERC721, Ownable { 
    //Inheritance from ERC721 and Ownable

    //===============CONSTRUCTOR=======================================
    constructor() ERC721("myNFT", "MNFT"){}

    //================STATE VARIABLES================================
    uint256 tokenId=1;
    uint256 nftSupply;
    
    // ===============FUNCTIONS=========================================

    function mint(address recipient) public onlyOwner { 
        tokenId++; //Increment token id
        _mint(recipient,tokenId); //Mint NFT
        nftSupply++; //Increase Supply
    
    }
}
