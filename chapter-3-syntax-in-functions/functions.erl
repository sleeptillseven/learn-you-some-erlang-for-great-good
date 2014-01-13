-module(functions).
-export([greet/2, head/1]).

%% Greet prints a greeting message
%% depending on the gender given.
greet(male, Name) ->
    io:format("Hello, Mr. ~s!~n", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!~n", [Name]);
greet(_, Name) ->
    io:format("Hello, ~s!~n", [Name]).

%% Return the first argument of a list.
head([])    -> [];
head([H|_]) -> H.
