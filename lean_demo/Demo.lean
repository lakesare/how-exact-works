import Mathlib
set_option warn.sorry false

-- 1. I want to close the goal (simple)
example (n : ℕ) (h : n ≠ 0) : 0 < n := by
  exact?

-- 2. I want to close the goal (fancier)
example (l1 l2 l3 : List Nat) (h1 : l1.length ≤ l2.length) (h2 : l3 = l2) : l1.length ≤ l3.length := by
  exact?

-- 3. Edit the goal: "x ∈ s ∧ x ∈ t"
example (x : ℕ) (s t : Set ℕ) (h1 : x ∈ s) (h2 : x ∈ t) : x ∈ s ∩ t := by
  suffices x ∈ s ∧ x ∈ t by exact?
  sorry

-- 4. Edit the hypothesis: "h : a ≤ b"
example (a b c : ℝ) (h : a < b) : a + c ≤ b + c := by
  have h : a ≤ b := by exact?
  sorry
