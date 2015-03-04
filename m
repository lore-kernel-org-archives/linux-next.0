From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Mar 4 (build failures)
Date: Wed, 4 Mar 2015 08:42:30 -0800
Message-ID: <20150304164230.GA22568@roeck-us.net>
References: <20150304150341.2afe09fe@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150304150341.2afe09fe@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Mar 04, 2015 at 03:03:41PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150303:
> 
> The md tree still had its build failure so I applied a fix patch.
> 
> The mfd tree gained a build failure so I used the version from
> next-20150303.
> 
> The clk tree still had its build failure so I again used the version
> from next-20150225.
> 
> Non-merge commits (relative to Linus' tree): 2315
>  2429 files changed, 70869 insertions(+), 52760 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Lots of build failures today.

Build results:
	total: 121 pass: 94 fail: 27
Failed builds:
	arc:defconfig
	arc:tb10x_defconfig
	arm:s3c2410_defconfig
	arm:davinci_all_defconfig
	arm:axm55xx_defconfig
	arm:keystone_defconfig
	arm:vexpress_defconfig
	arm:at91_dt_defconfig
	arm:sama5_defconfig
	arm:orion5x_defconfig
	arm:cm_x2xx_defconfig
	arm:integrator_defconfig
	arm64:defconfig
	avr32:defconfig
	avr32:merisc_defconfig
	avr32:atngw100mkii_evklcd101_defconfig
	m68k:allmodconfig
	microblaze:mmu_defconfig
	microblaze:nommu_defconfig
	mips:allmodconfig
	openrisc:defconfig
	parisc:generic-32bit_defconfig
	parisc:generic-64bit_defconfig
	powerpc:allmodconfig
	sparc64:allmodconfig
	unicore32:defconfig
	xtensa:allmodconfig

Qemu tests:
	total: 30 pass: 14 fail: 16
Failed tests:
	arm:arm_versatile_defconfig
	arm:arm_vexpress_defconfig
	arm64:arm64_smp_defconfig
	arm64:arm64_nosmp_defconfig
	microblaze:microblaze_defconfig
	microblaze:microblazeel_defconfig
	mips:mips_malta_defconfig
	mips:mips_malta_smp_defconfig
	mips:mipsel_malta_defconfig
	mips:mipsel_malta_smp_defconfig
	mips64:mips_malta64_defconfig
	mips64:mips_malta64_smp_defconfig
	powerpc:ppc_book3s_defconfig
	powerpc:ppc_book3s_smp_defconfig
	powerpc:ppc64_book3s_defconfig
	powerpc:ppc64_book3s_smp_defconfig

There are various errors, related to thermal, bpf, and others.
I don't have time to bisect, unfortunately.

Details are available at http://server.roeck-us.net:8010/builders.

Guenter
