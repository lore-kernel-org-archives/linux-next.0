From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cgroup tree with the tip tree
Date: Fri, 16 Oct 2015 16:40:21 +1100
Message-ID: <20151016164021.754c1856@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:45565 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752218AbbJPFkX (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 16 Oct 2015 01:40:23 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Kirill Tkhai <ktkhai@odin.com>

Hi Tejun,

Today's linux-next merge of the cgroup tree got conflicts in:

  kernel/events/core.c
  kernel/sched/core.c

between commits:

  516792e67c39 ("perf/core: Delete PF_EXITING checks from perf_cgroup_exit() callback")
  446685e9bfa1 ("sched/core: Delete PF_EXITING checks from cpu_cgroup_exit() callback")

from the tip tree and commit:

  2e91fa7f6d45 ("cgroup: keep zombies associated with their original cgroups")

from the cgroup tree.

I fixed it up (the latter removed the two functions that were modified
by the former 2 commits) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
