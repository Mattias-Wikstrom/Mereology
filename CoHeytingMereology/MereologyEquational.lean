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

axiom neutral_element_sums: ∀P:U, P + ∅ = P
axiom neutral_element_products: ∀P:U, P * 𝒰 = P

axiom sums_commutative: ∀P:U, ∀Q:U, P + Q = Q + P
axiom sums_associative: ∀P:U, ∀Q:U, ∀R:U, P + (Q + R) = (P + Q) + R

axiom products_commutative: ∀P:U, ∀Q:U, P * Q = Q * P
axiom products_associative: ∀P:U, ∀Q:U, ∀R:U, P * (Q * R) = (P * Q) * R

axiom products_distribute_over_sums: ∀P:U, ∀Q:U, ∀R:U, P * (Q + R) = (P * Q) + (P * R)
axiom sums_distribute_over_products: ∀P:U, ∀Q:U, ∀R:U, P + (Q * R) = (P + Q) * (P + R)

axiom differences_lower_bound: ∀P:U, ∀Q:U, P + (Q - P) = P + Q
axiom differences_upper_bound: ∀P:U, ∀Q:U, Q + (Q - P) = Q
