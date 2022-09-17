### Plan

#### Deploy the contract

- Call the contribute function using a non-owner account, this will make your contribution to > 0
- Check owner's contributions and send ether > owner's contribution. This will trigger the fallback function and make you the new owner.
- Only the owner can withdraw, now since you are the new owner, call withdraw and make the balance ZEROOOO!
