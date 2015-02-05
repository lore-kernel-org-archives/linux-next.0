From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 4 Feb 2015 17:51:44 -0800
Message-ID: <20150205015144.GT5370@linux.vnet.ibm.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
 <1511573.AlfExlvQsO@vostro.rjw.lan>
 <20150204215357.GL5370@linux.vnet.ibm.com>
 <11131483.LrRNxJumiL@vostro.rjw.lan>
 <20150204235115.GP5370@linux.vnet.ibm.com>
 <20150205001019.GA12362@linux.vnet.ibm.com>
 <CA+icZUUPKNR1ua49NLVGv0i_gu9ZkVrReP_dgAWm8RPVY8Nr+w@mail.gmail.com>
 <20150205005716.GS5370@linux.vnet.ibm.com>
 <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e37.co.us.ibm.com ([32.97.110.158]:36868 "EHLO
	e37.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751798AbbBEBvu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 20:51:50 -0500
Received: from /spool/local
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Wed, 4 Feb 2015 18:51:49 -0700
Content-Disposition: inline
In-Reply-To: <CA+icZUWvBDC0FHX-OXLpjnSBbZceam_9KRBq4tcOM1jpJk0emQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, Dave Hansen <dave@sr71.net>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>

On Thu, Feb 05, 2015 at 02:18:01AM +0100, Sedat Dilek wrote:
> On Thu, Feb 5, 2015 at 1:57 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Thu, Feb 05, 2015 at 01:30:45AM +0100, Sedat Dilek wrote:
> >> On Thu, Feb 5, 2015 at 1:10 AM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> > On Wed, Feb 04, 2015 at 03:51:15PM -0800, Paul E. McKenney wrote:
> >> >> On Wed, Feb 04, 2015 at 11:59:31PM +0100, Rafael J. Wysocki wrote:
> >> >> > On Wednesday, February 04, 2015 01:53:58 PM Paul E. McKenney wrote:
> >> >> > > On Wed, Feb 04, 2015 at 10:54:07PM +0100, Rafael J. Wysocki wrote:
> >> >> > > > On Wednesday, February 04, 2015 09:18:03 PM Sedat Dilek wrote:
> >> >
> >> > [ . . . ]
> >> >
> >> >> > > > > [ 1144.482666] Disabling non-boot CPUs ...
> >> >> > > > > [ 1144.483000] intel_pstate CPU 1 exiting
> >> >> > > > > [ 1144.486064]
> >> >> > > > > [ 1144.486065] ===============================
> >> >> > > > > [ 1144.486067] smpboot: CPU 1 didn't die...
> >> >> > > > > [ 1144.486067] [ INFO: suspicious RCU usage. ]
> >> >> > > > > [ 1144.486069] 3.19.0-rc7-next-20150204.1-iniza-small #1 Not tainted
> >> >> > > > > [ 1144.486070] -------------------------------
> >> >> > > > > [ 1144.486072] include/trace/events/tlb.h:35 suspicious
> >> >> > > > > rcu_dereference_check() usage!
> >> >> > > > > [ 1144.486073]
> >> >> > > > > [ 1144.486073] other info that might help us debug this:
> >> >> > > > > [ 1144.486073]
> >> >> > > > > [ 1144.486074]
> >> >> > > > > [ 1144.486074] RCU used illegally from offline CPU!
> >> >> > > > > [ 1144.486074] rcu_scheduler_active = 1, debug_locks = 0
> >> >> > > > > [ 1144.486076] no locks held by swapper/1/0.
> >> >> > > > > [ 1144.486076]
> >> >> > > > > [ 1144.486076] stack backtrace:
> >> >> > > > > [ 1144.486079] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> >> >> > > > > 3.19.0-rc7-next-20150204.1-iniza-small #1
> >> >> > > > > [ 1144.486080] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
> >> >> > > > > 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
> >> >> > > > > [ 1144.486085]  0000000000000001 ffff88011a44fe18 ffffffff817e370d
> >> >> > > > > 0000000000000011
> >> >> > > > > [ 1144.486088]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6847
> >> >> > > > > ffff8800c66b9600
> >> >> > > > > [ 1144.486091]  0000000000000001 ffff88011a44c000 ffffffff81cb3900
> >> >> > > > > ffff88011a44fe78
> >> >> > > > > [ 1144.486092] Call Trace:
> >> >> > > > > [ 1144.486099]  [<ffffffff817e370d>] dump_stack+0x4c/0x65
> >> >> > > > > [ 1144.486104]  [<ffffffff810d6847>] lockdep_rcu_suspicious+0xe7/0x120
> >> >> > >
> >> >> > > As near as I can tell, idle_task_exit() is running on an offline CPU,
> >> >> > > then calling switch_mm() which contains trace_tlb_flush(), which uses RCU.
> >> >> > > And RCU is objecting to being used from a CPU that it is ignoring.
> >> >> > >
> >> >> > > One approach would be to push RCU's idea of when the CPU goes offline
> >> >> > > down into arch code in this case, using some Kconfig symbol and
> >> >> > > the usual conditional compilation.  Another approach would be to
> >> >> > > invoke the trace calls under cpu_online(), for example, for the
> >> >> > > first such call in switch_mm():
> >> >> > >
> >> >> > >   if (cpu_online(smp_processor_id()))
> >> >> > >           trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >> >> > >
> >> >> > > The compiler would discard this if tracing was disabled.
> >> >> >
> >> >> > That looks like less intrusive to me.
> >> >>
> >> >> One possible concern is increased context-switch path length, but that
> >> >> would only be the case where tracing is enabled by default.
> >> >
> >> > Nevertheless, here is an untested patch.  Does it help?
> >>
> >> No bedtime :-)
> >
> > Sorry!  Actually, getting results tomorrow would be plenty OK by me.
> >
> >> I tried with a revert of...
> >>
> >> commit 5f1dedac9adb6259bb7b62a923bd7c247a2f2d5b
> >> rcu: Handle outgoing CPUs on exit from idle loop
> >>
> >> ...and offlining cpu1 seems not to produce the trace...
> >
> > As expected.  The trace can still appear, but the outgoing CPU needs to
> > be delayed by at least one jiffy on its final pass through the idle loop.
> > Which can really happen in virtualized environments.
> >
> >> [  115.280244] PPP BSD Compression module registered
> >> [  115.288761] PPP Deflate Compression module registered
> >> [  162.935524] intel_pstate CPU 1 exiting
> >> [  162.949729] smpboot: CPU 1 is now offline
> >>
> >> Will try the patch.
> >
> > Looking forward to seeing the results!
> >
> >                                                         Thanx, Paul
> >
> >> - Sedat -
> >>
> >> >
> >> >                                                         Thanx, Paul
> >> >
> >> > ------------------------------------------------------------------------
> >> >
> >> > x86: Omit switch_mm() tracing for offline CPUs
> >> >
> >> > The architecture-specific switch_mm() function can be called by offline
> >> > CPUs, but includes event tracing, which cannot be legally carried out
> >> > on offline CPUs.  This results in a lockdep-RCU splat.  This commit fixes
> >> > this splat by omitting the tracing when the CPU is offline.
> >> >
> >> > Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> >> > Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >> >
> >> > diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
> >> > index 40269a2bf6f9..7e7f2445fbc9 100644
> >> > --- a/arch/x86/include/asm/mmu_context.h
> >> > +++ b/arch/x86/include/asm/mmu_context.h
> >> > @@ -47,7 +47,8 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >> >
> >> >                 /* Re-load page tables */
> >> >                 load_cr3(next->pgd);
> >> > -               trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >> > +               if (cpu_online(smp_processor_id()))
> >> > +                       trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >> >
> >> >                 /* Stop flush ipis for the previous mm */
> >> >                 cpumask_clear_cpu(cpu, mm_cpumask(prev));
> >> > @@ -84,7 +85,8 @@ static inline void switch_mm(struct mm_struct *prev, struct mm_struct *next,
> >> >                          * to make sure to use no freed page tables.
> >> >                          */
> >> >                         load_cr3(next->pgd);
> >> > -                       trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >> > +                       if (cpu_online(smp_processor_id()))
> >> > +                               trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> >> >                         load_LDT_nolock(&next->context);
> >> >                 }
> >> >         }
> >> >
> >>
> >
> 
> [ CC involved people of "culprit" commit ]
> 
> OK, this fixes the issue for me.
> ( Several s/r and offline/online cpu1. )

Very good

> I looked through the commits and the problem seems to be introduced with...
> 
> commit d17d8f9dedb9dd76fd540a5c497101529d9eb25a
> "x86/mm: Add tracepoints for TLB flushes"
> 
> Can you please add a Fixes-tag?
> 
> Fixes: d17d8f9dedb9 ("x86/mm: Add tracepoints for TLB flushes")

Done!

> And maybe label your proposal-patch with "x86/mm:" instead of "x86:"?
> 
> Feel free to add my Tested-by.

Also done!

> Anyway, we should listen to the voices of the involved people.

Definitely -- this is but one way to fix this problem.  It is the simplest,
so it is the one that I am starting with, but if someone has a better idea,
please don't keep it a secret!

> Thanks, Paul!

And many thanks for your testing efforts, especially your late-night
testing efforts!

							Thanx, Paul

> - Sedat -
> 
> [1] http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d17d8f9dedb9dd76fd540a5c497101529d9eb25a
> 
