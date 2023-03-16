// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Lottery {
    struct BetInfo{
        uint answerBlockNumber;
        address payable bettor;
        bytes16 challenges;
    }
    uint256 private _tail;
    uint256 private _head;
    mapping (uint256 => BetInfo) private _bets;

    address public owner;

    // 최대 리미트 블락갯수.
    uint256 constant internal BLOCK_LIMIT = 256;
    // 3개 이후의 블락을 맞추는 것으로.
    uint256 constant internal BET_BLOCK_INTERNAL = 3;
    // 배팅 금액
    uint256 constant internal BET_AMOUNT = 5 * 10 ** 15;
        // 팟 머니를 저장할 곳,
    uint256 private _pot;


    constructor() public {
        owner = msg.sender;
    }

    function getSomeValue() public pure returns (uint256 value){
        return 5;
    }

    function getPot() public view returns(uint256 pot){
        return _pot;
    }

    // bet
        // 값을 저장 save the bet to the queue
    // 검증 Distribute
        // 결과값을 검증
        //check the answer

    //bet에 있는 info 부터 get 하는 펑션
    function getBetInfo(uint256 index) public view returns(uint256 answerBlockNumber, address bettor, byte challenges ){
        BetInfo memory b = _bets[index];
        answerBlockNumber = b.answerBlockNumber;
        bettor = b.bettor;
        chaalenges = b.challenges;
    }
    //값을 실제 집어 넣는 함수. push pop
    function pushBet(byte challenges) public returns (bool){
        BetInfo memory b;
        b.bettor = msg.sender;
        b.answerBlockNumber = block.number + BET_BLOCK_INTERNAL;
        b.challenges = challenges;

        _bets[_tall] = b;
        _tail++;
        return true;
    }
    // delete 를 하게되면 gas를 돌려받게 된다. state data를 뽑아오겠다는 뜻이기 때문에.
    function popBet(int256 index) public returns(bool){
        delete _bets[index];
        return true;
    }
}