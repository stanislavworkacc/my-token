// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {SBelToken} from "../src/SBelToken.sol";
import {Script} from "../lib/forge-std/src/Script.sol";
import {console} from "forge-std/console.sol";

contract DeploySBelTokenTest is Script {

    function run() public {
        uint256 pk = vm.envUint("PRIVATE_KEY");
        address owner = vm.envAddress("TOKEN_OWNER");
        vm.startBroadcast(pk);
        SBelToken sBelToken = new SBelToken(owner);

        uint8 decimals = sBelToken.decimals();

        sBelToken.mint(owner, 5000000 * 10 ** decimals);

        console.log("Minted:", 5000000 * 10 ** decimals, "to:", owner);
        console.log("Owner balance:", sBelToken.balanceOf(owner));
        console.log("Total supply:", sBelToken.totalSupply());
        console.log("Decimals:", decimals);
        console.log("Name:", sBelToken.name());
        console.log("Symbol:", sBelToken.symbol());
        console.log("Owner:", owner);

        vm.stopBroadcast();
    }
}