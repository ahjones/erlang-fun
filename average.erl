-module(average).
-export([average/1]).

average(X) ->
    sum(X) / len(X).

sum([H|T]) ->
    H + sum(T);
sum([]) ->
    0.

len([_|T]) ->
    1 + len(T);
len([]) ->
     0.
