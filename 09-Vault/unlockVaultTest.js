const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("Attack", function () {
  it("Should be able to read the private variables password and username", async function () {
    // Deploy the login contract
    const vaultFactory = await ethers.getContractFactory("vault");

    // To save space, we would convert the string to bytes32 array
    const passwordBytes = ethers.utils.formatBytes32String("password");

    const vaultContract = await vaultFactory.deploy(passwordBytes);
    await vaultContract.deployed();

    // Get the storage at storage slot 0,1
    const slot1Bytes = await ethers.provider.getStorageAt(
      vaultContract.address,
      1
    );

    // We are able to extract the values of the private variables
    expect(ethers.utils.parseBytes32String(slot1Bytes)).to.equal("password");
  });
});

// I couldnt initialise the hardhat project, but this should work if you place it in the hardhat test folder.
