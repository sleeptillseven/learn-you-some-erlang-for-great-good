-module(cases).
-export([insert/2, beach/1, beachf/1]).

%% With the case-of construct you can make use of
%% pattern matching on each argument.
insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
        true  -> Set;
        false -> [X|Set]
    end.

%% checking more complex input via case-of
beach(Temperature) ->
    case Temperature of
        {celsius, N} when N >= 20, N =< 45 ->
            'favorable';
        {kelvin, N} when N >= 293, N =< 318 ->
            'scientifically favorable';
        {fahrenheit, N} when N >= 68, N =< 113 ->
            'favorable in the US';
        _ ->
            'avoid the beach'
    end.

%% A rewrite of beach but using function heads
beachf({celsius, N}) when N >= 20, N =< 45 ->
    'favorable';
beachf({kelvin, N}) when N >= 293, N =< 318 ->
    'scientifically favorable';
beachf({fahrenheit, N}) when N >= 68, N =< 113 ->
    'favorable in the US';
beachf(_) ->
    'avoid beach'.
