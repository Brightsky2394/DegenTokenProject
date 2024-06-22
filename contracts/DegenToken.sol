// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    // Declaration of account owner
    address public owner;

    // Struct to represent store items
    struct StoreItem {
        string name;
        uint256 price;
    }

    // Array to store the items available in the in-game store
    StoreItem[] public storeItems;

    // Mapping from item name to index in the storeItems array
    mapping(string => uint256) private itemIndex;

    // Event for redeeming tokens for items
    event Redeemed(address indexed player, string item, uint256 amount);

    // Constructor to initialize the token with a name and symbol
    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    // Modifier to restrict access to owner only functions
    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function"
        );
        _;
    }

    // Function to mint new tokens, restricted to the contract owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to add a new item to the in-game store
    function addStoreItem(
        string memory itemName,
        uint256 itemPrice
    ) public onlyOwner {
        storeItems.push(StoreItem({name: itemName, price: itemPrice}));
        itemIndex[itemName] = storeItems.length - 1;
    }

    // Function to update an existing item in the in-game store
    function updateStoreItem(
        string memory itemName,
        uint256 itemPrice
    ) public onlyOwner {
        uint256 index = itemIndex[itemName];
        require(index < storeItems.length, "Item does not exist");
        storeItems[index] = StoreItem({name: itemName, price: itemPrice});
    }

    // Function to redeem tokens for items in the in-game store
    function redeem(string memory itemName) public {
        uint256 index = itemIndex[itemName];
        require(index < storeItems.length, "Item does not exist");

        uint256 itemPrice = storeItems[index].price;
        require(
            balanceOf(msg.sender) >= itemPrice,
            "Insufficient amount of tokens"
        );

        _burn(msg.sender, itemPrice);
        emit Redeemed(msg.sender, storeItems[index].name, itemPrice);
    }

    // Function to burn tokens, can be called by any token holder
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to check token balance (this is already available in ERC20 as `balanceOf`)
    function checkBalance(address account) public view returns (uint256) {
        return balanceOf(account);
    }

    // Function to transfer tokens
    function transferTokens(address recipient, uint256 amount) public {
        require(
            address(0) != recipient,
            "Account with index 0 cannot transfer token"
        );
        require(balanceOf(recipient) >= amount, "Insufficient amount of token");
        approve(recipient, amount);
        _transfer(msg.sender, recipient, amount);
    }

    // Function to get the list of store items
    function getStoreItems() public view returns (StoreItem[] memory) {
        return storeItems;
    }
}
