# react builder in docker

## 说明 文档什么的最讨厌了

### 当前版本 v0.1.10


### 部署

dev

```
docker run -rm -v $(pwd)/code:/srv/var/code zaoshulib/reactbuilder:v0.1.10 /usr/bin/buildRelease

```

debug

```
docker run -rm -v $(pwd)/code:/srv/var/code zaoshulib/reactbuilder:v0.1.10 /usr/bin/buildDebug

```

release

```
docker run -rm -v $(pwd)/code:/srv/var/code zaoshulib/reactbuilder:v0.1.10 /usr/bin/buildRelease

```

替换 $(pwd)/code 为目标代码目录即可 必须是 git repo

