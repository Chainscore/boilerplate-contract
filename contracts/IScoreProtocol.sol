// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <9.0.0;

interface IScoreProtocol{
    
    function stakeRequired() external view returns(uint256);
    function getScore(address _user) external;
}