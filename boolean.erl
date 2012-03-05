-module(boolean).
-export([b_not/1, b_and/2, b_or/2, b_nand/2]).

b_not(false) ->
    true;
b_not(true) ->
    false.

b_and(true, X) ->
    X;
b_and(false, _) ->
    false.

b_or(true, _) ->
    true;
b_or(false, X) ->
    X.

b_nand(X, Y) ->
    b_not(b_and(X,Y)).

