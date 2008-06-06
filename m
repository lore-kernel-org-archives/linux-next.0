From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 12:47:01 +0200
Message-ID: <20080606104701.GA9639@elte.hu>
References: <20080605195604.41623687.akpm@linux-foundation.org> <20080606071707.GB9708@elte.hu> <20080606072536.GA19334@elte.hu> <20080606003327.9ac0e91b.akpm@linux-foundation.org> <20080606074137.GA28962@elte.hu> <20080606004743.a78180c3.akpm@linux-foundation.org> <20080606082325.GA10826@elte.hu> <20080606013835.8dfd838b.akpm@linux-foundation.org> <20080606084949.GA28190@elte.hu> <20080606020109.c0db7a0c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756090AbYFFKri@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080606020109.c0db7a0c.akpm@linux-foundation.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>
List-Id: linux-next.vger.kernel.org


* Andrew Morton <akpm@linux-foundation.org> wrote:

> > what do you mean? We are testing commits that everybody will run and 
> > are pre-filtering them for sanity and stability before they hit 
> > linux-next.
> 
> One doesn't test commits - one tests a tree.  And the -tip tree is 
> 2.6.26-rc5 plus a bunch of x86 changes. [...]

no, 90%+ of all bugs are not due to tree interaction effects but are 
caused by individual commits, triggerable on a particular 
system/workload. (Our historic regression list is the proof for that, 
can give you itemized statistics if you want.)

also, the -tip tree is not "2.6.26-rc5 plus a bunch of x86 changes" but 
v2.6.26-rc5-84-g39b945a plus 75 topic trees we maintain:

build, core/futex-64bit, core/kill-the-BKL, core/locking, core/percpu, 
core/printk, core/rcu, core/rodata, core/softirq, core/softlockup, 
core/stacktrace, core/urgent, cpus4096, genirq, hrtimers, kmemcheck, 
out-of-tree, pci-for-jesse, safe-poison-pointers, sched, sched-devel, 
scratch, stackprotector, timers/clockevents, timers/hpet, 
timers/hrtimers, timers/nohz, timers/posixtimers, tip, tracing/ftrace, 
tracing/ftrace-mergefixups, tracing/immediates, tracing/markers, 
tracing/mmiotrace, tracing/mmiotrace-mergefixups, tracing/nmisafe, 
tracing/sched_markers, tracing/stopmachine-allcpus, tracing/sysprof, 
tracing/textedit, x86/apic, x86/apm, x86/bitops, x86/build, x86/checkme, 
x86/cleanups, x86/cpa, x86/cpu, x86/defconfig, x86/gart, x86/i8259, 
x86/intel, x86/irq, x86/irqstats, x86/kconfig, x86/ldt, x86/mce, 
x86/memtest, x86/mmio, x86/mpparse, x86/nmi, x86/numa, x86/numa-fixes, 
x86/pat, x86/pebs, x86/ptemask, x86/resumetrace, x86/scratch, x86/setup, 
x86/threadinfo, x86/timers, x86/urgent, x86/uv, x86/vdso, x86/xen, 
x86/xsave.

most of which are in linux-next (around 70%), or will be shortly in 
linux-next (more than 90%).

> [...]  That tree will never be run by anyone.  Testing -tip fails to 
> pick up problems which are caused by integration of the x86 changes 
> with everyone else's work and it fails to pick up problems which lie 
> wholly outside the x86 changes.

that's wrong, and here's a very clear counter-example: 95% of the trees 
we all test during a bisection session is executed for the first time 
ever and wont ever be run by anyone else. If the integration aspects 
mattered as much as you claim then bisection would almost never work in 
practice.

Dont get me wrong, integration _does_ matter (and hence we do it 
ourselves, instead of dumping 70+ trees on you!), but the reality is 
that 90% of the bugs are introduced by a single commit and go away if 
the change done by that commit is removed.

The real benefit of integration is not the technical effects of 
integration but the testing effects: people are enabled to test more 
commits at once.

> For both these reasons it would be more valuable were that testing 
> effort to be expended on our 2.6.27 candidate tree.

but that's blatantly wrong: my testing would only be wasted if my test 
capacity was unused. In reality it's fully utilized: half of it is spent 
on general upstream problems we trigger [9381 commits since v2.6.25 and 
counting], the other half of it is spent on our incoming -tip flow of 
patches for v2.6.27 [750 commits and counting].

If there's spare capacity we do volunteer to debug whatever problem that 
comes up. In fact i'd say i still test way more than i should ;-)

> Plus, of course, there's the risk that linux-next contains x86-only 
> regressions which were fixed or avoided in -tip.

there's risk from every single line of source code difference. There's 
risk from having just a single binary bit of difference between two 
user-space installations. The question is always the amount of risk and 
how to manage that risk.

	Ingo
