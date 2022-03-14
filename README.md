# Intelligent-Cloud-manufacturing-platform
智能云制造平台项目
## 项目功能

1. 注册登录：即将系统用户分为三个角色，可以根据自己需要注册为云工厂管理员或经销商，而已经注册的用户可以进行登录操作，并进入系统。

2. 超级管理员进行管理：超级管理员可以管理（新建、修改、删除，查询）用户、（关停、开启、检索）工厂、（新建、修改、删除，检索）产品（类别与信息）、新建、修改、删除，检索设备（类型与信息），并且可以远程开关机设备。
3. 云工厂管理员进行管理：云工厂管理员可以管理自己的设备（租用云平台设备或者工厂自己的设备），比如新增、修改、删除（设备被租用时不允许删除，自己的设备不允许任何修改）、检索、远程开关机、租用设备，配置产品。云工厂管理员还可以对订单进行投标，投标成功后可以进行排产
4. 经销商进行管理：经销商可以新建、修改、删除、发布订单，并对云工厂管理员的投标进行确认。

## 数据库设计

### ER图

![img](摘抄.assets/clip_image002.jpg)

### 表结构

（1）    角色表，负责存储用户类型的具体信息，字段有角色id、角色名称、角色描述：

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释** |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | -------- |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |          |
| Rolename   | Varchar(100) |        | 不允许       | Null     |          |          |
| Remark     | Varchar(100) |        | 允许         | Null     |          |          |

 

 

（2）  用户表，负责存储用户的具体信息，字段有用户id、角色id、账号、密码、联系方式，真实姓名：

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |              |
| Account    | Varchar(100) | Unique | 不允许       | Null     |          |              |
| password   | Varchar(100) |        | 不允许       | Null     |          |              |
| username   | Varchar(100) |        | 不允许       | Null     |          |              |
| Mobile     | Varchar(100) |        | 不允许       | Null     |          |              |
| Roleid     | Int          | 外键   | 不允许       | Null     |          | 引用自角色表 |

 

 

（3）  工厂表，负责存储工厂的具体信息，字段有工厂id、工厂名称、工厂状态、工厂简介、负责人id：

| **字段名**   | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**      |
| ------------ | ------------ | ------ | ------------ | -------- | -------- | ------------- |
| ID           | Int          | 主键   | 不允许       | Null     | 是       |               |
| Factoryname  | Varchar(100) |        | 不允许       | Null     |          |               |
| Introduction | Varchar(100) |        | 不允许       | Null     |          |               |
| Userid       | Int          | 外键   | 不允许       | Null     |          | 引用自用户表  |
| status       | Int(1)       |        | 不允许       | Null     |          | 1-正常 2-关停 |

 

 

（4）  订单表，负责存储订单的具体信息，字段有订单id、订单编号、产品id、采购数目、投标截止日期、交付截止日期、订单状态、工厂id

| **字段名**  | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**                                                 |
| ----------- | ------------ | ------ | ------------ | -------- | -------- | -------------------------------------------------------- |
| ID          | Int          | 主键   | 不允许       | Null     | 是       |                                                          |
| Orderno     | Varchar(100) | Unique | 不允许       | Null     |          | 系统自动生成                                             |
| Productid   | Int          | 外键   | 不允许       | Null     |          | 引用自产品表                                             |
| Ordernum    | Int          |        | 不允许       | Null     |          |                                                          |
| Deaddate    | Date         |        |              | Null     |          | 投标截止日期                                             |
| Deliverdate | Date         |        |              | Null     |          | 交付截止日期                                             |
| Orderstatus | Int          |        | 不允许       | 1        |          | 1-保存 2-发布 3-投标结束 4-已排产 5-已完工 6-已发货      |
| Factoryid   | Int          | 外键   |              | Null     |          | 引用自工厂表，如果为空则表明没有工厂对此订单的投标被选中 |
| Publisherid | Int          | 外键   |              | Null     |          | 引用自用户表，发布订单的经销商的id                       |

 

 

（5）  设备表，负责存储设备的具体信息，字段有设备id、设备类型id、设备名称、规格、设备描述、设备编号、设备状态、租用状态、设备类别id、所属工厂id

| **字段名**   | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**                                                     |
| ------------ | ------------ | ------ | ------------ | -------- | -------- | ------------------------------------------------------------ |
| ID           | Int          | 主键   | 不允许       | Null     | 是       |                                                              |
| Typeid       | Int          | 外键   | 不允许       | Null     |          |                                                              |
| devicename   | Varchar(100) |        | 不允许       | Null     |          |                                                              |
| Norms        | Varchar(100) |        | 不允许       | Null     |          |                                                              |
| Describe     | Varchar(100) |        | 允许         | Null     |          |                                                              |
| Deviceno     | Varchar(100) | Unique | 不允许       | Null     |          | 系统自动生成                                                 |
| Devicestatus | Int(1)       |        | 不允许       | Null     |          | 0-关闭 1-生产中 2-闲置中 3-故障                              |
| rentstatus   | Int(1)       |        | 不允许       | Null     |          | 0-自有设备 1-租用 2-空闲                                     |
| factoryid    | Int          | 外键   | 允许         | Null     |          | 引用自工厂表，值为null则说明暂时没有工厂使用该设备，且该设备不是自有设备 |

 

（6）  设备类型表，负责存储设备类型的具体信息，字段有设备类型id，设备类型名称、设备类型描述

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释** |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | -------- |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |          |
| Typename   | Varchar(100) |        | 不允许       | Null     |          |          |
| Describe   | Varchar(100) |        | 不允许       | Null     |          |          |

 

 

（7）  产品表，负责存储产品的具体信息，字段有产品id，产品类别id、产品名称、规格、产品描述、产品编号

| **字段名**  | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ----------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID          | Int          | 主键   | 不允许       | Null     | 是       |              |
| Typeid      | Int          | 外键   | 不允许       | Null     |          |              |
| Productname | Varchar(100) |        | 不允许       | Null     |          |              |
| Norms       | Varchar(100) |        | 不允许       | Null     |          |              |
| Describe    | Varchar(100) |        | 允许         | Null     |          |              |
| Productno   | Varchar(100) | Unique | 不允许       | Null     |          | 系统自动生成 |

 

 

（8）  产品类型表，负责存储产品类型的具体信息，字段有产品类型id、产品类型名称、产品类型描述

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释** |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | -------- |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |          |
| Typename   | Varchar(100) |        | 不允许       | Null     |          |          |
| Describe   | Varchar(100) |        | 允许         | Null     |          |          |

 

 

（9）  产能配置表，负责存储设备生产相关产品的具体信息，字段有产能id、设备id、产品id、产能速率

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |              |
| Deviceid   | Int          | 外键   | 不允许       | Null     |          | 引用自设备表 |
| Productid  | Int          | 外键   | 不允许       | Null     |          | 引用自产品表 |
| Velocity   | Int          |        | 不允许       | Null     |          |              |

 

 

（10） 排产表，负责存储排产的具体信息，字段有排产id、订单id、设备id、开始日期、结束日期

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |              |
| Orderid    | Int          | 外键   | 不允许       | Null     |          | 引用自订单表 |
| deviceid   | Int          | 外键   | 不允许       | Null     |          | 引用自设备表 |
| Begindate  | Date         |        | 不允许       | Null     |          |              |
| Enddate    | Date         |        | 不允许       | Null     |          |              |

 

 

（11） 投标表，负责存储云工厂对订单投标的具体信息，字段有投标id、订单id、工厂id、投标价格、是否中标

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |              |
| Ordereid   | Int          | 外键   | 不允许       | Null     |          | 引用自订单表 |
| Factoryid  | Int          | 外键   | 不允许       | Null     |          | 引用自工厂表 |
| Bidprice   | Decimal(8,2) |        | 不允许       | Null     |          |              |
| Bidstatus  | Int          |        | 不允许       | 0        |          | 1表示中标    |

 

 

（12） 设备租用表，负责存储设备租用的具体信息，字段有租用id，开始日期、结束日期、租用时长、设备id、工厂id

| **字段名** | **数据类型** | **键** | **允许为空** | **缺省** | **自增** | **注释**     |
| ---------- | ------------ | ------ | ------------ | -------- | -------- | ------------ |
| ID         | Int          | 主键   | 不允许       | Null     | 是       |              |
| Begindate  | Date         |        | 不允许       | Null     |          |              |
| Enddate    | Date         |        | 不允许       | Null     |          |              |
| Length     | Int          |        | 不允许       | Null     |          | 默认单位：天 |
| deviceid   | Int          | 外键   | 不允许       | Null     |          | 引用自设备表 |
| Factoryid  | Int          | 外键   | 不允许       | Null     |          | 引用自工厂表 |

### 数据库创新点

1. 实现使用java调用存储过程，用java方法中的参数对输入进行了限制，并通过return返回存储过程输出的数据，从而实现对存储过程输出的数据进行操作。

2. 在存储过程中创建了CONTINUE HANDLER FOR SQLEXCEPTION变量，完成对sqlexceptoin的检测，在检测到错误发生，可以进行回滚，撤销当前事务所做的操作。
3. 处理多条语句时，使用分割符分割输入的字符串，将多条记录的处理转换成了多次的对一条记录的处理，解决了一次性对多条记录的处理困难。



## 项目实现：

### 技术框架：

1. 前端框架：Layui、Bootstrap
2. 后端框架：SSM
3. 拦截器：HandlerInterceptor
4. 系统构建：Maven
5. url风格：restful

### 用例图：

![img](摘抄.assets/clip_image002-16472471427641.jpg)

### 流程图：

![img](摘抄.assets/clip_image002.gif)
[摘抄.md](https://github.com/yato-sama-sword/Intelligent-Cloud-manufacturing-platform/files/8243161/default.md)

### 问题总结：

1. 通过tomcat进入allUserinfo.jsp页面时发生500异常，提示bean不存在，并报出nullpointer exception异常。

  解决方法，我先测试bean是否注入失败，或者底层代码出现逻辑错误。于是我先通过Junit单元测试，检查bean是否注入成功和底层实现的代码是否能够正确运行，

测试代码如下：

![img](摘抄.assets/clip_image002-16472472476632.jpg)

运行结果如下

![img](摘抄.assets/clip_image004.jpg)

发现运行结果与预期结果完全一致，于是我推测可能是spring框架部分出现差错，在我依次检查配置文件时发现，在我的web.xml文件中，没有实现对spring-service.xml文件的配置，导致无法读取到service中的bean。在配置后，成功在页面中获取数据。

2. 防止sql注入

  解决方法：首先选择使用mybatis这一半自动化的持久化框架，启用了预编译功能，在SQL执行前，会先将上面的SQL发送给数据库进行编译；执行时，直接使用编译好的SQL，替换占位符“?”，避免SQL注入在编译过程起作用。并且在mapper.xml文件中传入数据时使用#，而不使用$。#将传入的数据都当成一个字符串，会对自动传入的数据加一个双引号。

3. 处理非英文字符

  解决方法：配置过滤器

4. 用户不登录也可以访问系统资源

  解决方法：配置拦截器

### 收获：

1. 前期数据库的设计十分重要。从一开始就做好系统底层的规划，在后端做更多的工作将很有利于后续前端实现时展示的便利。在进行过数据库的剖析以及er图的绘制后，后续在代码编写时效率大有所长。
2. 在dao、service等抽象层，实现其方法时，尽量使用更加宽泛的方式，而不要过于具体。过于具体的代码会导致方法的复用性很低。即使处理多表查询使用单独的sql语句会更加高效，也不妨多设置几个普遍使用的方法，联合调用以达到同样的目的。
3. 使用架构设计，可以有效的提高代码的复用性。由于系统实现了dao、service的底层封装，在controller层实现或者方法显得比较轻松，调用底层方法即可，同时在不同的controller里也可以调用相同的方法，大大提高代码的复用性。
