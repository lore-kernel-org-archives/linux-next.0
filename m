From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: linux-next: Tree for Feb 4
Date: Wed, 04 Feb 2015 22:54:07 +0100
Message-ID: <1511573.AlfExlvQsO@vostro.rjw.lan>
References: <20150204193535.58f132c5@canb.auug.org.au> <CA+icZUUGiGDoL5NU8RuxKzFjoLjEKRtUWx=JB8B9a0EQv-eGzQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:50674 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S932213AbbBDVbN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 4 Feb 2015 16:31:13 -0500
In-Reply-To: <CA+icZUUGiGDoL5NU8RuxKzFjoLjEKRtUWx=JB8B9a0EQv-eGzQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>

On Wednesday, February 04, 2015 09:18:03 PM Sedat Dilek wrote:
> On Wed, Feb 4, 2015 at 9:35 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > The next release I will be making will be next-20150209 - which will
> > probably be after the v3.19 release.
> >
> > Changes since 20150203:
> >
> > The sound-asoc tree gained a conflict against the sound tree.
> >
> > The scsi tree gained a build failure caused by an interaction with the
> > driver-core tree.  I applied a merge fix patch.
> >
> > The akpm-current tree gained a build failure for which I disabled
> > CONFIG_KASAN.
> >
> > Non-merge commits (relative to Linus' tree): 7461
> >  7314 files changed, 309736 insertions(+), 172363 deletions(-)
> >
> > ----------------------------------------------------------------------------
> >
> 
> [ CC linux-rcu | linux-pm | intel_pstate maintainers ]

Dirk is not the maintainer of intel_pstate any more, CC: Kristen.

> Hi,
> 
> after suspend-and-resume I see the following call-trace:

Do you see that after CPU1 offline too? 

> ...
> [ 1144.482666] Disabling non-boot CPUs ...
> [ 1144.483000] intel_pstate CPU 1 exiting
> [ 1144.486064]
> [ 1144.486065] ===============================
> [ 1144.486067] smpboot: CPU 1 didn't die...
> [ 1144.486067] [ INFO: suspicious RCU usage. ]
> [ 1144.486069] 3.19.0-rc7-next-20150204.1-iniza-small #1 Not tainted
> [ 1144.486070] -------------------------------
> [ 1144.486072] include/trace/events/tlb.h:35 suspicious
> rcu_dereference_check() usage!
> [ 1144.486073]
> [ 1144.486073] other info that might help us debug this:
> [ 1144.486073]
> [ 1144.486074]
> [ 1144.486074] RCU used illegally from offline CPU!
> [ 1144.486074] rcu_scheduler_active = 1, debug_locks = 0
> [ 1144.486076] no locks held by swapper/1/0.
> [ 1144.486076]
> [ 1144.486076] stack backtrace:
> [ 1144.486079] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 3.19.0-rc7-next-20150204.1-iniza-small #1
> [ 1144.486080] Hardware name: SAMSUNG ELECTRONICS CO., LTD.
> 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
> [ 1144.486085]  0000000000000001 ffff88011a44fe18 ffffffff817e370d
> 0000000000000011
> [ 1144.486088]  ffff88011a448290 ffff88011a44fe48 ffffffff810d6847
> ffff8800c66b9600
> [ 1144.486091]  0000000000000001 ffff88011a44c000 ffffffff81cb3900
> ffff88011a44fe78
> [ 1144.486092] Call Trace:
> [ 1144.486099]  [<ffffffff817e370d>] dump_stack+0x4c/0x65
> [ 1144.486104]  [<ffffffff810d6847>] lockdep_rcu_suspicious+0xe7/0x120
> [ 1144.486109]  [<ffffffff810b71a5>] idle_task_exit+0x205/0x2c0
> [ 1144.486113]  [<ffffffff81054c4e>] play_dead_common+0xe/0x50
> [ 1144.486116]  [<ffffffff81054ca5>] native_play_dead+0x15/0x140
> [ 1144.486121]  [<ffffffff8102963f>] arch_cpu_idle_dead+0xf/0x20
> [ 1144.486123]  [<ffffffff810cd89e>] cpu_startup_entry+0x37e/0x580
> [ 1144.486126]  [<ffffffff81053e20>] start_secondary+0x140/0x150
> [ 1144.502920] intel_pstate CPU 2 exiting
> ...
> 
> Not sure if this comes from the rcu or pm/intel_pstate area.

New intel_pstate commits in linux-next are between 7ab0256e57ae and
a04759924e25 inclusive.  Please check that range first.

If that doesn't point you to the offender, you can pull the linux-next
branch of the linux-pm.git tree at:

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next

and see if that alone triggers the issue for you.  If not, the offender is
not there.  Otherwise, and if you use the ACPI cpuidle driver, you can
check the acpi-processor merge point too.


-- 
I speak only for myself.
Rafael J. Wysocki, Intel Open Source Technology Center.
