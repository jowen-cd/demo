# demo

## server 
 
 server 就 user、friendship、 message这三个模型
 
 - 考虑到可能单方面删除联系人，所以两个 user 之间是各自有一条 friendship 记录的，但是添加联系人时，暂时不考虑另一方是否同意直接创建两条 friendship, 删除联系人时暂时也是两条直接删除
 - SendMessage 和 ReceiveMessage 单表继承自 Message, 发送消息时发送方创建一条 SendMessage, 接收方创建一条 ReceiveMessage, 就可以两边的私信历史各自维护了，同时接收方的 friendship 上记录未读消息数量，ReceiveMessage 的创建和标记已读后都会触发 friendship 未读消息数重算。
 
server 主要以 api 的方式提供给其他 client 或 server 调用

- friendships_controller 主要有 index, create, destroy 三个 action
- messages_controller 主要有 index, create, read, destory 四个 action

### 初始化 user数据
```bash
rake db:migrate
rake db:seed
```

### server 启动
```bash
rails s 
```


## client
- client(activeresource) 就 contact(对应 server friendship) 和 sms (对应 server message)



### client 调试 
```bash
 rake client:contacts
 rake client:messages
```
