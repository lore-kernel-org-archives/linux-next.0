From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 12 Apr 2017 16:46:06 +1000
Message-ID: <20170412164606.08578271@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vlastimil Babka <vbabka@suse.cz>, NeilBrown <neilb@suse.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got conflicts in:

  drivers/block/nbd.c
  drivers/scsi/iscsi_tcp.c
  net/core/dev.c
  net/core/sock.c

between commit:

  717a94b5fc70 ("sched/core: Remove 'task' parameter and rename tsk_restore_flags() to current_restore_flags()")

from the tip tree and commit:

  61d5ad5b2e8a ("treewide: convert PF_MEMALLOC manipulations to new helpers")

from the akpm-current tree.

I fixed it up (the latter is just a superset of the former, so I used
that) and can carry the fix as necessary. This is now fixed as far as
linux-next is concerned, but any non trivial conflicts should be mentioned
to your upstream maintainer when your tree is submitted for merging.
You may also want to consider cooperating with the maintainer of the
conflicting tree to minimise any particularly complex conflicts.

It looks like there may be more instances that the latter patch should
update.
-- 
Cheers,
Stephen Rothwell
