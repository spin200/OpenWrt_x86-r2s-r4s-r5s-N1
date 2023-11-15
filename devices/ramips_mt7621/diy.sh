#!/bin/bash

shopt -s extglob

SHELL_FOLDER=$(dirname $(readlink -f "$0"))
# 修改系统欢迎词
curl -fsSL https://raw.githubusercontent.com/spin200/HC5962-OpenWrt/master/server/etc/banner > package/base-files/files/etc/banner
# 设置主机名称
sed -i 's/OpenWrt/神奇的List/g' package/base-files/files/bin/config_generate
sed -i '/uci commit system/i\uci set system.@system[0].hostname='神奇的List'' package/lean/default-settings/files/zzz-default-settings

sed -i "s/DEVICE_MODEL := HC5962$/DEVICE_MODEL := HC5962 \/ B70/" target/linux/ramips/image/mt7621.mk

sh -c "curl -sfL https://github.com/openwrt/openwrt/commit/2e6d19ee32399e37c7545aefc57d41541a406d55.patch | patch -d './' -p1 --forward" || true
