#!/bin/sh
set -eu

echo "[INFO] Detecting architecture..."
ARCH="$(uname -m)"
echo "[INFO] Architecture detected: $ARCH"

case "$ARCH" in
  x86_64)        CASTAR_BIN="CastarSdk_amd64";  ONLINK_BIN="onlinesdk_amd64";  PACKET_BIN="packetsdk/x86_64/packet_sdk" ;;
  aarch64|arm64) CASTAR_BIN="CastarSdk_arm";    ONLINK_BIN="onlinesdk_arm64";  PACKET_BIN="packetsdk/aarch64/packet_sdk" ;;
  armv7l|arm)    CASTAR_BIN="CastarSdk_arm";    ONLINK_BIN="onlinesdk_arm";    PACKET_BIN="packetsdk/armv7l/packet_sdk" ;;
  i386|i686)     CASTAR_BIN="CastarSdk_386";    ONLINK_BIN="onlinesdk_x86_32"; PACKET_BIN="packetsdk/i686/packet_sdk" ;;
  *) echo "[ERROR] Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Fallback cho Castar (hỗ trợ KEY cũ)
: "${CASTAR_KEY:=${KEY:-}}"

# Cấp quyền chạy nếu file tồn tại
[ -f "$CASTAR_BIN" ] && chmod +x "$CASTAR_BIN" || true
[ -f "$ONLINK_BIN" ] && chmod +x "$ONLINK_BIN" || true
[ -f "$PACKET_BIN" ] && chmod +x "$PACKET_BIN" || true

# Hàm chạy với retry loop
run_with_retry() {
  local name="$1"
  shift
  while true; do
    echo "[RUN] Starting $name..."
    "$@" || echo "[WARN] $name stopped, restarting in 5s..."
    sleep 5
  done
}

# Chạy từng SDK nếu có key, mỗi SDK chạy trong vòng lặp riêng
if [ -n "${CASTAR_KEY:-}" ]; then
  run_with_retry "CastarSDK" ./"$CASTAR_BIN" -key="$CASTAR_KEY" &
fi

if [ -n "${ONLINK_KEY:-}" ]; then
  run_with_retry "OnlinkSDK" ./"$ONLINK_BIN" "$ONLINK_KEY" &
fi

if [ -n "${PACKET_KEY:-}" ]; then
  run_with_retry "PacketSDK" ./"$PACKET_BIN" -appkey="$PACKET_KEY" &
fi

# Giữ container sống
wait
