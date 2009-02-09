From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86 tree
Date: Mon, 9 Feb 2009 15:29:26 +1100
Message-ID: <20090209152926.eb828eb2.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42141 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753856AbZBIE32 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2009 23:29:28 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/include/asm/numaq/apic.h between commit
5a44632f77a9c867621f7bf80c233eac75fea672 ("x86, numaq: consolidate code")
from the x86 tree and commit 2bd9413a5deca2b0b764cad0e23dfabd28cbf7fc
("cpumask:remove-address-of-CPU_MASK_ALL") from the rr tree.

The former moved all the code from that file into
arch/x86/mach-generic/numaq.c which was further consolidated into
arch/x86/kernel/numaq_32.c by commit
61b90b7ca10cc65d8b850ab542859dc593e5a381 ("x86, NUMAQ: Consolidate code").

I applied the following patch to the merge of the rr tree and can carry it
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kernel/numaq_32.c b/arch/x86/kernel/numaq_32.c
index 0cc41a1..6ed0834 100644
--- a/arch/x86/kernel/numaq_32.c
+++ b/arch/x86/kernel/numaq_32.c
@@ -363,7 +363,7 @@ numaq_store_NMI_vector(unsigned short *high, unsigned short *low)
 
 static inline const cpumask_t *numaq_target_cpus(void)
 {
-	return &CPU_MASK_ALL;
+	return cpu_all_mask;
 }
 
 static inline unsigned long
