import Mathlib
set_option linter.unusedVariables false

-- 1. OPTION: +grind
--    OPTION: +try?
inductive MyAnd (P Q : Prop) : Prop
  | intro : P → Q → MyAnd P Q
example (P : Prop) (h_a : ¬P → P) (h_b : P) : MyAnd P P := by
  exact?
example (P : Prop) (h_a : ¬P → P) (h_b : P) : MyAnd P P := by
  exact? +grind

-- 2. OPTION: using [smth, smth, smth]
example (n m k : Nat) (h1 : m ≤ k) (h2 : 2 + 2 = 4) : n * m ≤ n * k := by
  exact?
example (n m k : Nat) (h1 : m ≤ k) (h2 : 2 + 2 = 4) : n * m ≤ n * k := by
  exact? using h2

-- 3. OPTION: using [smth, smth, smth] - timing
#time example (n m k : Nat) (h1 : m ≤ k) (h2 : 2 + 2 = 4) : n * m ≤ n * k := by
  exact?
#time example (n m k : Nat) (h1 : m ≤ k) (h2 : 2 + 2 = 4) : n * m ≤ n * k := by
  exact? using h1
