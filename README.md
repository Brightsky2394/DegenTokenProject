# DegenToken Smart Contract

A smart contract for an ERC20 token called DegenToken, including functionality for an in-game store where tokens can be redeemed for items.

## Description

DegenToken is an ERC20 token that can be minted by the contract owner and includes an in-game store where players can redeem their tokens for items. The contract allows the owner to add and update store items, and users can redeem their tokens for these items, as well as transfer tokens to others.

## Getting Started

### Installing

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/degentoken.git
   cd degentoken
   ```
2. Install dependencies:
   use the command - npm install

## Executing program

1. Compile the smart contract:
   use the command - npx hardhat compile
2. Deploy the smart contract:
   use the command - npx hardhat run scripts/deploy.js --network <network_name>
3. Interact with the contract:

- Use a tool like Hardhat console or a frontend interface to interact with the contract.

### Example Commands

- Mint tokens:
  await degenToken.mint("0xYourAddress", 1000);
- Add store item:
  await degenToken.addStoreItem("Sword", 100);
- Update store item:
  await degenToken.updateStoreItem("Sword", 150);
- Redeem tokens for an item:
  await degenToken.redeem("Sword");

## Help

### Common Issues

- MetaMask not installed:
  - Ensure MetaMask is installed and enabled in your browser.
- Contract not deployed:
  - Verify the contract address and network configuration in your deployment script.
- Insufficient funds for gas:
  - Ensure your MetaMask wallet has enough ETH to cover transaction fees.

## Commands

- To compile the contract:
  use the command - npx hardhat compile
- To deploy the contract:
  use the command - npx hardhat run scripts/deploy.js --network <network_name>
- To start the frontend application:
  use the command - npm run dev

## Authors

Sikiru Yaya (Skycode)

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.

### Explanation:

- **Project Title**: Set as "DegenToken Smart Contract".
- **Description**: Provides a detailed overview of the project's purpose and functionality.
- **Getting Started**:
  - **Installing**: Instructions to clone the repository and install dependencies.
  - **Executing program**: Steps to compile and deploy the smart contract.
  - **Example Commands**: Shows example commands to interact with the contract.
- **Help**: Addresses common issues users might face and provides commands for common tasks.
- **Authors**: Lists Sikiru Yaya (Skycode) with a Twitter handle.
- **License**: Mentions that the project is licensed under the MIT License.

Feel free to adjust the details and commands according to your actual project setup and deployment process.
