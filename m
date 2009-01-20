From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cpufreq tree with the cpus4096 tree
Date: Tue, 20 Jan 2009 13:47:13 +1100
Message-ID: <20090120134713.1fd5fd3a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56978 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752526AbZATCrV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 Jan 2009 21:47:21 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Jones <davej@redhat.com>
Cc: linux-next@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>

Hi Dave,

Today's linux-next merge of the cpufreq tree got a conflict in
arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c between commit
5cd7376200be7b8bab085557ff5876b04bd84191 ("fix: crash: IP:
__bitmap_intersects+0x48/0x73") from the cpus4096 tree and commit
6fc619dc092a0a159cf5fb46afa52f2f8128b1d4 ("[CPUFREQ] checkpatch cleanups
for acpi-cpufreq") from the cpufreq tree.

Just changing context.  I fixed it up (see below) and can carry the fix
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
index 0192767,cba5c6b..0000000
--- a/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
+++ b/arch/x86/kernel/cpu/cpufreq/acpi-cpufreq.c
@@@ -138,15 -140,13 +140,13 @@@ struct io_addr 
  	u8 bit_width;
  };
  
- typedef union {
- 	struct msr_addr msr;
- 	struct io_addr io;
- } drv_addr_union;
- 
  struct drv_cmd {
  	unsigned int type;
 -	cpumask_var_t mask;
 +	const struct cpumask *mask;
- 	drv_addr_union addr;
+ 	union {
+ 		struct msr_addr msr;
+ 		struct io_addr io;
+ 	} addr;
  	u32 val;
  };
  
