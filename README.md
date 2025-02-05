# Unhandled Transfer Failure in Solidity Withdraw Function

This repository demonstrates a common error in Solidity smart contracts: failing to properly handle the potential failure of a transfer using `msg.sender.call{value: balance}(new bytes(0))`.  If the recipient's contract reverts the transfer, the withdrawal function silently fails, leaving funds locked in the contract.

The `bug.sol` file contains the buggy code. The `bugSolution.sol` file shows the corrected implementation.

## Bug

The `withdraw()` function in `bug.sol` attempts to send the contract's entire balance to the caller.  However, it only checks for an insufficient balance and doesn't verify that the transfer was successful.  If the recipient contract has a fallback function that throws, the transfer will fail, but the function will not revert, leaving the funds trapped.