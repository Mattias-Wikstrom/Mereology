# About This Repo
This repo contains mereological (https://plato.stanford.edu/entries/mereology/) axiom systems. The axiom systems are written in Lean 4 (https://github.com/leanprover/lean4).

# What Is Co-Heyting Mereology?
Co-Heyting mereology is mereology where the parts of any object is stipulated/required to have the structure of a co-Heyting algebra (https://ncatlab.org/nlab/show/co-Heyting%20algebra).

The basic operations of the co-Heyting algebra get the following mereological interpretations:
* x ∨ y is the mereological sum (written 'x + y') of x and y,
* x ∧ y is the mereological product (written 'x * y') of x and y, and
* x \ y is the mereological difference (written 'x - y') between x and y.

Co-Heyting mereology may be used to reason about parts of propositions. Its interpretation is then as follows:
* x + y is the conjunction of the propositions x and y,
* x * y is the disjunction of the propositions x and y, and
* x - y is the proposition y -> x which says that y implies x.

# Alternative Ways of Axiomatizising Co-Heyting Mereology
This repo axiomatizes co-Heyting mereology in four different ways:
* With the partial order relation '... is part of ...' as the primitive relation,
* as a theory in equational logic,
* as the mereological equivalent of a Hilbert system (https://en.wikipedia.org/wiki/Hilbert_system), and
* as the mereological equivalent of a system based on sequent calculus (https://encyclopediaofmath.org/index.php?title=Sequent_calculus).
