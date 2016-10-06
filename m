From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the percpu
 tree
Date: Thu, 6 Oct 2016 13:43:57 +1100
Message-ID: <20161006134357.06fe5655@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Christoph Lameter <cl@linux-foundation.org>, Ingo Molnar <mingo@elte.hu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, zijun_hu <zijun_hu@htc.com>
List-Id: linux-next.vger.kernel.org

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  mm/percpu.c

between commits:

  93c76b6b2faa ("mm/percpu.c: correct max_distance calculation for pcpu_embed_first_chunk()")
  9b7396624a7b ("mm/percpu.c: fix potential memory leakage for pcpu_embed_first_chunk()")

from the percpu tree and commit:

  567f646230a5 ("mm/percpu.c: correct max_distance calculation for pcpu_embed_first_chunk()")

from the akpm-current tree.

There is one small differenve between 567f646230a5 and 9b7396624a7b and
then further changes in 93c76b6b2faa.

I fixed it up (using the percpu tree version) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
