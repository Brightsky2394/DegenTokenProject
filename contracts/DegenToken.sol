// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DegenToken is ERC20 {
    address public owner;

    struct StoreItem {
        string name;
        uint256 price;
    }

    struct InventoryItem {
        string name;
        uint256 quantity;
    }

    StoreItem[] public storeItems;
    mapping(string => uint256) private itemIndex;
    mapping(address => InventoryItem[]) private playerInventory;

    event Redeemed(address indexed player, string item, uint256 amount);
    event Minted(address indexed to, uint256 amount);
    event Burned(address indexed from, uint256 amount);

    constructor() ERC20("Degen", "DGN") {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == owner,
            "Only the contract owner can call this function"
        );
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        emit Minted(to, amount);
    }

    function addStoreItem(
        string memory itemName,
        uint256 itemPrice
    ) public onlyOwner {
        storeItems.push(StoreItem({name: itemName, price: itemPrice}));
        itemIndex[itemName] = storeItems.length - 1;
    }

    function updateStoreItem(
        string memory itemName,
        uint256 itemPrice
    ) public onlyOwner {
        uint256 index = itemIndex[itemName];
        require(index < storeItems.length, "Item does not exist");
        storeItems[index] = StoreItem({name: itemName, price: itemPrice});
    }

    function redeem(string memory itemName) public {
        uint256 index = itemIndex[itemName];
        require(index < storeItems.length, "Item does not exist");

        uint256 itemPrice = storeItems[index].price;
        require(
            balanceOf(msg.sender) >= itemPrice,
            "Insufficient amount of tokens"
        );

        _burn(msg.sender, itemPrice);
        addToInventory(msg.sender, itemName);
        emit Redeemed(msg.sender, itemName, itemPrice);
    }

    function addToInventory(address player, string memory itemName) internal {
        InventoryItem[] storage inventory = playerInventory[player];
        bool itemExists = false;

        for (uint256 i = 0; i < inventory.length; i++) {
            if (
                keccak256(abi.encodePacked(inventory[i].name)) ==
                keccak256(abi.encodePacked(itemName))
            ) {
                inventory[i].quantity++;
                itemExists = true;
                break;
            }
        }

        if (!itemExists) {
            inventory.push(InventoryItem({name: itemName, quantity: 1}));
        }
    }

    function getInventory(
        address player
    ) public view returns (InventoryItem[] memory) {
        return playerInventory[player];
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
        emit Burned(msg.sender, amount);
    }

    function transferTokens(address recipient, uint256 amount) public {
        require(
            recipient != address(0),
            "Recipient cannot be the zero address"
        );
        require(
            balanceOf(msg.sender) >= amount,
            "Insufficient amount of tokens"
        );
        _transfer(msg.sender, recipient, amount);
    }

    function getStoreItems() public view returns (StoreItem[] memory) {
        return storeItems;
    }
}
