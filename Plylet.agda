module Plylet where

open import Data.String.Base
open import Data.Char.Base
open import Data.List.Base

data Type : Set where
  -- The type of the unit value
  TUnit : Type
  -- The type constructor for functions →
  TFunc : Type -> Type -> Type
  -- A type loaded from the prelude
  TBuiltin : String -> Type

data Term : Set where
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
  TypeJ VUnit TUnit
  ∷ []
