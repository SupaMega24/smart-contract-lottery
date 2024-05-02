// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

/*
 *@title A sample Raffle contract
 *@author Charles Jones
 *@notice This contract creates a sample raffle
 *@dev Implements Chainlinl VRF and Automation
 */

contract Raffle {
    error Raffle__NotEnoughEthSent();
    uint256 private immutable i_entranceFee; //make it immutable to save gas
    uint256 private immutable i_interval; // @dev Duration of lottery in seconds
    address payable[] private s_players;
    uint256 private s_lastTimeStamp;

    event EnteredRaffle(address indexed player);

    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value >= i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        emit EnteredRaffle(msg.sender);
    }

    // Get random number
    // Use random number to pick player
    // Be called automatically
    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
        }
    }

    // Getter Function
    function getEntranceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
