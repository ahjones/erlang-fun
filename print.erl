-module(print).
-export([printAll/1]).

printAll([]) ->
    io:format("~n", []);
printAll([X|Xs]) ->
    io:format("~p ", [X]),
    printAll(Xs).
