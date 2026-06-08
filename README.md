
<h2 align="center">Search Tactics in Lean 4: <code>exact?</code>, <code>apply?</code>, <code>rw?</code></h2>

<h4 align="center">
Bonn Seminar on Formalised Mathematics, 2026.
</h4>

<br>

<div align="center">
  <img width="700" alt="image" src="https://github.com/user-attachments/assets/4d4cdcf1-1f65-467b-a451-594293bad3c9" />
</div>

<br>

## Contents

- **Global Search (Linear Search, Path Indexing, Discrimination Trees)**

- **Local Search (`solveByElim` tactic)**

- **Similar tactics in other proof assistants**

- **History of `exact?`, `apply?`, and `rw?` in Lean**


<br>


## Slides

[presentation.pdf](presentation/presentation.pdf)

## Tools

If you'd like to experiment with the way *LazyDiscrTree* generates the trie, go to [/lean_tools](lean_tools).

```lean
#showTriePath Nat.add_comm
-- THEOREM (16 Keys):
-- [
--   Key.const Eq arity:3,
--   Key.const Nat arity:0,
--   Key.const HAdd.hAdd arity:6,
--   Key.const Nat arity:0,
--   Key.const Nat arity:0,
--   Key.const Nat arity:0,
--   *,
--   *,
--   *,
--   Key.const HAdd.hAdd arity:6,
--   Key.const Nat arity:0,
--   Key.const Nat arity:0,
--   Key.const Nat arity:0,
--   *,
--   *,
--   *
-- ]
```

```lean
example (n m : Nat) : n + m = m + n := by
  showGoalPath
  -- GOAL (20 Keys):
  -- [
  --   Key.const Eq arity:3,
  --   Key.const Nat arity:0,
  --   Key.const HAdd.hAdd arity:6,
  --   Key.const Nat arity:0,
  --   Key.const Nat arity:0,
  --   Key.const Nat arity:0,
  --   Key.const instHAdd arity:2,
  --   Key.const Nat arity:0,
  --   Key.const instAddNat arity:0,
  --   Key.fvar _uniq.69 arity:0,
  --   Key.fvar _uniq.70 arity:0,
  --   Key.const HAdd.hAdd arity:6,
  --   Key.const Nat arity:0,
  --   Key.const Nat arity:0,
  --   Key.const Nat arity:0,
  --   Key.const instHAdd arity:2,
  --   Key.const Nat arity:0,
  --   Key.const instAddNat arity:0,
  --   Key.fvar _uniq.70 arity:0,
  --   Key.fvar _uniq.69 arity:0
  -- ]
  exact Nat.add_comm n m
```
