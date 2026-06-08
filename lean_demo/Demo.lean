import Mathlib
set_option warn.sorry false

-- 1. I want to close the goal (simple)
example (n : ℕ) (h : n ≠ 0) : 0 < n := by
  exact Nat.zero_lt_of_ne_zero h

-- 2. I want to close the goal (fancier)
example (l1 l2 l3 : List Nat) (h1 : l1.length ≤ l2.length) (h2 : l3 = l2) : l1.length ≤ l3.length := by
  exact le_of_le_of_eq h1 (congrArg List.length (id (Eq.symm h2)))

-- 3. Edit the goal: "x ∈ s ∧ x ∈ t"
example (x : ℕ) (s t : Set ℕ) (h1 : x ∈ s) (h2 : x ∈ t) : x ∈ s ∩ t := by
  suffices x ∈ s ∧ x ∈ t by exact (Set.mem_inter_iff x s t).mpr this
  sorry

-- 4. Edit the hypothesis: "h : a ≤ b"
example (a b c : ℝ) (h : a < b) : a + c ≤ b + c := by
  have h : a ≤ b := by exact Std.le_of_lt h
  
  sorry
