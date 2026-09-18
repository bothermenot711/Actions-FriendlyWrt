#!/bin/bash
# Append eBPF options to kernel config
cd kernel

cat >> .config <<'EOF'
CONFIG_BPF=y
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_JIT=y
CONFIG_BPF_EVENTS=y
CONFIG_NET_CLS_BPF=m
CONFIG_NET_ACT_BPF=m
CONFIG_DEBUG_INFO_BTF=y
CONFIG_DEBUG_INFO_BTF_MODULES=y
EOF

make CROSS_COMPILE=aarch64-linux-gnu- ARCH=arm64 olddefconfig   
