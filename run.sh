#!/bin/sh

echo "[INFO] Detecting architecture..."
ARCH=$(uname -m)
echo "[INFO] Architecture detected: $ARCH"

case "$ARCH" in
  x86_64)
    CASTAR_BIN="CastarSdk_amd64"
    ONLINK_BIN="onlinesdk_amd64"
    PACKET_BIN="./packetsdk/x86_64/packet_sdk"
    ;;
  aarch64|arm64)
    CASTAR_BIN="CastarSdk_arm"
    ONLINK_BIN="onlinesdk_arm64"
    PACKET_BIN="./packetsdk/aarch64/packet_sdk"
    ;;
  armv7l|arm)
    CASTAR_BIN="CastarSdk_arm"
    ONLINK_BIN="onlinesdk_arm"
    PACKET_BIN="./packetsdk/armv7l/packet_sdk"
    ;;
  i386|i686)
    CASTAR_BIN="CastarSdk_386"
    ONLINK_BIN="onlinesdk_x86_32"
    PACKET_BIN="./packetsdk/i686/packet_sdk"
    ;;
  *)
    echo "[ERROR] Unsupported architecture: $ARCH"
    exit 1
    ;;
esac

# Cấp quyền chạy
chmod +x $CASTAR_BIN $ONLINK_BIN $PACKET_BIN

# Chạy từng SDK nếu có key
[ -n "$CASTAR_KEY" ] && echo "[RUN] Starting CastarSDK..." && ./$CASTAR_BIN -key=$CASTAR_KEY &
[ -n "$ONLINK_KEY" ] && echo "[RUN] Starting OnlinkSDK..." && ./$ONLINK_BIN $ONLINK_KEY &
[ -n "$PACKET_KEY" ] && echo "[RUN] Starting PacketSDK..." && $PACKET_BIN -appkey=$PACKET_KEY &

wait
