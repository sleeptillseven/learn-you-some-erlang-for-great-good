-module(cases).
-export([insert/2]).

%% With the case-of construct you can make use of
%% pattern matching on each argument.
insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
        true  -> Set;
        false -> [X|Set]
    end.
