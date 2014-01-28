-module(recursive).
-export([fac/1, len/1, tail_len/1, tail_len/2, tail_fac/1, tail_fac/2,
        duplicate/2, tail_duplicate/2, reverse/1, tail_reverse/1,
        quicksort/1]).


%% Compute the factorial of a give non-negative number.
fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).


%% A tail recursive version of fac.
tail_fac(N) -> tail_fac(N, 1).

tail_fac(0, Acc) -> Acc;
tail_fac(N, Acc) -> tail_fac(N-1, Acc*N).


%% Count the length of a list.
len([]) -> 0;
len([_|T]) -> 1 + len(T).


%% A tail recursive version of len.
tail_len(L) -> tail_len(L, 0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T, Acc+1).


%% A function that duplicates the input a given number of times.
duplicate(0, _) -> [];
duplicate(N, Term) when N > 0 ->
  [Term|duplicate(N-1, Term)].


%% A tail recursive version of duplicate.
tail_duplicate(N, Term) ->
  tail_duplicate(N, Term, []).

tail_duplicate(0,_,List) ->
  List;
tail_duplicate(N, Term, List) ->
  tail_duplicate(N-1, Term, [Term|List]).


%% A function which reverses the input.
reverse([]) -> [];
reverse([H|T]) -> reverse(T) ++ [H].


%% A tail recursive version of reverse.
tail_reverse(List) -> tail_reverse(List, []).

tail_reverse([], Acc) -> Acc;
tail_reverse([H|T], Acc) -> tail_reverse(T, [H|Acc]).


%% Quicksort in Erlang
quicksort([]) -> [];
quicksort([Pivot|Rest]) ->
    {Smaller, Larger} = partition(Pivot, Rest, [], []),
    quicksort(Smaller) ++ [Pivot] ++ quicksort(Larger).

partition(_, [], Smaller, Larger) -> {Smaller, Larger};
partition(Pivot, [H|T], Smaller, Larger) ->
    if H =< Pivot -> partition(Pivot, T, [H|Smaller], Larger);
       H > Pivot -> partition(Pivot, T, Smaller, [H|Larger])
    end.
