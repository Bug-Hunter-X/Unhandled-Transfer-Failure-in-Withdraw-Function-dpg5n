```solidity
function withdraw() public {
  uint balance = address(this).balance;
  require(balance > 0, "Insufficient balance");
  (bool success, ) = msg.sender.call{value: balance}(new bytes(0));
  require(success, "Transfer failed.");
}
```