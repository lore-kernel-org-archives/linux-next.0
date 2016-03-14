From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 14
Date: Mon, 14 Mar 2016 07:37:29 -0700
Message-ID: <20160314143729.GA31845@roeck-us.net>
References: <20160314174037.0097df55@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160314174037.0097df55@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 14, 2016 at 05:40:37PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160311:
> 
> The vfs tree gained a conflict against Linus' tree. I also applied a
> patch for a known runtime bug.
> 
> The tip tree gained a conflict against the mips tree.
> 
> The aio tree still had a build failure so I removed several commits
> from it.  It also gained a conflict against the vfs tree.
> 
> Non-merge commits (relative to Linus' tree): 11202
>  8646 files changed, 426680 insertions(+), 211740 deletions(-)
> 

To give people an idea what to expect in the merge window, here are my current
build and runtime test results. Some of the runtime failures are due to the
newly introduced i2c bug, but many (including the arm64 boot failures) have
been around for a while.

Build results:
	total: 145 pass: 131 fail: 14
Failed builds:
	arc:defconfig
	arc:allnoconfig
	arc:tb10x_defconfig
	arc:axs103_defconfig
	arc:nsim_hs_smp_defconfig
	arc:vdk_hs38_smp_defconfig
	avr32:defconfig
	avr32:merisc_defconfig
	avr32:atngw100mkii_evklcd101_defconfig
	nios2:3c120_defconfig
	unicore32:defconfig
	unicore32:allnoconfig
	x86_64:allyesconfig
	x86_64:allmodconfig

Qemu test results:
	total: 96 pass: 69 fail: 27
Failed tests:
	arm:imx25-pdk:imx_v4_v5_defconfig:imx25-pdk
	arm:kzm:imx_v6_v7_defconfig
	arm:beagle:multi_v7_defconfig:omap3-beagle
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
	arm:realview-pb-a8:realview_defconfig
	arm:realview-eb-mpcore:realview-smp_defconfig
	arm64:smp:defconfig
	arm64:nosmp:defconfig
	mips:mips_malta_smp_defconfig
	mips64:smp:mips_malta64_defconfig
	mips:mipsel_malta_smp_defconfig
	mips:mipsel_malta64_smp_defconfig
	powerpc:mpc8544ds:mpc85xx_defconfig
	powerpc:mpc8544ds:mpc85xx_smp_defconfig
	powerpc:nosmp:ppc64_e5500_defconfig
	powerpc:smp:ppc64_e5500_defconfig

Details are available at http://kerneltests.org/builders.

Guenter
