#!/bin/sh
set -eu

echo "[INFO] Detecting architecture..."
ARCH="$(uname -m)"
echo "[INFO] Architecture detected: $ARCH"

case "$ARCH" in
  x86_64)        ONLINK_BIN="onlinesdk_amd64" ;;
  aarch64|arm64)  ONLINK_BIN="onlinesdk_arm64" ;;
  armv7l|arm)      ONLINK_BIN="onlinesdk_arm" ;;
  i386|i686)       ONLINK_BIN="onlinesdk_x86_32" ;;
  *) echo "[ERROR] Unsupported architecture: $ARCH"; exit 1 ;;
esac

# Fallback cho Castar (hỗ trợ KEY cũ)
: "${CASTAR_KEY:=${KEY:-}}"

# Cấp quyền chạy nếu file tồn tại
[ -f "$ONLINK_BIN" ] && chmod +x "$ONLINK_BIN" || true


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

if [ -n "${ONLINK_KEY:-}" ]; then
  run_with_retry "OnlinkSDK" ./"$ONLINK_BIN" "$ONLINK_KEY" &
fi


# Giữ container sống
wait
