From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Tue, 20 Jun 2017 15:18:49 +1000
Message-ID: <20170620151849.4551ac16@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59363 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750863AbdFTFSw (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 20 Jun 2017 01:18:52 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manfred Spraul <manfred@colorfullife.com>

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/ipc.h

between commit:

  1a12979f61e4 ("randstruct: Mark various structs for randomization")

from the kspp tree and commit:

  893106d6be17 ("ipc: merge ipc_rcu and kern_ipc_perm")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/ipc.h
index ea0eb0b5f98c,5591f055e13f..000000000000
--- a/include/linux/ipc.h
+++ b/include/linux/ipc.h
@@@ -20,6 -20,9 +20,9 @@@ struct kern_ipc_perm 
  	umode_t		mode;
  	unsigned long	seq;
  	void		*security;
+ 
+ 	struct rcu_head rcu;
+ 	atomic_t refcount;
 -} ____cacheline_aligned_in_smp;
 +} ____cacheline_aligned_in_smp __randomize_layout;
  
  #endif /* _LINUX_IPC_H */
