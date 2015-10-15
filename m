From: Guenter Roeck <linux@roeck-us.net>
Subject: Build and runtime failures with next-20151015
Date: Thu, 15 Oct 2015 09:20:46 -0700
Message-ID: <561FD25E.4070309@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48731 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752390AbbJOQVW (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Oct 2015 12:21:22 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

There are too many failures for me to list it all individually, or to track it all down.

Here is a summary.

Build results:
	total: 144 pass: 127 fail: 17
Failed builds:
	arc:allnoconfig
	arm:allmodconfig
	arm64:allmodconfig
	avr32:allnoconfig
	cris:allnoconfig
	i386:defconfig
	i386:allnoconfig
	mips:allmodconfig
	mn10300:asb2303_defconfig
	mn10300:asb2364_defconfig
	parisc:generic-64bit_defconfig
	s390:allmodconfig
	sparc32:allmodconfig
	sparc64:allmodconfig
	um:defconfig
	x86_64:defconfig
	x86_64:allnoconfig

Qemu test results:
	total: 93 pass: 53 fail: 40
Failed tests:
	arm:vexpress-a9:arm_vexpress_defconfig:vexpress-v2p-ca9
	arm:vexpress-a15:arm_vexpress_defconfig:vexpress-v2p-ca15-tc1
	arm:kzm:imx_v6_v7_defconfig
	rm:beagle:multi_v7_defconfig:omap3-beagle
	arm:beaglexm:multi_v7_defconfig:omap3-beagle-xm
	arm:overo:multi_v7_defconfig:omap3-overo-tobi
	arm:vexpress-a9:multi_v7_defconfig:vexpress-v2p-ca9
	arm:vexpress-a15:multi_v7_defconfig:vexpress-v2p-ca15-tc1
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc702
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zc706
	arm:xilinx-zynq-a9:multi_v7_defconfig:zynq-zed
	arm:smdkc210:multi_v7_defconfig:exynos4210-smdkv310
	arm:smdkc210:exynos_defconfig:exynos4210-smdkv310
	arm:beagle:omap2plus_defconfig:omap3-beagle
	arm:beaglexm:omap2plus_defconfig:omap3-beagle-xm
	arm:overo:omap2plus_defconfig:omap3-overo-tobi
	arm64:smp:defconfig
	arm64:nosmp:defconfig
	cris:crisv32_defconfig
	mips:mips_malta_defconfig
	mips:mipsel_malta_defconfig
	powerpc:nosmp:ppc64_book3s_defconfig
	powerpc:smp4:ppc64_book3s_defconfig
	powerpc:pseries_defconfig
	x86:SandyBridge:q35:x86_pc_defconfig
	x86:Haswell:pc:x86_pc_defconfig
	x86:Nehalem:q35:x86_pc_defconfig
	x86:phenom:pc:x86_pc_defconfig
	x86:core2duo:q35:x86_pc_nosmp_defconfig
	x86:Conroe:isapc:x86_pc_nosmp_defconfig
	x86:Opteron_G1:pc:x86_pc_nosmp_defconfig
	x86:n270:isapc:x86_pc_nosmp_defconfig
	x86_64:SandyBridge:q35:x86_64_pc_defconfig
	x86_64:Haswell:q35:x86_64_pc_defconfig
	x86_64:core2duo:pc:x86_64_pc_defconfig
	x86_64:Nehalem:q35:x86_64_pc_defconfig
	x86_64:phenom:pc:x86_64_pc_defconfig
	x86_64:Opteron_G1:q35:x86_64_pc_defconfig
	x86_64:Opteron_G4:pc:x86_64_pc_nosmp_defconfig
	x86_64:IvyBridge:q35:x86_64_pc_nosmp_defconfig

Most if not all of the qemu tests are build failures. I think, though, that there
may also be some runtime failures, currently hidden underneath the build failures.

Details are available at http://server.roeck-us.net:8010/builders in case someone
has the time to track this all down.

Guenter
