// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import {TendermintX} from "../src/TendermintX.sol";

// forge script script/TendermintX.s.sol --verifier etherscan --private-key
// forge verify-contract <address> TendermintX --chain 5 --etherscan-api-key ${ETHERSCAN_API_KEY} --constructor-args "0x000000000000000000000000852a94f8309d445d27222edb1e92a4e83dddd2a8"
contract DeployScript is Script {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();
        address gateway = address(0x6e4f1e9eA315EBFd69d18C2DB974EEf6105FB803);

        // Use the below to interact with an already deployed ZK light client
        TendermintX lightClient = TendermintX(
            0x2761759a64df1133EE1852b51297dbbaC5FF885B
        );

        // TODO: Add back in when testing a new skip or step.
        uint64 height = 1;
        bytes32 header = hex"b93bbe20a0fbfdf955811b6420f8433904664d45db4bf51022be4200c1a1680d";
        lightClient.setGenesisHeader(height, header);

        // uint64 height = 100100;

        // lightClient.updateStepId(stepFunctionId);
        // lightClient.updateSkipId(skipFunctionId);

        // lightClient.requestHeaderStep{value: 0.1 ether}();

        // uint64 skipHeight = 100200;
        // lightClient.requestSkip{value: 0.1 ether}(skipHeight);
    }
}
