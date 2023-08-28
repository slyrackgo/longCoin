// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract HealthcareReward is ERC20("LongevityToken", "LONG"), Ownable {
    address public healthcareProvider;

    constructor() {
        healthcareProvider = msg.sender;
    }

    // Modifier to restrict access to only the healthcare provider
    modifier onlyProvider() {
        require(msg.sender == healthcareProvider, "Only healthcare provider can call this function");
        _;
    }

    // Set the reward amount (in the smallest token unit)
    function setRewardAmount(uint256 amount) external onlyProvider {
        _mint(address(this), amount);
    }

    // Grant rewards to a patient
    function grantReward(address patient, uint256 amount) external onlyProvider {
        _transfer(address(this), patient, amount);
    }

    // Patient claims their earned rewards
    function claimReward() external {
        uint256 patientBalance = balanceOf(msg.sender);
        require(patientBalance > 0, "No rewards to claim");

        _transfer(msg.sender, address(this), patientBalance);
    }

    // Transfer tokens from the contract to the healthcare provider's address
    function withdrawTokens(uint256 amount) external onlyProvider {
        _transfer(address(this), healthcareProvider, amount);
    }

    // Update the healthcare provider's address
    function updateProvider(address newProvider) external onlyOwner {
        healthcareProvider = newProvider;
    }

    // Retrieve the healthcare provider's address
    function getProvider() external view returns (address) {
        return healthcareProvider;
    }
}


