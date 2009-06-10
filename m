From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Request for linux-next inclusion of the voyager tree
Date: Wed, 10 Jun 2009 17:13:12 +0200 (CEST)
Message-ID: <alpine.LFD.2.00.0906101454420.3367@localhost.localdomain>
References: <1244477423.4079.228.camel@mulgrave.site> <20090609202130.GA5291@elte.hu> <20090610004126.491508c9@lxorguk.ukuu.org.uk> <20090609235647.GE23846@elte.hu> <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from www.tglx.de ([62.245.132.106]:54107 "EHLO www.tglx.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753929AbZFJPNr (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 10 Jun 2009 11:13:47 -0400
In-Reply-To: <alpine.LFD.2.01.0906091702580.6847@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ingo Molnar <mingo@elte.hu>, Alan Cox <alan@lxorguk.ukuu.org.uk>, James Bottomley <James.Bottomley@HansenPartnership.com>, "H. Peter Anvin" <hpa@zytor.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, 9 Jun 2009, Linus Torvalds wrote:
> So give some real reasons. "It's a maintenance nightmare because it does 
> xyz" might be a reason. But then we really need to see the "xyz" part too.

I looked at the patch in detail.

  - 42c72898662a1aed8bf94c6edc8d98ebc00a23a3 breaks xen paravirt guest
    kernels

  - 55c8430e8ec69811f31808251835087abea3e2fe adds new smp_ops, which
    are only necessary for Voyager and can not be optimized out for
    !VOYAGER builds. Also the patch needs to be split in "introduce
    ops" and "use the new ops" parts. Aside of that an analysis
    whether the new smp_ops affect any hotpath operations is missing.

  - 18d3288b053fdf49c062187cb58a50dfef228c70 adds duplicated
    declarations of voyager functions to a generic x86 header, while
    all of them are already declared in some voyager specific header.

  - 6057dbac12b9e85c4814b8e324ccde6e09f00e66 does subtle changes to
    the APIC code, which are neither explained by the changelog nor
    reviewed and acked by the people working on that code.

  - 5c173bb94876e34da1f257e211324424e3b0fc82 modifies the timer
    interrupt. by introducing an extra pointer check even for !VOYAGER
    builds w/o giving a reason for that change. Also adding an
    explicit voyager_timer_interrupt() has nothing to do with the
    x86_quirks model we asked for.

  - the changelogs are partially useless:

    	e.g. f5ef55ae426d811cf6f3650760da3ea526644eef
    	"[VOYAGER] x86/mca: make mca_nmi_hook external
    
	Part of the apic rework brought the mca_nmi_hook to a place where it
    	can't be accessed by architecture specific code.  Publish it again,
    	this time as a settable function vector so that voyager can use it."

    The patch actually does not modify an existing thing, it
    introduces the hook. Also we asked that such quirks should be
    handled via the x86_quirks functionality and not by adding extra
    hooks into the code again.

Aside of that the patch starts with a full revert of the voyager
removal instead of adding the necessary modifications to the x86
generic code in the first place and on top of them the voyager
implementation.

This is exactly the workflow we ask other contributors for as well.

In fact some of the patches are valuable cleanups on their own but
they need to go through us as independent commits on top of which a
non intrusive selfcontained reintroduction of voyager can be done.

Looking at the diffstats of the non voyager related files:

 arch/x86/include/asm/do_timer.h     |   16 -------
 arch/x86/include/asm/entry_arch.h   |   63 -----------------------------
 arch/x86/include/asm/setup_arch.h   |    3 -
 b/MAINTAINERS                       |    6 ++
 b/arch/x86/Kbuild                   |    3 +
 b/arch/x86/Kconfig                  |   14 ++++++
 b/arch/x86/boot/Makefile            |    3 +
 b/arch/x86/boot/a20.c               |    7 +++
 b/arch/x86/boot/boot.h              |    5 +-
 b/arch/x86/boot/main.c              |    5 ++
 b/arch/x86/configs/i386_defconfig   |    3 +
 b/arch/x86/configs/x86_64_defconfig |    3 +
 b/arch/x86/include/asm/Kbuild       |    1 
 b/arch/x86/include/asm/apic.h       |    8 +++
 b/arch/x86/include/asm/bootparam.h  |    5 +-
 b/arch/x86/include/asm/hw_irq.h     |   11 +++++
 b/arch/x86/include/asm/mca.h        |    3 +
 b/arch/x86/include/asm/setup.h      |    7 +--
 b/arch/x86/include/asm/smp.h        |   22 +++++++++-
 b/arch/x86/kernel/apic/apic.c       |    8 +--
 b/arch/x86/kernel/apic/ipi.c        |    2 
 b/arch/x86/kernel/apic/probe_32.c   |    3 +
 b/arch/x86/kernel/apic/summit_32.c  |    4 -
 b/arch/x86/kernel/entry_32.S        |   76 +++++++++++++++++++++++++++++++++++-
 b/arch/x86/kernel/irqinit.c         |   15 +++++--
 b/arch/x86/kernel/mca_32.c          |   12 +++++
 b/arch/x86/kernel/probe_roms_32.c   |    1 
 b/arch/x86/kernel/setup.c           |   35 +++-------------
 b/arch/x86/kernel/smp.c             |    7 +++
 b/arch/x86/kernel/smpboot.c         |    2 
 b/arch/x86/kernel/time_32.c         |   11 +++--
 b/arch/x86/kernel/visws_quirks.c    |    7 ---
 b/arch/x86/lguest/Kconfig           |    1 
 b/arch/x86/xen/Kconfig              |    2 
 b/arch/x86/xen/smp.c                |    7 +++
 b/drivers/lguest/Kconfig            |    2 
 36 files changed, 236 insertions(+), 147 deletions(-)

The voyager related files:

 boot/voyager.c                |   41 +
 include/asm/vic.h             |   61 +
 include/asm/voyager.h         |  553 ++++++++++++++
 include/asm/voyager_bios.h    |   22 
 include/asm/voyager_boot.h    |   27 
 include/asm/voyager_vectors.h |   37 
 mach-voyager/Makefile         |    8 
 mach-voyager/setup.c          |  123 +++
 mach-voyager/voyager_basic.c  |  304 +++++++
 mach-voyager/voyager_cat.c    | 1197 +++++++++++++++++++++++++++++++
 mach-voyager/voyager_smp.c    | 1597 ++++++++++++++++++++++++++++++++++++++++++
 mach-voyager/voyager_thread.c |  131 +++
 12 files changed, 4101 insertions(+)

So while the real voyager stuff lives in 12 new files the patches
changes 36 generic x86 files in subtle areas like boot and SMP
bringup/detection w/o any review of the responsible maintainers.

> Alan is definitely right that we're likely to see more of the "non-PC" 
> platforms as x86 tries to do embedded.

I agree, but the way voyager is done is _not_ a good example for the
embedded x86 folks who will probably start to send in their scoop in
the foreseable future.

I'm not fundamentally against bringing Voyager back, but it needs to
go through a useful patch submission and review process and not by
forcing voyager wreckage into our code base.

I talked to Ingo and he too agrees that we can bring it back under
strict requirements of having a single-.c-file x86_quirks based driver
on top of a clean stack of cleanups and preparatory patches which make
the voyager add on a complete selfcontained plugin.

That's the way we want to deal with the upcoming embedded x86 horror
as well.

I'm going to look at any related patch to which I'm cc'ed on and I
will make sure that the end result is satisfying for all involved
parties.

Thanks,

	tglx
