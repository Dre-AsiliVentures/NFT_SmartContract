// SPDX-License-Identifier: MIT
// 📌Basic NFT with Transfer 📌 Code to sell and transfer NFTs

pragma solidity ^0.8.14;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol"; 
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol"; 
import "@openzeppelin/contracts/utils/Address.sol";

contract BasicNFT is ERC721 {
    using Address for address payable;

    uint256 private token_id = 1; 
    uint256 public nft_mintCount; 
    uint256 public nft_salesCount; 

    struct NFTSale {
        uint256 price;    
        address owner;   
    }

    mapping(uint256 => NFTSale) public nftSales; 

    constructor() ERC721("BASIC_NFT", "BNFT") {}

    function create_nft(address recipient) public {
        require(recipient != address(0), "Invalid Address");
        _mint(recipient, token_id); // Mint NFT
        token_id++; // Increment after minting
        nft_mintCount++;
    }

    function listNFTForSale(uint256 tokenId, uint256 price) public {
        require(ownerOf(tokenId) == msg.sender, "You don't own this NFT");
        require(price > 0, "Price must be greater than zero");

        _transfer(msg.sender, address(this), tokenId);
        nftSales[tokenId] = NFTSale(price, msg.sender);
    }

    function buyNFT(uint256 tokenId) public payable {
        NFTSale memory sale = nftSales[tokenId];

        require(sale.price > 0, "NFT not for sale");
        require(msg.value >= sale.price, "Insufficient funds");
        require(ownerOf(tokenId) == address(this), "NFT not listed for sale");

        // Pay the seller
        payable(sale.owner).transfer(sale.price);

        // Transfer ownership
        _safeTransfer(address(this), msg.sender, tokenId, "");

        delete nftSales[tokenId];

        nft_salesCount++;
    }
}

