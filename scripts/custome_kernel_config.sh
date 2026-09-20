#!/bin/bash
cd kernel
export PATH=$GITHUB_WORKSPACE/fa-toolchain/11.3-aarch64/bin:$PATH

# Verify it's found before proceeding
which aarch64-linux-gnu-gcc || { echo "Toolchain not found"; ls $GITHUB_WORKSPACE/fa-toolchain/; exit 1; }

cat >> .config <<'EOF'
CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_EVENTS=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_ACT_BPF=m
CONFIG_NET_ACT_CT=m
CONFIG_NET_ACT_CTINFO=m
CONFIG_DEBUG_INFO_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
EOF

make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 olddefconfig   
