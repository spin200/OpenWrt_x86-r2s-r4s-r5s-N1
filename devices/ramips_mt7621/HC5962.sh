# 修改系统欢迎词
curl -fsSL https://raw.githubusercontent.com/spin200/HC5962-OpenWrt/master/server/etc/banner > package/base-files/files/etc/banner
# 设置主机名称
#sed -i 's/OpenWrt/神奇的List/g' package/base-files/files/bin/config_generate
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='神奇的List'' 
# 替换配置文件中的主机名称  
sed -i "s/option hostname '.*'/option hostname '神奇的List'/g" /etc/config/system

