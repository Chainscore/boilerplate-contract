// SPDX-License-Identifier: MIT

pragma solidity >=0.4.22 <0.9.0;

interface Identity {

    function stakePeer(address _peer) external;
    function unstakePeer(address _peer) external;

    function removeAttribute(string memory _attribute) external;
    function addAttribute(string memory _attribute) external;

    function verifyAttribute(string memory _attribute, address _user) external view returns(bool);
}