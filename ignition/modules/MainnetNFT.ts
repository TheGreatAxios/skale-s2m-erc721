import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const QUANTITY = 300;

const MainnetNFTModule = buildModule("MainnetNFTModule", (m) => {
  const mainnetNFT = m.contract("MainnetNFT", [
    "<NFT_NAME>",
    "<NFT_SYMBOL>",
    Array.from({ length: QUANTITY }, (_, index) => BigInt(index + 1))
  ]);

  return { mainnetNFT };
});

export default MainnetNFTModule;
