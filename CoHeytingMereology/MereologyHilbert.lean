import Lean

-- Abstract definitions

axiom U : Type -- Mereological universe

axiom contains : U -> U -> U
axiom sum : U -> U -> U
axiom prod : U -> U -> U
axiom diff : U -> U -> U
axiom nothing : U
axiom everything : U

/-

-- Propositional interpretation

def U : Type := Prop

def contains := fun x y => x -> y
def sum := fun x y => x /\ y
def prod := fun x y => x \/ y
def diff := fun x y => y -> x
def nothing := True
def everything := False

-/

notation "∅" => nothing
notation "𝒰" => everything

infixr:50 "⊐" => contains

infix:60 "+" => sum
infix:60 "*" => prod
infix:60 "-" => diff

axiom is_nothing : U -> Prop

axiom ax1: ∀P : U, ∀Q : U, is_nothing ((P - Q) - P)
axiom ax2: ∀P : U, ∀Q : U, ∀R : U, is_nothing (((R - P) - ((R - Q) - P)) - (Q - P))
axiom ax3: ∀P : U, ∀Q : U, is_nothing (((P + Q) - P))
axiom ax4: ∀P : U, ∀Q : U, is_nothing (((P + Q) - Q))
axiom ax5: ∀P : U, ∀Q : U, ∀R : U, is_nothing (((R - (P + Q)) - (R - Q)) - (R - P))
axiom ax6: ∀P : U, ∀Q : U, is_nothing ((P - (P * Q)))
axiom ax7: ∀P : U, ∀Q : U, is_nothing ((Q - (P * Q)))
axiom ax8: ∀P : U, ∀Q : U, is_nothing (((P * Q) - Q) - P)
axiom ax9: ∀P : U, is_nothing (P - 𝒰)
axiom ax10: ∀P : U, is_nothing (∅ - P)

axiom ax_nothing : ∀P : U, (is_nothing P) <-> (P = ∅)

axiom ax_modus_ponens :  ∀P : U, ∀Q : U, is_nothing P -> is_nothing (Q - P) -> is_nothing Q

theorem everything_is_part_of_itself: ∀P : U, is_nothing (P - P) := by
  -- Idea: Use I = SKK (see https://en.wikipedia.org/wiki/SKI_combinator_calculus)

  intro P
  have k1 := ax1 P (P - (P - P))
  have k2 := ax1 P (P - P)
  have hS := ax2 P (P - (P - P)) P

  have t : is_nothing ((P-P)-((P-(P-(P-P)))-P)) := by
    exact ax_modus_ponens ((P-(P-P))-P) ((P-P)-((P-(P-(P-P)))-P)) k2 hS

  have : is_nothing (P-P) := by
    exact ax_modus_ponens ((P-(P-(P-P)))-P) (P-P) k1 t

  exact this
