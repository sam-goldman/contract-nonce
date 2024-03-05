# Steps to Reproduce

1. 
```
git clone git@github.com:sam-goldman/contract-nonce.git
```

2. 
```
cd contract-nonce && forge install
```

3. 
```
anvil
```

4. Open a new terminal. Then, deploy a contract to `0x5b73C5498c1E3b4dbA84de0F1833c4a029d90519`:
```
forge script script/Counter.s.sol --broadcast --target-contract Deploy --rpc-url http://127.0.0.1:8545
```

5. Run a different script that dry runs a broadcast from the contract that was deployed in the previous script:
```
forge script script/Counter.s.sol --target-contract CounterScript --rpc-url http://127.0.0.1:8545
```

## Expected outcome

The script should succeed because the broadcaster's nonce should be incremented like a contract. Specifically, its nonce shouldn't be incremented after making a function call.

## Actual outcome

The following error occurs:
> revert: Nonce should be 2 post-call

This error is caused by the fact that the broadcaster's nonce is incremented like an EOA instead of a contract.

This error occurs when broadcasting, but not when pranking.