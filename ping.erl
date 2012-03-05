-module(ping).
-export([start/0, send/1, stop/0, listen/0]).

listen() ->
	 receive
	     stop ->
		 done;
	     {message, _, 0} ->
		 listen();
	     {message, Pid, N} ->
		 io:format("here~n", []),
		 Pid ! {message, self(), N-1},
		 listen()
	 end.

start() ->
    register(a, spawn(ping, listen, [])),
    register(b, spawn(ping, listen, [])).
    
stop() ->
    a ! stop,
    b ! stop,
    unregister(a),
    unregister(b).

send(N) ->
    a ! {message, b, N},
    done.
