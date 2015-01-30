From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jan 30 (build failures)
Date: Fri, 30 Jan 2015 09:30:04 -0800
Message-ID: <20150130173004.GB12367@roeck-us.net>
References: <20150130180209.2bd86cc4@canb.auug.org.au>
 <20150130142520.GA6872@roeck-us.net>
 <54CBAAF6.6030106@rempel-privat.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <54CBAAF6.6030106@rempel-privat.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <matthew.r.wilcox@intel.com>, Linus Torvalds <torvalds@linux-foundation.org>, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jan 30, 2015 at 05:01:58PM +0100, Oleksij Rempel wrote:
> Hi Guenter,
> 
> Am 30.01.2015 um 15:25 schrieb Guenter Roeck:
> > On Fri, Jan 30, 2015 at 06:02:09PM +1100, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20150129:
> >>
> >> The arm-soc gained conflicts against the arm-current and arm trees.
> >>
> >> The spi tree gained a build failure for which I reverted a commit.
> >>
> >> Non-merge commits (relative to Linus' tree): 6300
> >>  6348 files changed, 255117 insertions(+), 131620 deletions(-)
> >>
> >> ----------------------------------------------------------------------------
> > 
> > Build failures below. I copied the culprits (including Linus ;-).
> > 
> > Guenter
> > 
> > ===
> > Building arc:defconfig ... failed
> > Building arc:tb10x_defconfig ... failed
> > --------------
> > Error log:
> > arch/arc/mm/fault.c: In function 'do_page_fault':
> > arch/arc/mm/fault.c:164: error: 'VM_FAULT_SIGSEV' undeclared
> > 
> > Typo. Caused by 33692f27597f ("vm: add VM_FAULT_SIGSEGV handling support"),
> > from mainline. I submitted a patch.
> > 
> > ===
> > Building mips:allmodconfig ... failed
> > --------------
> > Error log:
> > 
> > fs/built-in.o: In function `dax_fault':
> > (.text+0x5e284): undefined reference to `copy_user_page'
> > 
> > Caused by 4927b7d77c001 ("dax,ext2: replace the XIP page fault handler with the
> > DAX page fault handler"). Looks like copy_user_page does not exist in mips.
> > 
> > ===
> > Building sparc64:allmodconfig ... failed
> > --------------
> > Error log:
> > drivers/built-in.o: In function `asm9260_timer_init':
> > asm9260_timer.c:(.init.text+0x60d4): undefined reference to `of_io_request_and_map'
> > 
> > Caused by e4940cd76934 ("ARM: clocksource: add asm9260_timer driver").
> > of_io_request_and_map does not exist for the sparc architecture.
> > Maybe that driver should depend on ARM  or at least on !SPARC ?
> 
> White listing will be easiest way. Should i send patch for it, or it is
> better to fixup existing patch?
> 
That depends on you and the clocksource maintainer, really.
Some maintainers don't rebase their branches to fix already applied patches,
others do.

Thanks,
Guenter
