//SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

//== LIBRARY IMPORT-------------------------------------- //After npm install @openzeppelin/contracts";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol"; 
/*ERC 721 Library functions include: 
  _mint(), _safeMint(), transferFrom(), safeTransferFrom(), approve()
*/

// -------------NFT CONTRACT----------------------------
contract basicNFT is ERC721 {

    //------------------CONSTRUCTOR--------
    constructor () ERC721("BASIC_NFT","BNFT") {
        // Assigned Token Name- Basic NFT
        // Assigned Token Symbol -- BNFT
    }

    //-----------------STATE VARIABLES--------
    uint256 private token_id = 1; // Start from 1
    uint256 public nft_mintCount; // Tracks minted NFTs

    //------------------FUNCTIONS--------

    //------Mints a new NFT t0 the specified recipient.
    function create_nft(address recipient) public {
        require(recipient != address(0), "Invalid Address");
        token_id++; // Increment the token ID 
        _mint(recipient, token_id); // Mint the NFT
        nft_mintCount++; // Increase the minted NFT count
    }

    //----------Transfer an NFT to another user---------------------------
    function transferNFT(address owner, address recipient, uint256 tokenId) public  payable{
        require(recipient != address(0), "Invalid recipient address");
        require(ownerOf(tokenId) == owner, "Sender does not own this NFT");

        transferFrom(owner, recipient, tokenId); // Transfer NFT ownership
    }
}
