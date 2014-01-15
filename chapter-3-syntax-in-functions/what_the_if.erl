-module(what_the_if).
-export([heh_fine/0, oh_my/1, help_me/1]).

%% This method demonstrates the need of a return value
%% of functions and that an true branch is needed.
%% Due to the fact that all if clauses are concatenated
%% by AND and (the last) one clause raises an issue,
%% the whole functions breaks.
heh_fine() ->
    if 1 =:= 1 ->
         works % is a true branch
    end,
    if 1 =:= 2; 1 =:= 1 ->
         works % is a true branch
    end,
    if 1 =:= 2, 1 =:= 1 ->
         fails % is a false branch and there will never succeed
    end.

%% This function will never break cause it has an
%% 'else' clause.
oh_my(N) ->
    if N =:= 2 -> might_succeed;
    true -> always_does %% This is Erlang's if's 'else!'
end.

%% Demonstration of how every expression has to return something.
help_me(Animal) ->
    Talk = if Animal == cat  -> "meow";
              Animal == beef -> "moow";
              Animal == dog  -> "bark";
              Animal == tree -> "bark";
              true -> "fgdadfgna"
           end,
    {Animal, "says " ++ Talk ++ "!"}.
