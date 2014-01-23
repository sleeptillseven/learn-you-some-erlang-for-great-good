-module(recursive).
-export([fac/1, len/1]).

%% Compute the factorial of a give non-negative number.
fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

%% Count the length of a list.
len([]) -> 0;
len([_|T]) -> 1 + len(T).
