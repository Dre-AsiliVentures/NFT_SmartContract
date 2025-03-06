// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

//== LIBRARY IMPORT-------------------------------------- 
import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol"; 
import "@openzeppelin/contracts/utils/Address.sol"; 

/* ERC721 Library functions:
   - _mint(), _safeMint(), transferFrom(), safeTransferFrom(), approve()
*/

contract BasicNFT is ERC721 {
    using Address for address payable;

    //===============STATE VARIABLES=====================
    uint256 private token_id = 1; // Start from 1
    uint256 public nft_mintCount; // Tracks total minted NFTs

    struct NFTSale {
        uint256 price;    // Sale price in wei
        address seller;   // Owner selling the NFT
    }

    mapping(uint256 => NFTSale) public nftSales; // Track NFTs listed for sale

    //===============CONSTRUCTOR=========================
    constructor() ERC721("BASIC_NFT", "BNFT") {}

    //===============MINT FUNCTION========================
    function create_nft(address recipient) public {
        require(recipient != address(0), "Invalid Address");
        token_id++; // Increment token ID
        _mint(recipient, token_id); // Mint NFT
        nft_mintCount++; // Increase supply
    }

    //===============LIST NFT FOR SALE====================
    function listNFTForSale(uint256 tokenId, uint256 price) public {
        require(ownerOf(tokenId) == msg.sender, "You don't own this NFT");
        require(price > 0, "Price must be greater than zero");

        nftSales[tokenId] = NFTSale(price, msg.sender);
    }

    //===============BUY NFT=============================
    function buyNFT(uint256 tokenId) public payable {
        NFTSale memory sale = nftSales[tokenId];

        require(sale.price > 0, "NFT not for sale");
        require(msg.value >= sale.price, "Insufficient funds");

        address seller = sale.seller;

        // Transfer ownership
        _transfer(seller, msg.sender, tokenId);

        // Pay the seller
        payable(seller).sendValue(sale.price);

        // Remove NFT from sale
        delete nftSales[tokenId];
    }

    //===============CANCEL NFT SALE=====================
    function cancelSale(uint256 tokenId) public {
        require(nftSales[tokenId].seller == msg.sender, "You are not the seller");
        delete nftSales[tokenId];
    }

    //===============DIRECT NFT TRANSFER=================
    function transferNFT(address recipient, uint256 tokenId) public {
        require(recipient != address(0), "Invalid recipient address");
        require(ownerOf(tokenId) == msg.sender, "You don't own this NFT");

        _transfer(msg.sender, recipient, tokenId); // Transfer NFT ownership
    }
}
