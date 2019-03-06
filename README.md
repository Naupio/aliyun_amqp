# aliyun_amqp

Add deps for rebar.config
==========
```erlang
{deps, [
  {aliyun_amqp, {git, "https://github.com/Naupio/aliyun_amqp.git", {tag, "0.1.1"} }}
]}.
```

Config
========
edit the ./config/sys.config file
```erlang
[
  %% use your datas to replace the following values
  {aliyun_amqp, [
    {resource_owner_id,  "1979843765064456"},
    {access_key_id,  "VSAsIVkiohunPUa"},
    {secrect_key,  "1979843765064456"},
    {host, "1979843765064456.mq-amqp.cn-hangzhou-a.aliyuncs.com"}
  ]}
].
```

Example
========
The following VALUES like **aliyun-amqp-host** **ResourceOwnerId**, **AccessKeyId** and **SecrectKey** are mock data, please use your owner value to replace it.
```erlang
-module(connect_module)
-include_lib("amqp_client/include/amqp_client.hrl").
connect_aliyun_amqp() ->
  VirtualHost = <<"your_amqp_virtual_host">>,
  aliyun_amqp:connect_aliyun_amqp(#amqp_params_network{virtual_host = VirtualHost}).
main() ->
  connect_aliyun_amqp().
```

Reference
=========
[Erlang RabbitMQ Client library](https://www.rabbitmq.com/erlang-client-user-guide.html)  
[Aliyun amqp java sdk](https://help.aliyun.com/document_detail/106230.html?spm=a2c4g.11186623.6.551.2e794556Is7NZh)
