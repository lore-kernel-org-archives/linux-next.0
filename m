From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Fri, 10 Nov 2017 15:33:13 +1100
Message-ID: <20171110153313.5bf67d2e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sasha Levin <alexander.levin@verizon.com>, Frederic Weisbecker <frederic@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  kernel/softirq.c

between commit:

  f71b74bca637 ("irq/softirqs: Use lockdep to assert IRQs are disabled/enabled")

from the tip tree and commit:

  275f9389fa4e ("kmemcheck: rip it out")

from the akpm-current tree.

I fixed it up (the latter removed code modified by the former) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
