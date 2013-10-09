-module(post).
-compile(export_all).


%% todo Prototype 1
%% Get lat and long, return a parent JSON object with 5 child JSON objects
%% JSON object model
%%     -> Price
%%     -> Distance
%%     -> StoreName
%%     -> Adress
%%     -> Phone Number
    
out(A)->
    List = yaws_api:parse_post(A), 
    Latitude = proplists:get_value("latitude",List,"undefined"),   
    Longitude = proplists:get_value("longitude",List,"undefined"),   
   %% Item = proplists:get_value("item",List,"undefined"),    
    io:format("~w \n ~w",[Latitude,Longitude]).

construct_JSON()->

    Address1 = [{<<"StreetAddress">>, <<"21 2nd Street">>}, {<<"City">>, <<"New York">>},{<<"State">>, <<"NY">>},{<<"PostalCode">>, <<"10021">> }],

    Item1 = [{<<"Price">>, <<"23.89">>},{<<"Distance">>, <<"6.00">>},{<<"StoreName">>, <<"23.89">>}, {<<"Address">>, Address1}], 

    Address2 = [{<<"StreetAddress">>, <<"21 2nd Street">>}, {<<"City">>, <<"New York">>},{<<"State">>, <<"NY">>},{<<"PostalCode">>, <<"10021">> }],

    Item2 = [{<<"Price">>, <<"23.89">>},{<<"Distance">>, <<"6.00">>},{<<"StoreName">>, <<"23.89">>}, {<<"Address">>, Address2}], 

    [{"items", [Item1, Item2]}].
    



