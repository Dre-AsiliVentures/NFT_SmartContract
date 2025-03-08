// SPDX-License-Identifier: MIT
// 📌Basic NFT Resale with Transfer 📌 Code to resale and transfer NFTs
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

    event NFTCreated(uint256 indexed tokenId, address indexed owner, uint256 price);
    event NFTResold(uint256 indexed tokenId, address indexed oldOwner, address indexed newOwner, uint256 price);

    constructor() ERC721("BASIC_NFT", "BNFT") {}

    function create_nft(uint256 price) public {
        require(msg.sender != address(0), "Invalid Address");

        uint256 newTokenId = token_id; // Store the tokenId before incrementing
        _mint(msg.sender, newTokenId);
        nft_mintCount++;

        // Transfer NFT to contract
        safeTransferFrom(msg.sender, address(this), newTokenId);
        nftSales[newTokenId] = NFTSale(price, msg.sender);
        
        emit NFTCreated(newTokenId, msg.sender, price);
        
        token_id++; // Increment after minting
    }

    function reSellNFT(uint256 tokenId) public payable {
        NFTSale memory sale = nftSales[tokenId];

        require(sale.owner != address(0), "NFT not for sale");
        require(msg.value >= sale.price, "Insufficient payment");

        // Transfer payment to the seller
        payable(sale.owner).transfer(sale.price);

        // Transfer NFT to the buyer
        safeTransferFrom(address(this), msg.sender, tokenId);

        // Remove listing
        delete nftSales[tokenId];

        nft_salesCount++;

        emit NFTResold(tokenId, sale.owner, msg.sender, sale.price);
    }
}
