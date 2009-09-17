From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the blackfin tree with Linus' tree
Date: Thu, 17 Sep 2009 11:26:04 +1000
Message-ID: <20090917112604.acbae122.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:41820 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755435AbZIQB0D (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2009 21:26:03 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Hi Mike,

Today's linux-next merge of the blackfin tree got a conflict in
arch/blackfin/mm/sram-alloc.c between commit
b9bf3121af348d9255f1c917830fe8c2df52efcb ("percpu: use
DEFINE_PER_CPU_SHARED_ALIGNED()") from Linus' tree and commit
40bf94d6d1158fb6d6d67a666e6b16ab6ac3986e ("Blackfin: push SRAM locks down
into related ifdefs") from the blackfin tree.

The latter moved the code that the former modified.  I fixed it up (see
below) and can carry the fix for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/blackfin/mm/sram-alloc.c
index 99e4dbb,e095094..0000000
--- a/arch/blackfin/mm/sram-alloc.c
+++ b/arch/blackfin/mm/sram-alloc.c
@@@ -55,6 -50,7 +50,7 @@@ struct sram_piece 
  	struct sram_piece *next;
  };
  
 -static DEFINE_PER_CPU(spinlock_t, l1sram_lock) ____cacheline_aligned_in_smp;
++static DEFINE_PER_CPU_SHARED_ALIGNED(spinlock_t, l1sram_lock);
  static DEFINE_PER_CPU(struct sram_piece, free_l1_ssram_head);
  static DEFINE_PER_CPU(struct sram_piece, used_l1_ssram_head);
  
@@@ -68,7 -64,12 +64,12 @@@ static DEFINE_PER_CPU(struct sram_piece
  static DEFINE_PER_CPU(struct sram_piece, used_l1_data_B_sram_head);
  #endif
  
+ #if L1_DATA_A_LENGTH || L1_DATA_B_LENGTH
 -static DEFINE_PER_CPU(spinlock_t, l1_data_sram_lock) ____cacheline_aligned_in_smp;
++static DEFINE_PER_CPU_SHARED_ALIGNED(spinlock_t, l1_data_sram_lock);
+ #endif
+ 
  #if L1_CODE_LENGTH != 0
 -static DEFINE_PER_CPU(spinlock_t, l1_inst_sram_lock) ____cacheline_aligned_in_smp;
++static DEFINE_PER_CPU_SHARED_ALIGNED(spinlock_t, l1_inst_sram_lock);
  static DEFINE_PER_CPU(struct sram_piece, free_l1_inst_sram_head);
  static DEFINE_PER_CPU(struct sram_piece, used_l1_inst_sram_head);
  #endif
