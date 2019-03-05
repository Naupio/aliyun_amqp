-module(aliyun_amqp).

-define(ACCESS_FROM_USER, "0").
-define(PRINT(Var), io:format("DEBUG: ~p:~p - ~p~n~n ~p~n~n", [?MODULE, ?LINE, ??Var, Var])).

-include_lib("amqp_client/include/amqp_client.hrl").

-export([

  get_user_name/2,
  get_user_name/3,

  get_password/1,

  connect_aliyun_amqp/1
]).

connect_aliyun_amqp(#amqp_params_network{} = AmqpParams) ->
  Result = amqp_connection:start(AmqpParams),
  % ?PRINT(Result),
  Result.


get_user_name(ResourceOwnerId, AccessKey) ->
  UserName = base64:encode(binary:list_to_bin(string:join([?ACCESS_FROM_USER, ResourceOwnerId, AccessKey], ":")) ),
  <<UserName/bitstring>>.
get_user_name(ResourceOwnerId, AccessKey, StsToken) ->
  UserName = base64:encode(binary:list_to_bin(string:join([?ACCESS_FROM_USER, ResourceOwnerId, AccessKey, StsToken], ":")) ),
  <<UserName/bitstring>>.

get_password(SecrectKey) ->
  {A,B,C} = erlang:timestamp(),
  LongTimeStamp = erlang:integer_to_list( trunc(A*math:pow(10,9)) +trunc(B*math:pow(10,3)) + trunc(C / math:pow(10,3))  ),
  Signature = bin_to_hexstr(crypto:hmac(sha, LongTimeStamp, SecrectKey)),
  PreBase64 = binary:list_to_bin(string:join([Signature, LongTimeStamp],":")),
  % ?PRINT(PreBase64),
  PassWord = base64:encode(PreBase64),
  <<PassWord/bitstring>>.

bin_to_hexstr(Bin) ->
  lists:flatten([io_lib:format("~2.16.0B", [X]) ||
    X <- binary_to_list(Bin)]).