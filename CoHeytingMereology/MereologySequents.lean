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
infix:60 "×" => prod
infix:60 "-" => diff

axiom is_nothing : U -> Prop

axiom weakening: ∀P:U, ∀Q:U, is_nothing (P - (Q - P))
axiom contraction: ∀P:U, ∀Q:U, ∀R:U, is_nothing (((R - Q) - P) - (((R - Q) - P) - P))
axiom transpose: ∀P:U, ∀Q:U, ∀R:U, is_nothing (((R - P) - Q) - ((R - Q) - P))
axiom rotate: ∀P:U, ∀Q:U, ∀R:U, ∀S:U, is_nothing ((((S - P) - R) - Q) - (((S - R) - Q) - P))
axiom combine: ∀P:U, ∀Q:U, ∀R:U, is_nothing (((R - (P + Q)) - ((R - Q) - P)))
axiom split: ∀P:U, ∀Q:U, ∀R:U, is_nothing ((((R - Q) - P) - (R - (P + Q))))
axiom introduce_conjunction: ∀P:U, ∀Q:U, ∀R:U, is_nothing (((((P + Q) - R) - Q) - P))
axiom introduce_implication: ∀P:U, ∀Q:U, ∀R:U, ∀S:U, is_nothing (((((R - (Q - P)) - S) - (R - Q)) - (P - S)))
axiom cut: ∀P:U, ∀Q:U, ∀R:U, ∀S:U, is_nothing ((((R - P) - S) - (R - Q)) - ((Q - P) - S))

axiom ax_nothing : ∀P : U, (is_nothing P) <-> (P = ∅)
