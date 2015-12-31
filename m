From: Build bot for Mark Brown <broonie@kernel.org>
Subject: next-20151231 build: 2 failures 16 warnings (next-20151231)
Date: Thu, 31 Dec 2015 15:58:14 +0000
Message-ID: <E1aEfcE-0003cB-MD@optimist>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:57323 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262AbbLaP60 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Dec 2015 10:58:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: kernel-build-reports@lists.linaro.org, linaro-kernel@lists.linaro.org, linux-next@vger.kernel.org

Tree/Branch: next-20151231
Git describe: next-20151231
Commit: 719d6c1b9f Add linux-next specific files for 20151231

Build Time: 65 min 18 sec

Passed:    7 / 9   ( 77.78 %)
Failed:    2 / 9   ( 22.22 %)

Errors: 0
Warnings: 16
Section Mismatches: 184

Failed defconfigs:
	arm64-allmodconfig
	arm-allmodconfig

Errors:

-------------------------------------------------------------------------------
defconfigs with issues (other than build errors):
      3 warnings    0 mismatches  : arm64-allnoconfig
      5 warnings   92 mismatches  : arm64-allmodconfig
      7 warnings    0 mismatches  : arm-multi_v5_defconfig
      9 warnings    0 mismatches  : arm-multi_v7_defconfig
      8 warnings   92 mismatches  : arm-allmodconfig
      4 warnings    0 mismatches  : arm-allnoconfig
      4 warnings    0 mismatches  : arm64-defconfig

-------------------------------------------------------------------------------

Warnings Summary: 16
	  7 ../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	  7 ../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	  6 <stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	  4 ../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	  4 ../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	  2 ../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/udf/inode.c:1974:3: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/udf/inode.c:1927:28: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	  1 ../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	  1 ../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	  1 ../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	  1 ../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	  1 ../arch/arm/mach-tango/smc.S:1:0: warning: switch -mcpu=cortex-a9 conflicts with -march=armv6k switch [enabled by default]

Section Mismatch Summary: 184
	  1 WARNING: vmlinux.o(.data+0x254e70): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: vmlinux.o(.data+0x254e08): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: vmlinux.o(.data+0x254da0): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	  1 WARNING: vmlinux.o(.data+0x254c30): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: vmlinux.o(.data+0x254bd0): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: vmlinux.o(.data+0x254b70): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: vmlinux.o(.data+0x254b10): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	  1 WARNING: vmlinux.o(.data+0x254ab0): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	  1 WARNING: vmlinux.o(.data+0x252910): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	  1 WARNING: vmlinux.o(.data+0x2528a0): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	  1 WARNING: vmlinux.o(.data+0x252810): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	  1 WARNING: vmlinux.o(.data+0x2527b0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	  1 WARNING: vmlinux.o(.data+0x252750): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	  1 WARNING: vmlinux.o(.data+0x2526f0): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	  1 WARNING: vmlinux.o(.data+0x2523e0): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: vmlinux.o(.data+0x252380): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	  1 WARNING: vmlinux.o(.data+0x252320): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	  1 WARNING: vmlinux.o(.data+0x2521c8): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: vmlinux.o(.data+0x251758): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: vmlinux.o(.data+0x251700): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: vmlinux.o(.data+0x2516a8): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: vmlinux.o(.data+0x251610): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: vmlinux.o(.data+0x2515b0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: vmlinux.o(.data+0x245894): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x245858): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x24581c): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x2457e0): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x2457a4): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x2456e0): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x2456a0): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x245660): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243de0): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243c30): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243bf4): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243bb8): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243b7c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243b28): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243ae4): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243a08): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x2439cc): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x243990): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x242b7c): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x242b40): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x242ae8): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x242ab0): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: vmlinux.o(.data+0x242a78): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0xfd4): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0xfa0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0xf9c): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0xf64): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x4860): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x47f8): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x4790): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x4620): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x45c0): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x4560): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x4500): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x44a0): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d80): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d44): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d08): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3ccc): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3c90): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3bcc): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3b8c): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x3b4c): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2300): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x22cc): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2290): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2200): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x21a0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2140): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x211c): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x20e0): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x20e0): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x20a4): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2068): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x2014): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1fd0): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1ef4): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1eb8): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1e7c): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1dd0): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1d70): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1d10): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1bb8): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1148): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x10f0): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1098): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1068): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x102c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/rockchip/built-in.o(.data+0x1000): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xff84): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0xff48): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0xfef0): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0xfeb8): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0xfe80): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0xfb00): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xfa98): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xfa30): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xf8c0): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xf860): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xf800): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xf7a0): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xf740): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd5a0): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd530): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd4a0): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd440): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd3e0): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd380): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd070): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xd010): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xcfb0): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xce58): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xc3e8): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xc390): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xc338): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xc2a0): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/clk/built-in.o(.data+0xc240): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: drivers/clk/built-in.o(.data+0x12c9c): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12c60): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12c24): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12be8): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12bac): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12ae8): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12aa8): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x12a68): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x111e8): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x11038): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10ffc): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10fc0): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10f84): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10f30): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10eec): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10e10): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10dd4): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/clk/built-in.o(.data+0x10d98): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea994): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea958): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea91c): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea8e0): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea8a4): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea7e0): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea7a0): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xea760): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8ee0): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8d30): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8cf4): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8cb8): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8c7c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8c28): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8be4): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8b08): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8acc): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe8a90): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe7c7c): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe7c40): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe7be8): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe7bb0): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xe7b78): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	  1 WARNING: drivers/built-in.o(.data+0xdf7f0): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/built-in.o(.data+0xdf788): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	  1 WARNING: drivers/built-in.o(.data+0xdf720): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	  1 WARNING: drivers/built-in.o(.data+0xdf5b0): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/built-in.o(.data+0xdf550): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/built-in.o(.data+0xdf4f0): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/built-in.o(.data+0xdf490): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	  1 WARNING: drivers/built-in.o(.data+0xdf430): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	  1 WARNING: drivers/built-in.o(.data+0xdd290): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	  1 WARNING: drivers/built-in.o(.data+0xdd220): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	  1 WARNING: drivers/built-in.o(.data+0xdd190): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	  1 WARNING: drivers/built-in.o(.data+0xdd130): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	  1 WARNING: drivers/built-in.o(.data+0xdd0d0): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	  1 WARNING: drivers/built-in.o(.data+0xdd070): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	  1 WARNING: drivers/built-in.o(.data+0xdcd60): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/built-in.o(.data+0xdcd00): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	  1 WARNING: drivers/built-in.o(.data+0xdcca0): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	  1 WARNING: drivers/built-in.o(.data+0xdcb48): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	  1 WARNING: drivers/built-in.o(.data+0xdc0d8): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	  1 WARNING: drivers/built-in.o(.data+0xdc080): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	  1 WARNING: drivers/built-in.o(.data+0xdc028): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	  1 WARNING: drivers/built-in.o(.data+0xdbf90): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	  1 WARNING: drivers/built-in.o(.data+0xdbf30): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p



===============================================================================
Detailed per-defconfig build reports below:


-------------------------------------------------------------------------------
arm64-allnoconfig : PASS, 0 errors, 3 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]

-------------------------------------------------------------------------------
arm64-allmodconfig : FAIL, 0 errors, 5 warnings, 92 section mismatches

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../fs/dax.c:916:17: warning: passing argument 1 of '__dax_dbg' from incompatible pointer type
	../drivers/gpu/drm/vc4/vc4_validate.c:864:4: warning: format '%d' expects argument of type 'int', but argument 4 has type 'size_t' [-Wformat=]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

Section Mismatches:
	WARNING: drivers/clk/rockchip/built-in.o(.data+0xfa0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1000): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1098): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x10f0): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1148): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1bb8): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1d10): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1d70): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1dd0): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x20e0): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2140): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x21a0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2200): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2290): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2300): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x44a0): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x4500): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x4560): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x45c0): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x4620): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x4790): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x47f8): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x4860): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: drivers/clk/built-in.o(.data+0xc240): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/clk/built-in.o(.data+0xc2a0): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: drivers/clk/built-in.o(.data+0xc338): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/clk/built-in.o(.data+0xc390): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/clk/built-in.o(.data+0xc3e8): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/clk/built-in.o(.data+0xce58): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/clk/built-in.o(.data+0xcfb0): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	WARNING: drivers/clk/built-in.o(.data+0xd010): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	WARNING: drivers/clk/built-in.o(.data+0xd070): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/clk/built-in.o(.data+0xd380): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	WARNING: drivers/clk/built-in.o(.data+0xd3e0): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	WARNING: drivers/clk/built-in.o(.data+0xd440): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	WARNING: drivers/clk/built-in.o(.data+0xd4a0): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	WARNING: drivers/clk/built-in.o(.data+0xd530): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	WARNING: drivers/clk/built-in.o(.data+0xd5a0): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	WARNING: drivers/clk/built-in.o(.data+0xf740): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	WARNING: drivers/clk/built-in.o(.data+0xf7a0): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	WARNING: drivers/clk/built-in.o(.data+0xf800): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/clk/built-in.o(.data+0xf860): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/clk/built-in.o(.data+0xf8c0): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/clk/built-in.o(.data+0xfa30): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	WARNING: drivers/clk/built-in.o(.data+0xfa98): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/clk/built-in.o(.data+0xfb00): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: drivers/built-in.o(.data+0xdbf30): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/built-in.o(.data+0xdbf90): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: drivers/built-in.o(.data+0xdc028): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/built-in.o(.data+0xdc080): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/built-in.o(.data+0xdc0d8): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/built-in.o(.data+0xdcb48): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/built-in.o(.data+0xdcca0): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	WARNING: drivers/built-in.o(.data+0xdcd00): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	WARNING: drivers/built-in.o(.data+0xdcd60): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: drivers/built-in.o(.data+0xdd070): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	WARNING: drivers/built-in.o(.data+0xdd0d0): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	WARNING: drivers/built-in.o(.data+0xdd130): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	WARNING: drivers/built-in.o(.data+0xdd190): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	WARNING: drivers/built-in.o(.data+0xdd220): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	WARNING: drivers/built-in.o(.data+0xdd290): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	WARNING: drivers/built-in.o(.data+0xdf430): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	WARNING: drivers/built-in.o(.data+0xdf490): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	WARNING: drivers/built-in.o(.data+0xdf4f0): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	WARNING: drivers/built-in.o(.data+0xdf550): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	WARNING: drivers/built-in.o(.data+0xdf5b0): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	WARNING: drivers/built-in.o(.data+0xdf720): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	WARNING: drivers/built-in.o(.data+0xdf788): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	WARNING: drivers/built-in.o(.data+0xdf7f0): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: vmlinux.o(.data+0x2515b0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_spdif_p
	WARNING: vmlinux.o(.data+0x251610): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_i2s_pre_p
	WARNING: vmlinux.o(.data+0x2516a8): Section mismatch in reference from the variable __compound_literal.23 to the variable .init.rodata:mux_uart2_p
	WARNING: vmlinux.o(.data+0x251700): Section mismatch in reference from the variable __compound_literal.21 to the variable .init.rodata:mux_uart1_p
	WARNING: vmlinux.o(.data+0x251758): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_uart0_p
	WARNING: vmlinux.o(.data+0x2521c8): Section mismatch in reference from the variable __compound_literal.159 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: vmlinux.o(.data+0x252320): Section mismatch in reference from the variable __compound_literal.131 to the variable .init.rodata:mux_sclk_i2s2_p
	WARNING: vmlinux.o(.data+0x252380): Section mismatch in reference from the variable __compound_literal.128 to the variable .init.rodata:mux_sclk_i2s1_p
	WARNING: vmlinux.o(.data+0x2523e0): Section mismatch in reference from the variable __compound_literal.125 to the variable .init.rodata:mux_sclk_i2s0_p
	WARNING: vmlinux.o(.data+0x2526f0): Section mismatch in reference from the variable __compound_literal.42 to the variable .init.rodata:mux_sclk_uart3_p
	WARNING: vmlinux.o(.data+0x252750): Section mismatch in reference from the variable __compound_literal.39 to the variable .init.rodata:mux_sclk_uart2_p
	WARNING: vmlinux.o(.data+0x2527b0): Section mismatch in reference from the variable __compound_literal.36 to the variable .init.rodata:mux_sclk_uart1_p
	WARNING: vmlinux.o(.data+0x252810): Section mismatch in reference from the variable __compound_literal.33 to the variable .init.rodata:mux_sclk_uart0_p
	WARNING: vmlinux.o(.data+0x2528a0): Section mismatch in reference from the variable __compound_literal.24 to the variable .init.rodata:mux_sclk_spdif_p
	WARNING: vmlinux.o(.data+0x252910): Section mismatch in reference from the variable __compound_literal.19 to the variable .init.rodata:mux_sclk_hsadc_p
	WARNING: vmlinux.o(.data+0x254ab0): Section mismatch in reference from the variable __compound_literal.83 to the variable .init.rodata:mux_uart4_p
	WARNING: vmlinux.o(.data+0x254b10): Section mismatch in reference from the variable __compound_literal.80 to the variable .init.rodata:mux_uart3_p
	WARNING: vmlinux.o(.data+0x254b70): Section mismatch in reference from the variable __compound_literal.77 to the variable .init.rodata:mux_uart2_p
	WARNING: vmlinux.o(.data+0x254bd0): Section mismatch in reference from the variable __compound_literal.74 to the variable .init.rodata:mux_uart1_p
	WARNING: vmlinux.o(.data+0x254c30): Section mismatch in reference from the variable __compound_literal.71 to the variable .init.rodata:mux_uart0_p
	WARNING: vmlinux.o(.data+0x254da0): Section mismatch in reference from the variable __compound_literal.34 to the variable .init.rodata:mux_spdif_8ch_p
	WARNING: vmlinux.o(.data+0x254e08): Section mismatch in reference from the variable __compound_literal.30 to the variable .init.rodata:mux_spdif_p
	WARNING: vmlinux.o(.data+0x254e70): Section mismatch in reference from the variable __compound_literal.26 to the variable .init.rodata:mux_i2s_pre_p

-------------------------------------------------------------------------------
arm-multi_v5_defconfig : PASS, 0 errors, 7 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../fs/udf/inode.c:1974:3: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../fs/udf/inode.c:1927:28: warning: 'adsize' may be used uninitialized in this function [-Wmaybe-uninitialized]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-multi_v7_defconfig : PASS, 0 errors, 9 warnings, 0 section mismatches

Warnings:
	arch/arm/configs/multi_v7_defconfig:435:warning: symbol value 'm' invalid for MFD_DA9063
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'r192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../net/bluetooth/mgmt.c:5471:8: warning: 'h192' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]

-------------------------------------------------------------------------------
arm-allmodconfig : FAIL, 0 errors, 8 warnings, 92 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../arch/arm/mach-tango/smc.S:1:0: warning: switch -mcpu=cortex-a9 conflicts with -march=armv6k switch [enabled by default]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]
	../crypto/wp512.c:987:1: warning: the frame size of 1112 bytes is larger than 1024 bytes [-Wframe-larger-than=]
	../drivers/gpu/drm/amd/amdgpu/../powerplay/hwmgr/ppevvmath.h:382:5: warning: comparison of distinct pointer types lacks a cast [enabled by default]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]

Section Mismatches:
	WARNING: drivers/clk/rockchip/built-in.o(.data+0xf64): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0xf9c): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0xfd4): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x102c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1068): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1e7c): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1eb8): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1ef4): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x1fd0): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2014): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x2068): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x20a4): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x20e0): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x211c): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x22cc): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3b4c): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3b8c): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3bcc): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3c90): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3ccc): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d08): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d44): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/rockchip/built-in.o(.data+0x3d80): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0xfe80): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0xfeb8): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0xfef0): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0xff48): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0xff84): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10d98): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10dd4): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10e10): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10eec): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10f30): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10f84): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10fc0): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x10ffc): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x11038): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x111e8): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12a68): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12aa8): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12ae8): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12bac): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12be8): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12c24): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12c60): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/clk/built-in.o(.data+0x12c9c): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe7b78): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe7bb0): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe7be8): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe7c40): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe7c7c): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8a90): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8acc): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8b08): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8be4): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8c28): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8c7c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8cb8): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8cf4): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8d30): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xe8ee0): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea760): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea7a0): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea7e0): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea8a4): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea8e0): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea91c): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea958): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	WARNING: drivers/built-in.o(.data+0xea994): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x242a78): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x242ab0): Section mismatch in reference from the variable __compound_literal.21 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x242ae8): Section mismatch in reference from the variable __compound_literal.23 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x242b40): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x242b7c): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243990): Section mismatch in reference from the variable __compound_literal.125 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x2439cc): Section mismatch in reference from the variable __compound_literal.128 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243a08): Section mismatch in reference from the variable __compound_literal.131 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243ae4): Section mismatch in reference from the variable __compound_literal.19 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243b28): Section mismatch in reference from the variable __compound_literal.24 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243b7c): Section mismatch in reference from the variable __compound_literal.33 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243bb8): Section mismatch in reference from the variable __compound_literal.36 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243bf4): Section mismatch in reference from the variable __compound_literal.39 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243c30): Section mismatch in reference from the variable __compound_literal.42 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x243de0): Section mismatch in reference from the variable __compound_literal.159 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x245660): Section mismatch in reference from the variable __compound_literal.26 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x2456a0): Section mismatch in reference from the variable __compound_literal.30 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x2456e0): Section mismatch in reference from the variable __compound_literal.34 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x2457a4): Section mismatch in reference from the variable __compound_literal.71 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x2457e0): Section mismatch in reference from the variable __compound_literal.74 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x24581c): Section mismatch in reference from the variable __compound_literal.77 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x245858): Section mismatch in reference from the variable __compound_literal.80 to the (unknown reference) .init.rodata:(unknown)
	WARNING: vmlinux.o(.data+0x245894): Section mismatch in reference from the variable __compound_literal.83 to the (unknown reference) .init.rodata:(unknown)

-------------------------------------------------------------------------------
arm-allnoconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	<stdin>:1307:2: warning: #warning syscall copy_file_range not implemented [-Wcpp]
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wuninitialized]

-------------------------------------------------------------------------------
arm64-defconfig : PASS, 0 errors, 4 warnings, 0 section mismatches

Warnings:
	../mm/page_alloc.c:4617:37: warning: unused variable 'tmp' [-Wunused-variable]
	../mm/page_alloc.c:4617:26: warning: unused variable 'r' [-Wunused-variable]
	../mm/page_alloc.c:5276:25: warning: 'zone_start_pfn' may be used uninitialized in this function [-Wmaybe-uninitialized]
	../drivers/tty/serial/amba-pl011.c:190:27: warning: 'vendor_zte' defined but not used [-Wunused-variable]
-------------------------------------------------------------------------------

Passed with no errors, warnings or mismatches:

x86_64-allnoconfig
x86_64-defconfig
