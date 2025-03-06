//SPDX-License-Identifier: MIT

pragma solidity ^0.8.14;

//== LIBRARY IMPORT-------------------------------------- //After npm install @openzeppelin/contracts";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
/*ERC 721 Library functions include: 
  _mint(), _safeMint(), transferFrom(), safeTransferFrom(), approve()
*/


// -------------NFT CONTRACT----------------------------
contract basicNFT is ERC721{

    //------------------CONSTRUCTOR--------
    constructor () ERC721("BASIC_NFT","BNFT"){
        // Assigned Token Name- Basic NFT
        // Assigned Token Symbol -- BNFT
    }
    //-----------------STATE VARIABLES--------
    uint256 private token_id = 1; // Start from 1
    uint256 public nft_mintCount; // Tracks minted NFTs
    //------------------FUNCTIONS--------
    function create_nft(address recipient) public{  //recipient is receiver and _id is token id.
        require(recipient != address(0),"Invalid Address");
        token_id++; //increment the token id 
        _mint(recipient,token_id); // Mint the nft
        nft_mintCount++; // Increase the minted nfts
    }
}
