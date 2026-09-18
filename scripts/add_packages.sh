#!/bin/bash
# Add eBPF-related packages to FriendlyWrt
cd friendlywrt

# Add packages via .config
cat >> .config <<'EOF'
CONFIG_PACKAGE_kmod-bpf=y
CONFIG_PACKAGE_kmod-net-cls-bpf=y
CONFIG_PACKAGE_kmod-net-act-bpf=y
CONFIG_PACKAGE_bpftool=y
EOF

# Regenerate config
make defconfig   
