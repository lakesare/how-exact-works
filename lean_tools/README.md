# lean_tools

Lean 4 utilities for inspecting `LazyDiscrTree` key paths — useful for understanding how `exact?` indexes theorems and searches for goals.

## Commands

### `#showTriePath <theorem> [limit]`

Shows the key path that `LazyDiscrTree` assigns to a theorem's conclusion. This is the path `exact?` uses when indexing the theorem into its trie.

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

### `showGoalPath [limit]`

Tactic that shows the key path for the current proof goal. This is the path `exact?` uses when searching for matching theorems.

```lean
example (n m : Nat) : n + m = m + n := by
  showGoalPath
  exact Nat.add_comm n m
```

## Usage

Copy `DiscrTreeExplore.lean` into your Lean 4 project and `import DiscrTreeExplore` where needed. No extra dependencies required, it only imports from Lean core.

See `Demo.lean` for some examples.
