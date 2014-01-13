-module(useless).
-export([add/2, hello/0, greet_and_add_two/1, print_module_info/0,
         get_seconds_in_hours/1]).
-define(HOUR, 3600). % in seconds.

add(A, B) ->
    A+B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
    io:format("Hello, world!~n").

greet_and_add_two(X) ->
    hello(),
    add(X, 2).

get_seconds_in_hours(X) ->
    X * ?HOUR.

print_module_info() ->
  module_info().
