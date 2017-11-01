From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the powerpc tree with the powerpc-fixes
 tree
Date: Thu, 2 Nov 2017 08:54:18 +1100
Message-ID: <20171102085418.3272faac@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the powerpc tree got a conflict in:

  arch/powerpc/mm/tlb-radix.c

between commit:

  26e53d5ebe2e ("powerpc/64s/radix: Fix preempt imbalance in TLB flush")

from the powerpc-fixes tree and commit:

  6773027205ea ("powerpc/mm/radix: Drop unneeded NULL check")

from the powerpc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/tlb-radix.c
index d304028641a2,3a07d7a5e2fe..000000000000
--- a/arch/powerpc/mm/tlb-radix.c
+++ b/arch/powerpc/mm/tlb-radix.c
@@@ -359,8 -359,7 +359,8 @@@ void radix__flush_tlb_collapsed_pmd(str
  	unsigned long pid, end;
  
  
- 	pid = mm ? mm->context.id : 0;
+ 	pid = mm->context.id;
 +	preempt_disable();
  	if (unlikely(pid == MMU_NO_CONTEXT))
  		goto no_context;
  
