# Mosaic Aggregator Smart Contract integration

This repo contains an example contract for integrating with Mosaic aggregator smart contract. 

## Integrate with Mosaic aggregator smart contract

There are 3 steps to integrate with the Mosaic aggregator smart contract:

1. Copy the interface directory (`interface/mosaic` directory) to your project.
2. Add the `mosaic` interface to your project's configuration file (`Move.toml`).

The code below shows how to add the `mosaic` interface to your project's configuration file (`Move.toml`). You could change to the location of the `mosaic` interface directory if it is different from the example below.

```toml
[dependencies.Mosaic]
local = "./interface/mosaic"
```

3. Import module and use the methods provided to perform token swaps, supporting both coin and fungible asset (FA) standards. Please refer to the [`integration_example` module](./sources/integration_example.move) for more details.

**Note**: Please use the appropriate contract addresses for the Mosaic aggregator smart contract based on the network you are deploying to by updating the value of the `mosaic` address in the `mosaic/Move.toml` file.

## Contract addresses

- **Mainnet**: `0x03f7399a0d3d646ce94ee0badf16c4c3f3c656fe3a5e142e83b5ebc011aa8b3d`
