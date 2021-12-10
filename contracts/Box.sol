//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Import Ownable from the OpenZeppelin Contracts library
import "@openzeppelin/contracts/access/Ownable.sol";

// Make Box inherit from the Ownable contract
contract Box is Ownable {
    uint256 private _value;

    // Emitted when the stored value changes
    event ValueChanged(uint256 value);

    // Stores a new value in the contract
    // The onlyOwner modifier restricts who can call the store function
    function store(uint256 value) public onlyOwner {
        console.log("Changing value from '%s' to '%s'", _value, value);
        _value = value;
        emit ValueChanged(value);
    }

    // Reads the last stored value
    function retrieve() public view returns (uint256) {
        return _value;
    }
}
