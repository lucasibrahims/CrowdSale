const BankAI = artifacts.require("BankAI");
const AirDrop = artifacts.require("AirDrop");
const CrowdSale = artifacts.require("CrowdSale");
module.exports = async function (deployer) {
  await deployer.deploy(BankAI);
  await deployer.deploy(AirDrop);
  await deployer.deploy(CrowdSale);

  var air = await AirDrop.deployed();
  var crowd = await CrowdSale.deployed();
  var bki = await BankAI.deployed(); 
  var endCrowd = await crowd.address;
  var endAir = await air.address;
  bki.setCrowdSale(endCrowd);
  bki.setAirDrop(endAir);
};