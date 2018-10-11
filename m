From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Oct 11
Date: Thu, 11 Oct 2018 06:27:16 -0700
Message-ID: <20181011132716.GA18892@roeck-us.net>
References: <20181011162343.17787168@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181011162343.17787168@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Oct 11, 2018 at 04:23:43PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181010:
> 
> The crypto tree gained conflicts against the mac80211-next tree.
> 
> Non-merge commits (relative to Linus' tree): 9625
>  9096 files changed, 465434 insertions(+), 197078 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Build results:
	total: 135 pass: 123 fail: 12
Failed builds: 
	alpha:allmodconfig 
	arm64:allmodconfig 
	m68k:defconfig 
	m68k:allmodconfig 
	mips:allmodconfig 
	parisc:allmodconfig 
	powerpc:allmodconfig 
	powerpc:ppc6xx_defconfig 
	riscv:defconfig 
	s390:allmodconfig 
	sparc64:allmodconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 318 pass: 277 fail: 41
Failed tests: 
	arm:palmetto-bmc:aspeed_g4_defconfig:aspeed-bmc-opp-palmetto 
	arm:romulus-bmc:aspeed_g5_defconfig:aspeed-bmc-opp-romulus 
	...
	[39 more]

In addition to yesterday's failures, the above two qemu tests crash
silently, ie without console log. That means they crash before the
console is activated and I have not figured out how to get earlycon
to work.

Guenter
