const hre = require("hardhat");

async function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
}

async function deployWithRetry(contractName, maxRetries = 3) {
  for (let i = 0; i < maxRetries; i++) {
    try {
      const Contract = await hre.ethers.getContractFactory(contractName);
      const contract = await Contract.deploy();
      await contract.waitForDeployment();
      const address = await contract.getAddress();
      console.log(`${contractName} deployed to:`, address);
      return contract;
    } catch (error) {
      if (i === maxRetries - 1) throw error;
      console.log(`Retry ${i + 1}/${maxRetries} for ${contractName}...`);
      await sleep(5000); // Wait 5 seconds before retrying
    }
  }
}

async function main() {
  console.log("Deploying contracts...");

  // Deploy YDDCoin
  const yddCoin = await deployWithRetry("YDDCoin");
  console.log("Waiting 10 seconds before deploying YDDShow...");
  await sleep(10000); // Wait 10 seconds between deployments

  // Deploy YDDShow
  const yddShow = await deployWithRetry("YDDShow");
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
}); 