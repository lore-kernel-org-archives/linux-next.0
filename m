From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpu_alloc tree
Date: Tue, 28 Oct 2008 16:58:31 +1100
Message-ID: <20081028165831.ff892db6.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52689 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752294AbYJ1GGE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Oct 2008 02:06:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Christoph,

Today's linux-next merge of the cpu_alloc tree got a conflict in
kernel/lockdep.c between commit d3794979a8a80c222ce9d016a6dfc4bed36965d0
("Zero based percpu: infrastructure to rebase the per cpu area to zero")
from the tip-core tree and commit
67cc04164a030c715717fd70dc935a5298c4034b ("cpualloc: percpu: rename
variables PERCPU_ENOUGH_ROOM -> PERCPU_AREA_SIZE") from the cpu_alloc
tree.

Overlapping changes.  I have fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc kernel/lockdep.c
index e0352c9,a91b26b..0000000
--- a/kernel/lockdep.c
+++ b/kernel/lockdep.c
@@@ -642,8 -638,8 +642,8 @@@ static int static_obj(void *obj
  	 * percpu var?
  	 */
  	for_each_possible_cpu(i) {
 -		start = (unsigned long) &__per_cpu_start + per_cpu_offset(i);
 -		end   = (unsigned long) &__per_cpu_start + PERCPU_AREA_SIZE
 +		start = (unsigned long) __per_cpu_start + per_cpu_offset(i);
- 		end   = (unsigned long) __per_cpu_start + PERCPU_ENOUGH_ROOM
++		end   = (unsigned long) __per_cpu_start + PERCPU_AREA_SIZE
  					+ per_cpu_offset(i);
  
  		if ((addr >= start) && (addr < end))
