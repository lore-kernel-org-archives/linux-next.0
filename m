From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: s390 build failure
Date: Fri, 20 Mar 2009 09:24:10 +0100
Message-ID: <20090320092410.30d2bac3@osiris.boeblingen.de.ibm.com>
References: <20090320104208.0cb4b2b5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate6.uk.ibm.com ([195.212.29.139]:53777 "EHLO
	mtagate6.uk.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754771AbZCTIZU (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 20 Mar 2009 04:25:20 -0400
Received: from d06nrmr1407.portsmouth.uk.ibm.com (d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate6.uk.ibm.com (8.14.3/8.13.8) with ESMTP id n2K8ODwK480876
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 08:24:13 GMT
Received: from d06av04.portsmouth.uk.ibm.com (d06av04.portsmouth.uk.ibm.com [9.149.37.216])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v9.2) with ESMTP id n2K8ODwM3481722
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 08:24:13 GMT
Received: from d06av04.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av04.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id n2K8OBeZ007415
	for <linux-next@vger.kernel.org>; Fri, 20 Mar 2009 08:24:13 GMT
In-Reply-To: <20090320104208.0cb4b2b5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

On Fri, 20 Mar 2009 10:42:08 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> The linux-next build for s390 allnoconfig failed like this:
> 
> In file included from arch/s390/include/asm/tlb.h:29,
>                  from arch/s390/mm/pgtable.c:25:
> arch/s390/include/asm/smp.h:95: error: redefinition of 'smp_send_stop'
> include/linux/smp.h:125: error: previous definition of 'smp_send_stop' was here
> 
> Caused by commit d1dedb52acd98bd5e13e1ff4c4d045d58bbd16fe ("panic, smp:
> provide smp_send_stop() wrapper on UP too") from the tip-core tree.

Ingo, could you pick up the patch below?


Subject: [PATCH] s390: remove arch specific smp_send_stop

From: Heiko Carstens <heiko.carstens@de.ibm.com>

Remove arch specific smp_send_stop for !CONFIG_SMP since it conflicts
with a new generic version.

Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
---
 arch/s390/include/asm/smp.h |    6 ------
 1 file changed, 6 deletions(-)

Index: linux-next/arch/s390/include/asm/smp.h
===================================================================
--- linux-next.orig/arch/s390/include/asm/smp.h
+++ linux-next/arch/s390/include/asm/smp.h
@@ -92,12 +92,6 @@ extern void arch_send_call_function_ipi(
 #endif
 
 #ifndef CONFIG_SMP
-static inline void smp_send_stop(void)
-{
-	/* Disable all interrupts/machine checks */
-	__load_psw_mask(psw_kernel_bits & ~PSW_MASK_MCHECK);
-}
-
 #define hard_smp_processor_id()		0
 #define smp_cpu_not_running(cpu)	1
 #endif
