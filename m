From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rr tree with the x86 tree
Date: Mon, 9 Feb 2009 15:29:20 +1100
Message-ID: <20090209152920.c194b0e8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42137 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753863AbZBIE3Y (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2009 23:29:24 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next merge of the rr tree got a conflict in
arch/x86/include/asm/es7000/apic.h between commit
018e047f3a98bd8d9e9d78b19bc38415f0c34dd7 ("x86, ES7000: consolidate the
APIC code") from the x86 tree and commit
2bd9413a5deca2b0b764cad0e23dfabd28cbf7fc
("cpumask:remove-address-of-CPU_MASK_ALL") from the rr tree.

The former moved all the code from that file into
arch/x86/mach-generic/es7000.c whcih was itself consolidated into
arch/x86/kernel/es7000_32.c by commit
2e096df8edefad78155bb406a5a86c182b17786e ("x86, ES7000: Consolidate
code") from the x86 tree.

So I added the following patch to the merge of the rr tree and can carry
it as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --git a/arch/x86/kernel/es7000_32.c b/arch/x86/kernel/es7000_32.c
index d6184c1..1c6cabe 100644
--- a/arch/x86/kernel/es7000_32.c
+++ b/arch/x86/kernel/es7000_32.c
@@ -471,7 +471,7 @@ static int es7000_apic_id_registered(void)
 
 static const cpumask_t *target_cpus_cluster(void)
 {
-	return &CPU_MASK_ALL;
+	return cpu_all_mask;
 }
 
 static const cpumask_t *es7000_target_cpus(void)
