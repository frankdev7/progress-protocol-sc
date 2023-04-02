import { ethers } from "hardhat";

async function main() {
  const IntroCrypto = await ethers.getContractFactory("IntroCrypto");
  const myToken = await IntroCrypto.deploy();

  await myToken.deployed();

  console.log(
    `IntroCrypto deployed to ${myToken.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
