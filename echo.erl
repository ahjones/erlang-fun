-module(echo).
-export([go/0, loop/0]).

go () ->
    receive
	{Pid, Msg} ->
	    io:format("~w~n", [Msg])
    end,

    Pid = spawn(echo, loop, []),
    Pid ! {self(), hello},
    Pid ! stop.

loop() ->
    receive
	{From, Msg} ->
	    From ! {self(), Msg},
	    loop();
	stop ->
	    true
    end.

