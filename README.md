# xray-ui

对 https://github.com/qist/xray-ui
项目中的xray默认配置文件中，移除了阻止category-ads-all的设置，（不然加载不出来recaptcha），进行重新编译。


## 一键安装

```
bash <(curl -Ls  https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/install-amd64.sh)

bash <(curl -Ls  https://raw.githubusercontent.com/lensfa-lzd/xray-ui/main/install-arm64.sh)
```



## 编译过程
```
# 基于amd64 debian/ubuntu
sudo apt-get install libc6-dev gcc-aarch64-linux-gnu -y

git clone https://github.com/qist/xray-ui.git
# 修改 web/service/config.json
cp config.json xray-ui/web/service/config.json

# 编译
cd xray-ui
CGO_ENABLED=1 go build -o xray-ui/xray-ui-amd64  -ldflags '-linkmode "external" -extldflags "-static"' main.go

CGO_ENABLED=1 GOARCH=arm64 CC="aarch64-linux-gnu-gcc" go build -o xray-ui/xray-ui-arm64  -ldflags '-linkmode "external" -extldflags "-static"' main.go 
```

## 打包到release

```
# 回到仓库根目录
cd ..

mkdir xray-ui-linux-amd64
mkdir xray-ui-linux-arm64

cp xray-ui/xray-ui/xray-ui-amd64 xray-ui-linux-amd64/xray-ui
cp xray-ui/xray-ui/xray-ui-arm64 xray-ui-linux-arm64/xray-ui

cp xray-ui.service xray-ui-linux-amd64/
cp xray-ui.service xray-ui-linux-arm64/

wget -O xray-amd64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
wget -O xray-arm64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-arm64-v8a.zip

unzip -d xray-ui-linux-amd64/bin xray-amd64.zip
unzip -d xray-ui-linux-arm64/bin xray-arm64.zip

mv xray-ui-linux-amd64/bin/xray xray-ui-linux-amd64/bin/xray-linux-amd64
mv xray-ui-linux-arm64/bin/xray xray-ui-linux-arm64/bin/xray-linux-arm64

rm -rf xray-ui
mv xray-ui-linux-amd64 xray-ui
tar -zcvf xray-ui-linux-amd64.tar.gz xray-ui
mv xray-ui xray-ui-linux-amd64

mv xray-ui-linux-arm64 xray-ui
tar -zcvf xray-ui-linux-arm64.tar.gz xray-ui
mv xray-ui xray-ui-linux-arm64

# 即可得到格式一致的输出文件
xray-ui-linux-amd64.tar.gz
xray-ui-linux-arm64.tar.gz
```