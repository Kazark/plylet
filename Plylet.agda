module Plylet where

open import Data.String.Base
open import Data.Char.Base
open import Data.List.Base

-- Valid types in the core language. `Type` should not be accessible in the
-- surface language.
data Type : Set where
  -- The type of the unit value
  TUnit : Type
  -- The type of all other types (and itself)
  TType : Type
  -- The type constructor for functions →
  TFunc : Type
  -- A type loaded from the prelude
  TPrelude : String -> Type

-- Valid terms in the core language. A type should not be a valid term in the
-- surface language.
data Term : Set where
  -- A type is a valid term in the core language
  VType : Type → Term
  -- The value of unit
  VUnit : Term
  -- An well-typed application is a valid term
  VApp : Term → Term → Term
  -- A well-formed let expression is a valid term
  VLet : Char -> Term -> Term -> Term
  -- A function from the prelude
  VFunc : String -> Term

data Judgment : Set where
  -- A typing judgment
  TypeJ : Term → Type → Judgment
  -- A coercion validity judgment
  CoerceJ : Type → Type → Judgment

Gamma : Set
Gamma = List Judgment

baseEnv : Gamma
baseEnv =
  -- We allow type in type, since this language is not going to be nearly
  -- full-featured enough to be useful as a proof system; the power should be so
  -- little that this shouldn't cause unsoundness. I hope.
  -- Type : Type
  TypeJ (VType TType) TType
  -- '1 : Type
  ∷ TypeJ (VType TUnit) TType
  -- () : '1
  ∷ TypeJ VUnit TUnit
  -- In order to express the rest of the rules, since `Type` is reified in the
  -- core system, it is tempting to add parametricity for types, in order to be
  -- able to express all rules in this format. Does one do that, or make some
  -- rules appear as values in gamma, and some appear via lookup functions, and
  -- consider gamma as something of an abstract type? I rather favor the
  -- latter...
  ∷ []
