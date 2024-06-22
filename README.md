# Degen Token Project

## Description

Degen token is a custom ERC20 token with token name of "DegenToken" and token symbol of "DGN". Openzepplin contract functionality is import into the contract to enable functionalities like minting of token by the contract owner only, transfer of token by any token holder, burn which allow burning of any amount of token and many other functionalities.

### Installing

The following must be install trying the project development:

- Hardhat: This is install on the CLI using the command npm install --save-dev hardhat
- Openzepplin Contract: This is install by running the command npm install @openzepplin/contracts
- DotEnv: install dotenv using the command npm install dotenv and create the file with the name .env, where environment/hidden variable will be stored.

* How/where to download your program
  Can be downloaded by cloning the [https url] from this github page by clicking on the green button with text "code", after which it will be clone locally with the command git clone [https url]. It can also be done by downloading the zip file locally.
* Any modifications needed to be made to files/folders

### Executing program

- Run the command "npx hardhat compile" to compile the solidity contract
- Run "npx hardhat node" to fetch the hardhat account
- Then run the deploy script using the command "npx hardhat run scripts/deploy.js --network localhost"

## Help

Any advise for common problems or issues.

```
command to run if program contains helper info
```

## Authors

Sikiru Yaya (skycode)
