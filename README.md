# aliyun_amqp

Example
========
The following VALUES like **aliyun-amqp-host** **ResourceOwnerId**, **AccessKeyId** and **SecrectKey** are mock data, please use your owner value to replace it.
```erlang
-module(connect_module)
-include_lib("amqp_client/include/amqp_client.hrl").
connect_amqp() ->
  Host = "1979843765064456.mq-amqp.cn-hangzhou-a.aliyuncs.com", # aliyun amqp host
  UserName = get_user_name("1979843765064456", "VSAsIVkiohunPUa"),  # ResourceOwnerId, AccessKeyId
  PassWord =  get_password("i89NgFbEqKWrPOITR7FDWfbLQniO2ij"), # An aliyun secrectKey
  VirtualHost = <<"your_virtual_host">>,
  AmqpParams = #amqp_params_network{
                        username = UserName,
                        password = PassWord,
                        host = Host,
                        virtual_host= VirtualHost
                      }
  aliyun_amqp:connect_aliyun_amqp(AmqpParams).

main() ->
  {ok, Connection} = connect_amqp().
```

Reference
=========
[Erlang RabbitMQ Client library](https://www.rabbitmq.com/erlang-client-user-guide.html)  
[Aliyun amqp java sdk](https://help.aliyun.com/document_detail/106230.html?spm=a2c4g.11186623.6.551.2e794556Is7NZh)