-module(demo).
-export([double/1, sum/1, sum/2, create/1, reverse_create/1]).

% Comment

double(X) ->
    times(X, 2).

times(X, N) ->
    X * N.

sum(N) when N >= 0, N =< 1 ->
    N;

sum(N) ->
    sum(N-1) + N.

sum(N,M) when N =< M ->
    sum(M) - sum(N-1).

create(X, 0) ->
    X;
create(X, N) ->
    create([N|X], N-1).

create(N) when N > 0 ->
    create([], 3).

reverse_create(0) ->
    [];
reverse_create(N) ->
    [N | reverse_create(N-1)].
