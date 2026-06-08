import Lean.Meta.LazyDiscrTree
import Lean.Meta.Basic
import Lean.Elab.Tactic.Basic
import Lean.Elab.Command

open Lean Meta Elab Command

private def prettyKey : LazyDiscrTree.Key → String
  | .const n a       => s!"Key.const {n} arity:{a}"
  | .star            => "*"
  | .arrow           => "Key.arrow"
  | .fvar id a       => s!"Key.fvar {id.name} arity:{a}"
  | .lit (.natVal n) => s!"Key.lit {n}"
  | .lit (.strVal s) => s!"Key.lit \"{s}\""
  | .other           => "Key.other"
  | .proj s i a      => s!"Key.proj {s} {i} arity:{a+1}"

elab "#showTriePath" n:ident limit:(num)? : command => do
  let name ← liftCoreM <| realizeGlobalConstNoOverloadWithInfo n
  let s ← liftTermElabM <| withReducible do
    let info ← getConstInfo name
    forallTelescope info.type fun _ conclusion => do
      let path ← LazyDiscrTree.patternPath conclusion
      let limited := limit.map (path.toList.take ·.getNat)
      let keys := limited.getD path.toList
      let suffix := if limited.isSome && keys.length < path.size then ",\n  ..." else ""
      return s!"THEOREM ({path.size} Keys):\n[\n  {",\n  ".intercalate (keys.map prettyKey)}{suffix}\n]"
  logInfo s

elab "showGoalPath" limit:(num)? : tactic => do
  let goal ← Lean.Elab.Tactic.getMainGoal
  let s ← withReducible <| goal.withContext do
    let decl ← (← getMCtx).findDecl? goal |>.getDM (throwError "goal not found")
    let path ← LazyDiscrTree.targetPath decl.type
    let limited := limit.map (path.toList.take ·.getNat)
    let keys := limited.getD path.toList
    let suffix := if limited.isSome && keys.length < path.size then ",\n  ..." else ""
    return s!"GOAL ({path.size} Keys):\n[\n  {",\n  ".intercalate (keys.map prettyKey)}{suffix}\n]"
  Lean.logInfo s
