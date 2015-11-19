From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the audit tree with Linus' tree
Date: Thu, 19 Nov 2015 12:06:15 +1100
Message-ID: <20151119120615.13b6ce0b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Moore <paul@paul-moore.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

Hi Paul,

Today's linux-next merge of the audit tree got a conflict in:

  kernel/audit.c

between commit:

  d0164adc89f6 ("mm, page_alloc: distinguish between being unable to sleep, unwilling to sleep and avoiding waking kswapd")

from Linus' tree and commit:

  14eeba1d242e ("audit: include auditd's threads in audit_log_start() wait exception")

from the audit tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/audit.c
index bc2ff61bc1d6,ca1b9cda2766..000000000000
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@@ -1371,9 -1371,9 +1371,9 @@@ struct audit_buffer *audit_log_start(st
  	if (unlikely(audit_filter_type(type)))
  		return NULL;
  
 -	if (gfp_mask & __GFP_WAIT) {
 +	if (gfp_mask & __GFP_DIRECT_RECLAIM) {
- 		if (audit_pid && audit_pid == current->pid)
+ 		if (audit_pid && audit_pid == current->tgid)
 -			gfp_mask &= ~__GFP_WAIT;
 +			gfp_mask &= ~__GFP_DIRECT_RECLAIM;
  		else
  			reserve = 0;
  	}
