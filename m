From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree
Date: Tue, 21 Oct 2008 13:55:09 +1100
Message-ID: <20081021135509.9435493b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:36859 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752356AbYJUCzP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 22:55:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Matt Mackall <mpm@selenic.com>, "Rafael J. Wysocki" <rjw@sisk.pl>

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/acpi/sleep.c between commit
3038edabf48f01421c621cb77a712b446d3a5d67 ("x86 ACPI: fix breakage of
resume on 64-bit UP systems with SMP kernel") from Linus' tree and commit
d0d0f7432c9cbd52cb2f31d499f8292b13a7ecac ("x86: remove magic number from
ACPI sleep stack buffer") from the acpi tree.

Just overlapping context.  I fixed it up (see below).
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/acpi/sleep.c
index c44cd6d,55d10cb..0000000
--- a/arch/x86/kernel/acpi/sleep.c
+++ b/arch/x86/kernel/acpi/sleep.c
@@@ -98,9 -97,7 +98,9 @@@ int acpi_save_state_mem(void
  #else /* CONFIG_64BIT */
  	header->trampoline_segment = setup_trampoline() >> 4;
  #ifdef CONFIG_SMP
- 	stack_start.sp = temp_stack + 4096;
+ 	stack_start.sp = temp_stack + sizeof(temp_stack);
 +	early_gdt_descr.address =
 +			(unsigned long)get_cpu_gdt_table(smp_processor_id());
  #endif
  	initial_code = (unsigned long)wakeup_long64;
  	saved_magic = 0x123456789abcdef0;
