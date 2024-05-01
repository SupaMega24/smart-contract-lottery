// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
 *@title A sample Raffle contract
 *@author Charles Jones
 *@notice This contract creates a sample raffle
 *@dev Implements Chainlinl VRF and Automation
 */

contract Raffle {
    uint256 private immutable i_entranceFee; //make it immutable to save gas

    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    function enterRaffle() public payable {}

    function pickWinner() public {}

    // Getter Function
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
