import "@nomiclabs/hardhat-ethers";
import "@nomicfoundation/hardhat-verify";

import { HardhatUserConfig } from "hardhat/config";


const config: HardhatUserConfig = {
  networks: {
    "mode": {
      url: "https://sepolia.mode.network/",
      chainId: 919,
      accounts: [""] //BE VERY CAREFUL, DO NOT PUSH THIS TO GITHUB
    },
    "linea_sepolia": {
      url: "https://linea-sepolia.blockpi.network/v1/rpc/public",
      chainId: 59141,
      accounts: [""] //BE VERY CAREFUL, DO NOT PUSH THIS TO GITHUB
    }
  },
  etherscan: {
    apiKey: {
      "mode": "MODE-NETWORK-TESTNET",
     "linea_sepolia": ""
    },
    customChains: [
      {
        network: "mode",
        chainId: 919,
        urls: {
          apiURL: "https://sepolia.explorer.mode.network/api",
          browserURL: "https://sepolia.explorer.mode.network",
        },
      },{
        network: "linea_sepolia",
        chainId: 59141,
        urls: {
          apiURL: "https://api-sepolia.lineascan.build/api",
          browserURL: "https://sepolia.lineascan.build/address",
        },
      }
    ],
  },
  sourcify: {
    enabled: false,
  },
  solidity: {
    compilers: [
      {
        version: "0.8.0",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
        {
            version: "0.8.20",
            settings: {
            optimizer: {
                enabled: true,
                runs: 99999,
            },
            },
        },
      {
        version: "0.8.4",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
      {
        version: "0.6.6",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
      {
        version: "0.5.16",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
      {
        version: "0.4.18",
        settings: {
          optimizer: {
            enabled: true,
            runs: 99999,
          },
        },
      },
    ],
  },
  paths: {
    sources: "./contracts",
    tests: "./test",
    cache: "./cache",
    artifacts: "./artifacts",
  }
};

export default config;
