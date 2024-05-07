import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const QUANTITY = 300;

const MainnetNFTAModule = buildModule("MainnetNFTAModule", (m) => {
  const mainnetNFT = m.contract("MainnetNFTA", [
    "<NFT_NAME>",
    "<NFT_SYMBOL>",
    QUANTITY
  ]);

  return { mainnetNFT };
});

export default MainnetNFTAModule;