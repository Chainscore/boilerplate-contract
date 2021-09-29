// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetFixedSupply.sol";

contract ExampleToken is ERC20PresetFixedSupply {
    constructor(address _owner)
    ERC20PresetFixedSupply
    (
        "Example Token", 
        "EX", 
        1000000000000000000000000000000000000000000000000000000000, 
        _owner
    ){}
}