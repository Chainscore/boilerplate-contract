const ExampleToken = artifacts.require("ExampleToken");
const MyFaucetDapp = artifacts.require("MyFaucetDapp");

const scoring_contract = '';

module.exports = async function (deployer) {
    await deployer.deploy(ExampleToken);
    let exampleTokenDeployed = await ExampleToken.deployed();
    
    await deployer.deploy(
        MyFaucetDapp, 
        exampleTokenDeployed.address, 
        scoring_contract
        );
};
