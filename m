From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the workqueues tree
Date: Thu, 2 Nov 2017 14:34:40 +1100
Message-ID: <20171102143440.67acc666@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48323 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934030AbdKBDem (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 23:34:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tal Shorer <tal.shorer@gmail.com>, Frederic Weisbecker <frederic@kernel.org>

Hi Tejun,

After merging the workqueues tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/workqueue.c: In function 'workqueue_init_early':
kernel/workqueue.c:5561:56: error: 'cpu_isolated_map' undeclared (first use in this function)
  cpumask_andnot(wq_unbound_cpumask, cpu_possible_mask, cpu_isolated_map);
                                                        ^

Caused by commit

  b5149873a0c2 ("workqueue: respect isolated cpus when queueing an unbound work")

interacting with commit

  edb9382175c3 ("sched/isolation: Move isolcpus= handling to the housekeeping code")

from the tip tree.

I am not sure how to fix this, so I have reverted b5149873a0c2 for today.

-- 
Cheers,
Stephen Rothwell
