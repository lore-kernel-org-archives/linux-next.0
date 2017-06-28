From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the tip tree
Date: Wed, 28 Jun 2017 17:15:39 +1000
Message-ID: <20170628171539.328fe417@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35543 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751225AbdF1HPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 03:15:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rik van Riel <riel@redhat.com>

Hi all,

After merging the tip tree, today's linux-next build (x86_64 allnoconfig)
produced this warning:

kernel/sched/fair.c:2657:9: warning: 'struct sched_domain' declared inside parameter list
         int prev_cpu, int sync)
         ^
/home/sfr/next/next/kernel/sched/fair.c:2657:9: warning: its scope is only this definition or declaration, which is probably not what you want

Introduced by commit

  3fed382b46ba ("sched/numa: Implement NUMA node level wake_affine()")

-- 
Cheers,
Stephen Rothwell
