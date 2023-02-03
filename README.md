# Project Structure

|--mall

​      |---gulimall-common 

​      |---gulimall-gateway 

​      |---gulimall-order 

​      |---gulimall-product

​      |---gulimall-fast  

[![pSDPSVx.png](https://s1.ax1x.com/2023/02/01/pSDPSVx.png)](https://imgse.com/i/pSDPSVx)

## Microservices

### gulimall-common

Manage general methods, public dependencies, beans, tool classes, etc for each microservice.

### gulimall-gateway 

Manage all the http requests, the url format is "**http:domain:88/api/package_name/xxx**"

```yaml
spring:
  cloud:
    gateway:
      routes:
        - id: product_route
          uri: lb://gulimall-product
          predicates:
            - Path=/api/product/**
          filters:
            - RewritePath=/api/(?<segment>/?.*),/$\{segment}
        - id: order_route
          uri: lb://gulimall-order
          predicates:
            - Path=/api/order/**
          filters:
            - RewritePath=/api/(?<segment>/?.*),/$\{segment}
        - id: admin_route
          uri: lb://renren-fast
          predicates:
            - Path=/api/**
          filters:
            - RewritePath=/api/(?<segment>/?.*), /renren-fast/$\{segment}
```

### gulimall-order(microservice)

Order management system, including consumer mall pages and admin system.

### gulimall-product(microservice)

Product management system, including consumer mall pages and admin system.

### gulimall-fast 

VUE Management system start-up procedures.

# Import sql files

The database files currently required are located in the db directory in **renren-fast** program. Just introduce the required files

[![pSDCxq1.png](https://s1.ax1x.com/2023/02/01/pSDCxq1.png)](https://imgse.com/i/pSDCxq1)

# Start-up

**Before** run the project, we need to setup redis, nacos, rabbitmq in the local env.

For M1 chip, We use docker to install redis, nacos, rabbitmq, here is [tutorial]( https://mycloud-pa.atlassian.net/wiki/spaces/DEVELOPMEN/pages/51838977/Set+up+in+local+environment) .

**After** setup local env,  If don't need to run any business part, just run **gulimall-fast**  **gulimall-gateway** these two programs(the minimum application to run the whole project), gulimall-common will be loaded automatically.

According to the folder's name, each project refer to a certain business part, and they can run independently.

[![pSDCvrR.png](https://s1.ax1x.com/2023/02/01/pSDCvrR.png)](https://imgse.com/i/pSDCvrR)