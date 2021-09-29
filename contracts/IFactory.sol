// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

interface IFactory{

    function newIdentity(address _user) external;
}