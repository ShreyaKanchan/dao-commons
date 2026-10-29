# DAO Commons

Governance contract prototype with proposal creation, token-weighted voting, quorum, and execution delay.

This demonstrates governance mechanics only; it uses a mock voting-power mapping and is not production-ready.

## Governance flow

Eligible members create a proposal containing a target contract and calldata. During the voting period, each address can vote once using its assigned voting power. After the period, a proposal passes when affirmative voting power exceeds opposing power and its target call succeeds.

## Important limitations

The demo power setter is intentionally open, there is no quorum or timelock, and vote power is mutable during governance. A real DAO needs snapshot voting, delegated power, quorum, proposal thresholds, a timelock, emergency controls, and audited execution boundaries.
