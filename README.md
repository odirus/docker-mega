
## docker-mega
使用 docker 构建的 mega 镜像，虽然各种 linux 发行版本都可以直接或者间接安装 mega 命令行工具，但总会遇到一些小麻烦，所以这里使用 docker 构建环境，力求能够以最快的速度部署完毕。

## 安装方式
首先在宿主系统上面安装Docker，根据宿主系统的不同，安装方式也不同，docker 官方安装信息
* MAC OS，[指导链接](https://docs.docker.com/mac/)
* Linux，[指导链接](https://docs.docker.com/linux/step_one/)
* Windows，[指导链接](https://docs.docker.com/windows/step_one/)

## 然后开始编译 Docker 环境，
```
# "odirus/docker-mega" 是可以替换的，比如 "me/docker-name"
docker build --no-cache -t odirus/docker-mega .
```
## 运行Docker容器
```
#"odirus/docker-mega"是可以替换的，与上一步一致
ocker run -v /root/docker-mega/mega-downloads:/root/mega-downloads odirus/docker-mega
```
## 相关解释
现在容器内部已经建立目录 "/root/mega-downloads"，并且与宿主中当前目录下的"mega-downloads"目录对应，相当于共享文件夹，容器中此目录下载的文件会与宿主共享。
```
#获取刚刚启动的容器ID，获取到的值假设为 ${containerId}
docker ps -a
#停止指定ID的容器
docker stop ${containerId}
#启动指定ID的容器
docker start ${containerId}
#进入容器
docker exec -i -t ${containerId}  bash
# 进入与宿主共享目录下载 mega 文件，假设mega的外链地址为 ${link}
cd /root/mega-downloads && megadl ${link}
```
