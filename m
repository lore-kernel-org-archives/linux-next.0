From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for May 7 (openrisc, sparc qemu BUG due to
 'hrtimer: Get rid of hrtimer softirq')
Date: Thu, 7 May 2015 18:54:22 -0700
Message-ID: <20150508015422.GB26772@roeck-us.net>
References: <20150507164715.4eec2e84@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44653 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751384AbbEHBy2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2015 21:54:28 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.85)
	(envelope-from <linux@roeck-us.net>)
	id 1YqXUi-0034Vw-9R
	for linux-next@vger.kernel.org; Fri, 08 May 2015 01:54:28 +0000
Content-Disposition: inline
In-Reply-To: <20150507164715.4eec2e84@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jonas Bonn <jonas@southpole.se>, linux@lists.openrisc.net, Thomas Gleixner <tglx@linutronix.de>, "David S. Miller" <davem@davemloft.net>

On Thu, May 07, 2015 at 04:47:15PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20150506:
> 
> The ext4 tree gained a build failure so I used the version from
> next-20150506.
> 
> The vfs tree gained a conflict against the f2fs tree.
> 
> The rcu tree gained conflicts against the tip tree.
> 
> Non-merge commits (relative to Linus' tree): 2460
>  2454 files changed, 114321 insertions(+), 47105 deletions(-)
> 
> ----------------------------------------------------------------------------
> 
Seen when running openrisc target in qemu:

Switched to clocksource openrisc_timer
BUG: failure at kernel/irq_work.c:135/irq_work_run_list()!
Kernel panic - not syncing: BUG!
---[ end Kernel panic - not syncing: BUG!


A similar crash with the same BUG is seen with sparc smp qemu tests.

kernel BUG at kernel/irq_work.c:135!

---

Bisect results (with openrisc):

groeck@server:~/src/linux-next$ git bisect log
# bad: [55a92d585bd9150b7bd06882e0579a943a22c356] Add linux-next specific files for 20150507
# good: [5ebe6afaf0057ac3eaeb98defd5456894b446d22] Linux 4.1-rc2
git bisect start 'HEAD' 'v4.1-rc2'
# good: [3ef136d5df42c848c119a0266b9e5dcae3f3625b] Merge remote-tracking branch 'crypto/master'
git bisect good 3ef136d5df42c848c119a0266b9e5dcae3f3625b
# bad: [568bb11854cb689cbf86f8c4cc53513015de7eef] Merge remote-tracking branch 'tip/auto-latest'
git bisect bad 568bb11854cb689cbf86f8c4cc53513015de7eef
# good: [7ecea282683c4c6e6a10d4ff52592b7967e620c7] Merge remote-tracking branch 'sound-asoc/for-next'
git bisect good 7ecea282683c4c6e6a10d4ff52592b7967e620c7
# bad: [c8e3463dc8205ae221669bb96724cda6aec1d9cd] Merge branch 'x86/apic'
git bisect bad c8e3463dc8205ae221669bb96724cda6aec1d9cd
# good: [bab97bf0d8e9e137c9f3f5f88c70dee0edfc2d2b] Merge branch 'sched/urgent'
git bisect good bab97bf0d8e9e137c9f3f5f88c70dee0edfc2d2b
# good: [ab76085ec0858d4c2707ea0d036db00ef4aee8fd] x86,ioapic: Cleanup irq_trigger/polarity()
git bisect good ab76085ec0858d4c2707ea0d036db00ef4aee8fd
# bad: [ccdd92c17e144c8494f4c94ab85b48d297545cec] rtmutex: Remove bogus hrtimer_active() check
git bisect bad ccdd92c17e144c8494f4c94ab85b48d297545cec
# good: [c320642e1ced3b81592610e374894fea995f475b] timerqueue: Let timerqueue_add/del return information
git bisect good c320642e1ced3b81592610e374894fea995f475b
# bad: [514c2304b4574dae28c3d7c0ad6b9cf296994140] x86: perf: Use hrtimer_start()
git bisect bad 514c2304b4574dae28c3d7c0ad6b9cf296994140
# bad: [afc08b15cc2a3d2c48cbd427be8e0eea05698363] tick: sched: Remove hrtimer_active() checks
git bisect bad afc08b15cc2a3d2c48cbd427be8e0eea05698363
# good: [895bdfa793f6e912d1a58fc445b3dd4d686f7bd3] hrtimer: Keep pointer to first timer and simplify __remove_hrtimer()
git bisect good 895bdfa793f6e912d1a58fc445b3dd4d686f7bd3
# bad: [c6eb3f70d4482806dc2d3e1e3c7736f497b1d418] hrtimer: Get rid of hrtimer softirq
git bisect bad c6eb3f70d4482806dc2d3e1e3c7736f497b1d418
# first bad commit: [c6eb3f70d4482806dc2d3e1e3c7736f497b1d418] hrtimer: Get rid of hrtimer softirq

Guenter
