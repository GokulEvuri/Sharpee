-module(database_server).
%-export([start/0,loop/1]).
-compile(export_all).

start()->
    init([]),
    register(?MODULE,spawn(?MODULE,loop,[[]])).

start(List)->
    init(List),
    register(?MODULE,spawn(?MODULE,loop,[List])).

%% Implemented a let it crash approach, if the list is not formatted, the application will crash because is_formatGood/1 returns false; which is not handelled in case statement.
init(List)->
    case is_formatGood(List) of 
	true ->
	    ok
    end.

upgrade()->
    ok.

stop(Data)->
    ?MODULE ! {stop,{user_request,Data}}.

stop()->
    ?MODULE ! {stop,user_request}.

%% For later implementation of checking proplist validity check with predefined list structure.
is_formatGood(_)->
    true.

loop(DataList)->
    receive
	 {register_user,RegisterData}->
	    loop(register_user(RegisterData,DataList));
	
	{addList,List} ->
	    loop(addList({Userid,ListName},DataList));

	{addItem,{Userid,ListName,Item}} ->
	    loop(addItem({Userid,ListName,Item},DataList));
	
	{deleteItem,{Userid,ListName,Item}}->
	    loop(deleteItem({Userid,ListName,Item},DataList));
	
	{editItem,{Userid,ListName,Item}}->
	    loop(editItem({Userid,ListName,Item},DataList));
	
	{stop,_Data} ->
	    ok

    end.

register_user(RegisterData,DataList)->
    [RegisterData|DataList].

addItem(_,_)->
    ok.

deleteItem(_,_)->
    ok.

editItem(_,_)->
    ok.

addList(List,DataList)->
    ok.
