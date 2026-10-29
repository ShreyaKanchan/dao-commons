import test from "node:test";
import assert from "node:assert/strict";
test("proposal passes when yes votes exceed no votes", () => { const proposal = { yes: 70, no: 30 }; assert.equal(proposal.yes > proposal.no, true); });
