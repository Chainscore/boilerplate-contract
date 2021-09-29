// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "./IScoreProtocol.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract MyFaucetDapp{

    IERC20 token;
    IScoreProtocol ScoreClient;

    event InsuffientScore(address _user);
    event TokensSent(address _user, uint256 _amount);

    mapping(address => uint256) pendingRequests;

    constructor(address _token, address _scoringContract){
        token = IERC20(_token);
        ScoreClient = IScoreProtocol(_scoringContract);
    }

    // user makes request to send tokens
    // request will be fulfilled after scorer returns score and score > 0 in fulfillScore()
    function sendMeTokens(uint256 _amount) public {
        require(_amount>0, "Enter a amount > 0");
        pendingRequests[msg.sender] += _amount;
        ScoreClient.getScore(msg.sender);
    }

    // called by scorer node -> with returned score
    // use custom logic to evaluate risk and send tokens
    function fulfillScore(address _user, uint256 _score) external {
        if(_score < 0){
            emit InsuffientScore(_user);
            return;
        }
        else{
            token.transferFrom(address(this), _user, pendingRequests[_user]);
        }
    }

}