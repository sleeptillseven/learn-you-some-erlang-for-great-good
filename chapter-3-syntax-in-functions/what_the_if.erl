-module(what_the_if).
-export([heh_if/0]).

%% This method demonstrates the need of a return value
%% of functions and that an true branch is needed.
%% Due to the fact that all if clauses are concatenated
%% by AND and (the last) one clause raises an issue,
%% the whole functions breaks.
heh_if() ->
    if 1 =:= 1 ->
         works % is a true branch
    end,
    if 1 =:= 2; 1 =:= 1 ->
         works % is a true branch
    end,
    if 1 =:= 2, 1 =:= 1 ->
         fails % is a false branch and there will never succeed
    end.
