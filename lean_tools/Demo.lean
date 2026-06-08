import DiscrTreeExplore

-- Show LazyDiscrTree path for these theorems:
#showTriePath Nat.add_comm
#showTriePath Nat.le_succ
#showTriePath List.length_append
-- Show LazyDiscrTree path for this theorem (first 3 entries):
#showTriePath Nat.add_comm 3

-- Show LazyDiscrTree path for this goal:
example (n m : Nat) : n + m = m + n := by
  showGoalPath
  exact Nat.add_comm n m

-- Show LazyDiscrTree path for this goal (first 3 entries):
example (n m : Nat) : n + m = m + n := by
  showGoalPath 3
  exact Nat.add_comm n m
