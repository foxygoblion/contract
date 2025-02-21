require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();

module.exports = {
  solidity: "0.8.10",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL,
      accounts: [process.env.PRIVATE_KEY],
      timeout: 0,
      gas: "auto",
      gasPrice: "auto",
      networkCheckTimeout: 100000,
      timeoutBlocks: 200
    }
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY
  }
}; 