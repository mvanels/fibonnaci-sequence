clc; clear all;

% compute the following fibonnacci sequence
n = 25;

% bruto froce method:
tic
fibo(n)
toc

% Dynamic programming method:
tic
memo = [[1:n]',zeros(n,1)]; % initialize memo
memoOut = fib(n, memo);
ans = memoOut(end,end)
toc

function [memo] = fib(n,memo)
% Solving the Fibonacci sequence, via the use of dynamic programming. 

    if memo(n,2) ~= 0 % solution is already known
      return
    end

    if n <= 2 % solution is 1;
        memo(n,2) = 1;
        return
    end

    % further investigation is required
    memo =  fib(n-2, memo); % through recursion
    memo =  fib(n-1, memo);

    memo(n,2) = memo(n-2,2) + memo(n-1,2); % The sum. 
end

function output = fibo(n)
% Solving the Fibonacci sequence, via a brute force method
    if n <= 2  % solution is 1;
        output = 1;
        return
    end
    % further investigation is required
    output = fibo(n-1) + fibo(n-2);  % through recursion
end