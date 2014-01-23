-module(recursive).
-export([fac/1]).

%% This function computes the factorial of a give non-negative
%% number.
fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).
