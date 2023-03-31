// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    uint8 private constant ONE = 1;
    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("MyNFT", "NFT") {}

    function _baseURI() internal pure override returns (string memory) {
        return
            "https://gateway.pinata.cloud/ipfs/Qma9YrY3aQRQQphi7YqdUDgNZvQp7DfNST2rBcSNCw4PCV/0";
    }

    function safeMint(address to) public onlyOwner {
        require(balanceOf(to)<ONE, "You have enrolled!");
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _tokenURIs[tokenId]=_baseURI();

    }

    function setTokenURI(uint256 tokenId, string memory tokenURI) public onlyOwner {
        _requireMinted(tokenId);
        _tokenURIs[tokenId] = tokenURI;
    }

    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireMinted(tokenId);
        return string(abi.encodePacked(_tokenURIs[tokenId]));
    }
}