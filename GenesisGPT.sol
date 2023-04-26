// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20BurnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract GenesisGPT is
    Initializable,
    ERC20Upgradeable,
    ERC20BurnableUpgradeable,
    OwnableUpgradeable,
    UUPSUpgradeable
{
    constructor() {
        _disableInitializers();
    }

    // Define wallet addresses
    address public treasuryWallet;
    address public liquidityWallet;
    address public marketingWallet;
    address public cexListingsWallet;
    address public teamWallet;

    // Initialize the contract
    function initialize(
        address _treasuryWallet,
        address _liquidityWallet,
        address _marketingWallet,
        address _cexListingsWallet,
        address _teamWallet
    ) public initializer {
        // Call the initializer functions of the inherited contracts
        __ERC20_init("GenesisGPT", "GNS");
        __ERC20Burnable_init();
        __Ownable_init();
        __UUPSUpgradeable_init();

        // Assign wallet addresses
        treasuryWallet = _treasuryWallet;
        liquidityWallet = _liquidityWallet;
        marketingWallet = _marketingWallet;
        cexListingsWallet = _cexListingsWallet;
        teamWallet = _teamWallet;

        // Mint tokens and assign to respective wallets
        _mint(treasuryWallet, 700000000 * 1e18);
        _mint(liquidityWallet, 60000000 * 1e18);
        _mint(marketingWallet, 100000000 * 1e18);
        _mint(cexListingsWallet, 100000000 * 1e18);
        _mint(teamWallet, 40000000 * 1e18);
    }

    // Authorize contract upgrade
    function _authorizeUpgrade(
        address newImplementation
    ) internal override onlyOwner {}
}
