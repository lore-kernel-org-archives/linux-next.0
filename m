From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the percpu tree with Linus' tree
Date: Fri, 30 Oct 2009 19:20:50 +1100
Message-ID: <20091030192050.06a0f706.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756254AbZJ3IUz@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jiri Kosina <jkosina@suse.cz>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the percpu tree got a conflict in mm/percpu.c
between commit 403a91b1659cb149dbddc5885f892734ae4542d8 ("percpu: allow
pcpu_alloc() to be called with IRQs off") from Linus' tree and commit
0f5e4816dbf38ce9488e611ca2296925c1e90d5e ("percpu: remove some sparse
warnings") from the percpu tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc mm/percpu.c
index d907971,e2e80fc..0000000
--- a/mm/percpu.c
+++ b/mm/percpu.c
@@@ -369,7 -364,8 +367,8 @@@ static struct pcpu_chunk *pcpu_chunk_ad
   * RETURNS:
   * 0 if noop, 1 if successfully extended, -errno on failure.
   */
 -static int pcpu_extend_area_map(struct pcpu_chunk *chunk)
 +static int pcpu_extend_area_map(struct pcpu_chunk *chunk, unsigned long *flags)
+ 	__releases(lock) __acquires(lock)
  {
  	int new_alloc;
  	int *new;
