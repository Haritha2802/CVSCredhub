var certificate = artifacts.require("./CertificateVerify.sol");

module.exports = function(deployer) {
  deployer.deploy(certificate);
};