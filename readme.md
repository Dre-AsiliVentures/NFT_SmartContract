# NFT 🎨 Smart Contract

## Overview 🚀 

This repository contains a smart contract implementation for Non-Fungible Tokens (NFTs) using Solidity. It allows users to mint, transfer, and manage NFTs on the Ethereum blockchain or compatible networks.

![NFTImage](https://github.com/Dre-AsiliVentures/NFT_SmartContract/blob/master/nft.png)

<details>
<summary>

## Features 🌟 
<summary>
- ERC-721  Compliance ✅ : Fully adheres to the ERC-721 standard for NFTs.
- Minting 🎨: Allows users to mint new NFTs.
- Transfer 🔄: Supports safe transfer of NFTs between accounts.
- Metadata 🖼: Supports token metadata URI for external storage of attributes.
- Ownership 🔐 Management: Implements OpenZeppelin's Ownable contract for owner control.
- Tech Stack 🛠: 💻 Solidity: Smart contract language.
- OpenZeppelin Security 🔏: Enhanced contract libraries.
- Hardhat ⚡: Development and testing framework.
- Blockchain L1/2 🌍: Compatible with Ethereum EVM blockchain networks.
</details>
<details>
</summary> 

## Installation 📥
</summary>

### Clone the repository:

git clone https://github.com/Dre-AsiliVentures/NFT_SmartContract.git
cd NFT_SmartContract


### Install dependencies:

npm install hardhat



### Usage ⚡ 

🛠 Compile the Smart Contract

npx hardhat compile

### Deploy the Smart Contract

Configure your environment variables in .env:

PRIVATE_KEY=your_wallet_private_key
INFURA_API_KEY=your_infura_api_key

Deploy to a testnet (e.g., Goerli):

npx hardhat run scripts/deploy.js --network goerli



### Mint an NFT 🎨

Use the contract’s mintNFT function to create a new NFT:

npx hardhat run scripts/mint.js --network goerli

### Testing 🧪 

Run unit tests using Hardhat:

npx hardhat test

</details>

### Smart Contract 📜  Details

Standard: ERC-721

Security: Implements OpenZeppelin security features

License: MIT

### Contributing 🤝 

Feel free to contribute by submitting issues and pull requests.

### License 📜 

This project is licensed under the MIT License. See the LICENSE file for details.

### Contact 📞

For any questions or collaboration, reach out via GitHub.



