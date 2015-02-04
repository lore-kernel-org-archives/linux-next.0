From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 04 Feb 2015 23:59:31 +0100
Message-ID: <11131483.LrRNxJumiL@vostro.rjw.lan>
References: <20150204193535.58f132c5@canb.auug.org.au> <1511573.AlfExlvQsO@vostro.rjw.lan> <20150204215357.GL5370@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:61009 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1161137AbbBDWgh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 17:36:37 -0500
In-Reply-To: <20150204215357.GL5370@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: sedat.dilek@gmail.com, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>

On Wednesday, February 04, 2015 01:53:58 PM Paul E. McKenney wrote:
> On Wed, Feb 04, 2015 at 10:54:07PM +0100, Rafael J. Wysocki wrote:
> > On Wednesday, February 04, 2015 09:18:03 PM Sedat Dilek wrote:
> > > On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > Hi all,
> > > >
> > > > The next release I will be making will be next-20150209 - which will
> > > > probably be after the v3.19 release.
> > > >
> > > > Changes since 20150203:
> > > >
> > > > The sound-asoc tree gained a conflict against the sound tree.
> > > >
> > > > The scsi tree gained a build failure caused by an interaction with the
> > > > driver-core tree.  I applied a merge fix patch.
> > > >
> > > > The akpm-current tree gained a build failure for which I disabled
> > > > CONFIG_KASAN.
> > > >
> > > > Non-merge commits (relative to Linus' tree): 7461
> > > >  7314 files changed, 309736 insertions(+), 172363 deletions(-)
> > > >
> > > > ----------------------------------------------------------------------------
> > > >
> > > 
> > > [ CC linux-rcu | linux-pm | intel_pstate maintainers ]
> > 
> > Dirk is not the maintainer of intel_pstate any more, CC: Kristen.
> > 
> > > Hi,
> > > 
> > > after suspend-and-resume I see the following call-trace:
> > 
> > Do you see that after CPU1 offline too? 
> > 
> > > ...
> > > [ 1144.482666] Disabling non-boot CPUs ...
> > > [ 1144.483000] intel_pstate CPU 1 exiting
> > > [ 1144.486064]
> > > [ 1144.486065] ===============================
> > > [ 1144.486067] smpboot: CPU 1 didn't die...
> > > [ 1144.486067] [ INFO: suspicious RCU usage. ]
> > > [ 1144.486069] 3.19.0-rc7-next-20150204.1-iniza-small #1 Not tainted
> > > [ 1144.486070] -------------------------------
> > > [ 1144.486072] include/trace/events/tlb.h:35 suspicious
> > > rcu_dereference_check() usage!
> > > [ 1144.486073]
> > > [ 1144.486073] other info that might help us debug this:
> > > [ 1144.486073]
> > > [ 1144.486074]
> > > [ 1144.486074] RCU used illegally from offline CPU!
> > > [ 1144.486074] rcu_scheduler_active = 1, debug_locks = 0
> > > [ 1144.486076] no locks held by swapper/1/0.
> > > [ 1144.486076]
> > > [ 1144.486076] stack backtrace:
> > > [ 1144.486079] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> > > 3.19.0-rc7-next-20150204.1-iniza-small #1
> > > [ 1144.486080] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
> > > 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
> > > [ 1144.486085]  0000000000000001 ffff88011a44fe18 ffffffff817e370d
> > > 0000000000000011
> > > [ 1144.486088]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6847
> > > ffff8800c66b9600
> > > [ 1144.486091]  0000000000000001 ffff88011a44c000 ffffffff81cb3900
> > > ffff88011a44fe78
> > > [ 1144.486092] Call Trace:
> > > [ 1144.486099]  [<ffffffff817e370d>] dump_stack+0x4c/0x65
> > > [ 1144.486104]  [<ffffffff810d6847>] lockdep_rcu_suspicious+0xe7/0x120
> 
> As near as I can tell, idle_task_exit() is running on an offline CPU,
> then calling switch_mm() which contains trace_tlb_flush(), which uses RCU.
> And RCU is objecting to being used from a CPU that it is ignoring.
> 
> One approach would be to push RCU's idea of when the CPU goes offline
> down into arch code in this case, using some Kconfig symbol and
> the usual conditional compilation.  Another approach would be to
> invoke the trace calls under cpu_online(), for example, for the
> first such call in switch_mm():
> 
> 	if (cpu_online(smp_processor_id()))
> 		trace_tlb_flush(TLB_FLUSH_ON_TASK_SWITCH, TLB_FLUSH_ALL);
> 
> The compiler would discard this if tracing was disabled.

That looks like less intrusive to me.

> Other thoughts?

Well, the whole issue here seems to be that common code using RCU is also
useful in places where RCU doesn't want to be used.  Arguably, we can deal
with all of those cases in a whack-a-mole manner, but that doesn't seem to
scale too well.

Rafael
