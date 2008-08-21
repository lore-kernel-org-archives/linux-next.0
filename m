From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] microcode_amd: fix shift warning
Date: Thu, 21 Aug 2008 13:43:51 -0700
Message-ID: <20080821134351.2b19ac2d.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rgminet01.oracle.com ([148.87.113.118]:57816 "EHLO
	rgminet01.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752762AbYHUUoS (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 21 Aug 2008 16:44:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Peter Oruba <peter.oruba@amd.com>
Cc: x86@kernel.org, linux-next@vger.kernel.org, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

microcode_amd.c uses ">> 32" on a 32-bit value, so gcc warns about that.
The code could use something like this *untested* patch.

linux-next-20080821/arch/x86/kernel/microcode_amd.c:229: warning: right shift count >= width of type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/kernel/microcode_amd.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--- linux-next-20080821.orig/arch/x86/kernel/microcode_amd.c
+++ linux-next-20080821/arch/x86/kernel/microcode_amd.c
@@ -216,6 +216,7 @@ static void apply_microcode_amd(int cpu)
 	unsigned int rev;
 	int cpu_num = raw_smp_processor_id();
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu_num;
+	unsigned long addr;
 
 	/* We should bind the task to the CPU */
 	BUG_ON(cpu_num != cpu);
@@ -225,10 +226,9 @@ static void apply_microcode_amd(int cpu)
 
 	spin_lock_irqsave(&microcode_update_lock, flags);
 
-	edx = (unsigned int)(((unsigned long)
-			      &(uci->mc.mc_amd->hdr.data_code)) >> 32);
-	eax = (unsigned int)(((unsigned long)
-			      &(uci->mc.mc_amd->hdr.data_code)) & 0xffffffffL);
+	addr = (unsigned long)&uci->mc.mc_amd->hdr.data_code;
+	edx = (unsigned int)(((unsigned long)upper_32_bits(addr)));
+	eax = (unsigned int)(((unsigned long)lower_32_bits(addr)));
 
 	asm volatile("movl %0, %%ecx; wrmsr" :
 		     : "i" (0xc0010020), "a" (eax), "d" (edx) : "ecx");


---
~Randy
Linux Plumbers Conference, 17-19 September 2008, Portland, Oregon USA
http://linuxplumbersconf.org/
