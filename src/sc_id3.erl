
% http://bensadeghi.com/decision-trees-julia/
% http://en.wikipedia.org/wiki/ID3_algorithm
% http://www.sci.brooklyn.cuny.edu/~kopec/cis718/presented99/Li%20Yao.html





-module(sc_id3).





-export([

    gen_tree/1,
    information_gain/2,
    data_split/2,
 
    entropy/1,
      class_entropy/1

]).





gen_tree(Dataset) -> todo.

information_gain(Attr, Dataset) -> todo.

data_split(Attr, Dataset) -> todo.





% the entropy of an empty list is zero

entropy( [] ) ->

    0;





% otherwise calculate the sum of each class' item entropy, and return it negated

entropy(ClassCount) when is_list(ClassCount) ->

    SumCC = lists:sum(ClassCount),

    -1 * lists:sum([ item_entropy(OneCount, SumCC) || OneCount <- ClassCount ]).





%% @doc N lg2 N for N = (OneClassCount / AllClassCount)

% the item entropy of a class is N log2 N of (the number of items in this class divided by the number of items in every class.)
% note the particular phrasing: if item A belongs to class X and Y, then when you count, that's two memberships, not one.

item_entropy(ThisCount, _SumCount) when ThisCount <  0 -> throw(badarg);
item_entropy(ThisCount, _SumCount) when ThisCount == 0 -> 0;
item_entropy(ThisCount,  SumCount)                     -> 

    N = (ThisCount / SumCount),    
    N * sc:log2(N).
