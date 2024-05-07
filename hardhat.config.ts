import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
import dotenv from "dotenv";

dotenv.config();

const PRIVATE_KEY = process.env.PRIVATE_KEY;

if (PRIVATE_KEY === undefined) throw new Error("Please add PRVIATE_KEY to .env");

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  defaultNetwork: "ethereum",
  networks: {
    "holesky": {
      url: "https://ethereum-holesky-rpc.publicnode.com ",
      accounts: [PRIVATE_KEY],
      loggingEnabled: true
    },
    "ethereum": {
      url: "https://eth.llamarpc.com",
      accounts: [PRIVATE_KEY],
      loggingEnabled: true
    }
  }
};

export default config;
