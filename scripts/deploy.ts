import { ethers } from "hardhat";
import * as fs from 'fs';


async function deployContract(contractName: any, ...args: any[]) {
    const Contract = await ethers.getContractFactory(contractName);
    const contract = await Contract.deploy(...args);
    await contract.deployed();
    console.log(`${contractName} deployed to:`  , contract.address);
    return contract;
}

async function main() {
    // deployer and weth address
    //const WETHAddress = '0xeb72756ee12309Eae82a0deb9787e69f5b62949c'; // Replace with actual WETH address
    const WETHAddress = '0x10253594A832f967994b44f33411940533302ACb';
    
    const deployer = (await ethers.getSigners())[0];
    // steps:
    // 1. deploy factory
    const factory = await deployContract("MoDexCoinFactory", deployer.address);
    console.log("Factory address: ", factory.address);
    const pairHash = await factory.INIT_CODE_PAIR_HASH();
    console.log("pair hash", pairHash);

    // 2. deploy router
    const router = await deployContract("MoDexCoinRouter", factory.address, WETHAddress);
    console.log("router address: ", router.address);

    // 3. deploy 10 gem tokens and 1 usdt
    // 4. approve 11 tokens to router
    const gemTokens = ["DAIToken", "LINKToken", "GarnetteToken", "GLDToken", "JadeToken", "OpalToken", "PearlToken", "RubyToken", "SapphireToken", "SilverToken", "USDTToken"];
    const gemTokenAddresses = [];
    const gemTokenContracts = [];
    for (let i = 0; i < gemTokens.length; i++) {
        const gemToken = await deployContract(gemTokens[i]);
        await gemToken.approve(router.address, ethers.constants.MaxUint256);
        console.log(`${gemTokens[i]} address: `, gemToken.address);

        gemTokenAddresses.push(gemToken.address);
        gemTokenContracts.push(gemToken);
    }

    // 5. add 10 gem tokens and 1 usdt to factory as pairs
    for (let i = 0; i < gemTokenAddresses.length - 1; i++) {
        await factory.createPair(gemTokenAddresses[i], gemTokenAddresses[10]);
    }


    // 6. add liquidity for each gem token and usdt pair for half of the total supply of each token and 1% of the usdt
    for (let i = 0; i < gemTokenAddresses.length - 1; i++) {
        await router.addLiquidity(
            gemTokenAddresses[i],
            gemTokenAddresses[10],
            ethers.utils.parseEther("5000000"),
            ethers.utils.parseEther("10000000"),
            ethers.utils.parseEther("5000000"),
            ethers.utils.parseEther("10000000"),
            deployer.address,
            Date.now() + 1000 * 60 * 10
            );
    }
    
    // 7. deploy pocket index with usdt as base token and router address

    const pocketIndex = await deployContract("PocketIndex", router.address,gemTokenAddresses[10]);

    // 8. add all 10 gem tokens to pocket index
    for (let i = 0; i < gemTokenAddresses.length - 1; i++) {
        await pocketIndex.addAsset(gemTokenAddresses[i]);
    }

    // 9. deploy lp token
    const lpToken = await deployContract("IndexLPToken", pocketIndex.address);

    // 10. set lp token address in pocket index
    await pocketIndex.setIndexLPToken(lpToken.address);

    // 10. verify all the contracts
    try {
        await run("verify:verify", {
            address: factory.address,
            constructorArguments: [
                deployer.address,
            ],
        });

    } catch (error) {
        console.log(error);
    }

    try {
        await run("verify:verify", {
            address: router.address,
            constructorArguments: [
                factory.address,
                WETHAddress,
            ],
        });
    } catch(e) {
        console.log(e);
    }

    for (let i = 0; i < gemTokens.length; i++) {
        try {
        await run("verify:verify", {
            address: gemTokenAddresses[i],
            constructorArguments: [],
            contract: `contracts/${gemTokens[i]}.sol:${gemTokens[i]}`,
        });
        } catch(e) {
            console.log(e);
        }
    }

    try {
        await run("verify:verify", {
            address: pocketIndex.address,
            constructorArguments: [router.address,gemTokenAddresses[10]],
        });
    } catch(e) {
        console.log(e);
    }

    try {
        await run("verify:verify", {
            address: lpToken.address,
            constructorArguments: [
                pocketIndex.address,
            ],
        });

    } catch (error) {
        console.log(error);
    }

}

function insertInsideQuotesBeforeComment(filePath: string, searchString: string, modifiedString: string): void {
    try {
        // Read the content of the Solidity file synchronously
        let data = fs.readFileSync(filePath, 'utf8');

        // Create a regular expression to match the hex expression before the comment
        const regex = new RegExp(`^(.*${searchString}.*)$`, 'm');
        const match = data.match(regex);
        // If a match is found, insert the modified string inside the quotes
        if (match && match[1]) {
            const hexExpression = match[1];
            const modifiedFileContent = data.replace(`${hexExpression}`, `hex"${modifiedString}"  //init code hash`);
            // Write the modified content back to the file
            fs.writeFileSync(filePath, modifiedFileContent, 'utf8');
            console.log('Insertion inside quotes before comment successful.');
        } else {
            console.log('Unable to find hex expression before the comment.');
        }
    } catch (err) {
        console.error('Error reading or writing to the file:', err);
    }
}
main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });
