// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

import "./ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract IntroCrypto is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(address => uint256) _addressLevels;
    mapping(uint256 => string) _levelURIs;
    mapping(address => uint256) _students;

    constructor(string memory _URI) ERC721("IntroCrypto", "CRYPTO") {
        _levelURIs[0] = _URI;
    }

    function safeMint(address to) public onlyOwner {
        require(balanceOf(to) < 1, "You have enrolled!");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _students[to] = tokenId;
        _addressLevels[to] = 0;
    }

    function setLevelURI(uint256 _level, string memory _URI) public onlyOwner {
        _levelURIs[_level] = _URI;
    }

    function upLevel(address _student) public onlyOwner {
        require(balanceOf(_student) == 1, "You doesnt have enrolled!");
        uint256 _newLevel = _addressLevels[_student] + 1;
        _addressLevels[_student] = _newLevel;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override
        returns (string memory)
    {
        _requireMinted(tokenId);
        address _owner = _owners[tokenId];
        uint256 _level = _addressLevels[_owner];
        return _levelURIs[_level];
    }

    function tokenId(address _student) public view returns (uint256) {
        return _students[_student];
    }
}