# gulpDocker

## 说明 文档什么的最讨厌了

### 当前版本 v1


### 部署

dev

```
docker run -rm -v $(pwd)/code:/srv/var/code registry-wan.zaoshu.io/ciutils/gulp:v1 gulpDev

```

debug

```
docker run -rm -v $(pwd)/code:/srv/var/code registry-wan.zaoshu.io/ciutils/gulp:v1 gulpDebug

```

release

```
docker run -rm -v $(pwd)/code:/srv/var/code registry-wan.zaoshu.io/ciutils/gulp:v1 gulpRelease

```

替换 $(pwd)/code 为目标代码目录即可 必须是 git repo

