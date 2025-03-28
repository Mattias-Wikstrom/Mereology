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

axiom part_of : U -> U -> Prop

axiom nothing_minimal: ∀P:U, (part_of ∅ P)
axiom everything_maximal: ∀P:U, (part_of P 𝒰)

axiom sums_contain_their_terms_1: ∀P:U, ∀Q:U, (part_of P (P + Q))
axiom sums_contain_their_terms_2: ∀P:U, ∀Q:U, (part_of Q (P + Q))
axiom sums_minimal: ∀P:U, ∀Q:U, ∀R:U, (part_of P R) /\ (part_of Q R) ->  (part_of (P + Q) R)

axiom products_part_of_their_factors_1: ∀P:U, ∀Q:U, (part_of (P * Q) P)
axiom products_part_of_their_factors_2: ∀P:U, ∀Q:U, (part_of (P * Q) Q)
axiom products_maximal: ∀P:U, ∀Q:U, ∀R:U, (part_of R P) /\ (part_of R Q) ->  (part_of R (P * Q))

axiom differences_sufficienly_large: ∀P:U, ∀Q:U, (part_of P (Q + (P - Q)))
axiom differences_minimal: ∀P:U, ∀Q:U, ∀R:U, (part_of P (Q + R)) ->  (part_of (P - Q) R)
