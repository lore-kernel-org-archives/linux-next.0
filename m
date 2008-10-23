From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr tree build failure
Date: Thu, 23 Oct 2008 15:51:59 +1100
Message-ID: <20081023155159.0c12743e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38672 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751853AbYJWFCE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Oct 2008 01:02:04 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, Mike Travis <travis@sgi.com>, Ingo Molnar <mingo@elte.hu>

Hi Rusty,

Today's linux-next build (x86_64 allmodconfig) failed like this:

arch/x86/xen/smp.c: In function 'xen_smp_send_call_function_ipi':
arch/x86/xen/smp.c:423: error: incompatible type for argument 1 of 'xen_send_IPI_mask'
arch/x86/kernel/smp.c: In function 'native_send_call_func_ipi':
arch/x86/kernel/smp.c:140: error: incompatible type for argument 1 of 'genapic->send_IPI_mask'

Caused by a interaction between commit
ae74da38ccdad1c0d724fc9343b917bc63ed6fc3 ("x86: reduce stack requirements
for send_call_func_ipi") from the cpus4096 tree and commit
b93ce7906b8546093696e03e9a3797da8cef2274 ("x86 smp: modify send_IPI_mask
interface to accept cpumask_t pointers") from the rr tree.

Fixed up in the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 23 Oct 2008 15:50:43 +1100
Subject: [PATCH] x86: cpumask change fallout

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/kernel/smp.c |    2 +-
 arch/x86/xen/smp.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/smp.c b/arch/x86/kernel/smp.c
index 7c8a103..f1c7fa4 100644
--- a/arch/x86/kernel/smp.c
+++ b/arch/x86/kernel/smp.c
@@ -137,7 +137,7 @@ void native_send_call_func_ipi(const cpumask_t *mask)
 	    cpus_equal(cpu_online_map, cpu_callout_map))
 		send_IPI_allbutself(CALL_FUNCTION_VECTOR);
 	else
-		send_IPI_mask(*mask, CALL_FUNCTION_VECTOR);
+		send_IPI_mask(mask, CALL_FUNCTION_VECTOR);
 }
 
 static void stop_this_cpu(void *dummy)
diff --git a/arch/x86/xen/smp.c b/arch/x86/xen/smp.c
index c866593..dae8110 100644
--- a/arch/x86/xen/smp.c
+++ b/arch/x86/xen/smp.c
@@ -420,7 +420,7 @@ static void xen_smp_send_call_function_ipi(const cpumask_t *mask)
 {
 	int cpu;
 
-	xen_send_IPI_mask(*mask, XEN_CALL_FUNCTION_VECTOR);
+	xen_send_IPI_mask(mask, XEN_CALL_FUNCTION_VECTOR);
 
 	/* Make sure other vcpus get a chance to run if they need to. */
 	for_each_cpu_mask_nr(cpu, *mask) {
-- 
1.5.6.5
