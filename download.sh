#!/bin/bash

get_latest_release() {
    curl --silent "https://api.github.com/repos/$1/releases/latest" | # Get latest release from GitHub api
        grep '"tag_name":' | # Get tag line
        sed -E 's/.*"([^"]+)".*/\1/' # Pluck JSON value
}

git clone https://github.com/xcxnig/ssr-download.git deploy

# Clash for Windows

echo "==========================================================================="
echo "* Clash for Windows"
echo "https://github.com/Fndroid/clash_for_windows_pkg"

clash_for_windows_pkg_version=$(get_latest_release "Fndroid/clash_for_windows_pkg")

echo "Latest Verison: $clash_for_windows_pkg_version"
echo "---------------------------------------------------------------------------"

mkdir -p Clash-Windows
wget -O Clash-Windows/Clash.for.Windows.Setup.$clash_for_windows_pkg_version.exe "https://github.com/Fndroid/clash_for_windows_pkg/releases/download/$clash_for_windows_pkg_version/Clash.for.Windows.Setup.$clash_for_windows_pkg_version.exe"
7z a Clash-Windows.7z ./Clash-Windows/*
mv -f Clash-Windows.7z ./deploy/Clash-Windows.7z
rm -rf Clash-Windows

# clashX(macOS)

echo "==========================================================================="
echo "* ClashX (for macOS)"
echo "https://github.com/yichengchen/clashX"

clashx_version=$(get_latest_release "yichengchen/clashX")

echo "Latest Verison: $clashx_version"
echo "---------------------------------------------------------------------------"

wget -O ClashX.dmg "https://github.com/yichengchen/clashX/releases/download/$clashx_version/ClashX.dmg"
mv -f ClashX.dmg ./deploy/ClashX.dmg

# Shadowsocks Android

echo "==========================================================================="
echo "* Shadowsocks Android"
echo "https://github.com/shadowsocks/shadowsocks-android"

ss_android_version=$(get_latest_release "shadowsocks/shadowsocks-android")

echo "Latest Verison: $ss_android_version"
echo "---------------------------------------------------------------------------"

wget -O ss-android.apk "https://github.com/shadowsocks/shadowsocks-android/releases/download/$ss_android_version/shadowsocks--universal-$ss_android_version.apk"
mv -f ss-android.apk ./deploy/ss-android.apk

# Shadowsocks Windows

echo "==========================================================================="
echo "* Shadowsocks Windows"
echo "https://github.com/shadowsocks/shadowsocks-windows"

ss_windows_version=$(get_latest_release "shadowsocks/shadowsocks-windows")

echo "Latest Verison: $ss_windows_version"
echo "---------------------------------------------------------------------------"

wget -O ss-win.zip "https://github.com/shadowsocks/shadowsocks-windows/releases/download/$ss_windows_version/Shadowsocks-$ss_windows_version.zip"
mv -f ss-win.zip ./deploy/ss-win.zip

# ShadowsocksX-NG

echo "==========================================================================="
echo "* ShadowsocksX-NG (macOS)"
echo "https://github.com/shadowsocks/ShadowsocksX-NG"

ss_mac_version=$(get_latest_release "shadowsocks/ShadowsocksX-NG" | sed 's|v||g')

echo "Latest Verison: $ss_mac_version"
echo "---------------------------------------------------------------------------"

wget -O ss-mac.zip "https://github.com/shadowsocks/ShadowsocksX-NG/releases/download/v$ss_mac_version/ShadowsocksX-NG.app.$ss_mac_version.zip"
mv -f ss-mac.zip ./deploy/ss-mac.zip

# ShadowsocksD Android

echo "==========================================================================="
echo "* ShadowsocksD Android"
echo "https://github.com/TheCGDF/SSD-Android"

ssd_android_version=$(get_latest_release "TheCGDF/SSD-Android")

echo "Latest Verison: $ssd_android_version"
echo "---------------------------------------------------------------------------"

wget -O ssd-android.apk "https://github.com/TheCGDF/SSD-Android/releases/download/$ssd_android_version/shadowsocksd_$ssd_android_version.apk"
mv -f ssd-android.apk ./deploy/ssd-android.apk

# ShadowsocksD Windows

echo "==========================================================================="
echo "* ShadowsocksD Windows"
echo "https://github.com/TheCGDF/SSD-Windows"

ssd_windows_version=$(get_latest_release "TheCGDF/SSD-Windows")

echo "Latest Verison: $ssd_windows_version"
echo "---------------------------------------------------------------------------"

mkdir -p SSD-Windows
wget -O SSD-Windows/ssd-win.zip "https://github.com/TheCGDF/SSD-Windows/releases/download/$ssd_windows_version/Shadowsocks-$ssd_windows_version.zip"
cd SSD-Windows && unzip ssd-win.zip && cd ..
rm -rf SSD-Windows/ssd-win.zip
7za a ssd-win.7z ./SSD-Windows/*
mv -f ssd-win.7z ./deploy/ssd-win.7z

# ShadowsocksRR Android

echo "==========================================================================="
echo "* ShadowsocksRR Android"
echo "https://github.com/shadowsocksrr/shadowsocksr-android"

ssrr_android_version=$(get_latest_release "shadowsocksrr/shadowsocksr-android")

echo "Latest Verison: $ssrr_android_version"
echo "---------------------------------------------------------------------------"

wget -O ssrr-android.apk "https://github.com/shadowsocksrr/shadowsocksr-android/releases/download/$ssrr_android_version/shadowsocksr-android-$ssrr_android_version.apk"
mv -f ssrr-android.apk ./deploy/ssrr-android.apk

# V2RayNG

echo "==========================================================================="
echo "* V2RayNG (Android)"
echo "https://github.com/2dust/v2rayNG"

v2rayng_android_version=$(get_latest_release "2dust/v2rayNG")

echo "Latest Verison: $v2rayng_android_version"
echo "---------------------------------------------------------------------------"

wget -O v2rayng.apk "https://github.com/2dust/v2rayNG/releases/download/$v2rayng_android_version/app-universal-release.apk"
mv -f v2rayng.apk ./deploy/v2rayng.apk