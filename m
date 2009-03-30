From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the acpi tree with Linus' tree
Date: Mon, 30 Mar 2009 14:20:23 +1100
Message-ID: <20090330142023.2cf5269d.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52583 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751102AbZC3DU2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 29 Mar 2009 23:20:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: linux-next@vger.kernel.org, Dave Jones <davej@redhat.com>, Lin Ming <ming.m.lin@intel.com>

Hi Len,

Today's linux-next merge of the acpi tree got a conflict in
arch/x86/kernel/cpu/cpufreq/longhaul.c between commit
ac617bd0f7b959dc6708ad2f0d6b9dcf4382f1ed ("[CPUFREQ] checkpatch cleanups
for longhaul") from Linus' tree and commit
fb318cbff40964999f303d50bcf541dd9ead6780 ("ACPI: cpufreq: use new bit
register access function") from the acpi tree.

Just a context change.  I fixed it up (see below) and can carry it for a
while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/x86/kernel/cpu/cpufreq/longhaul.c
index f1c51ae,4e18d51..0000000
--- a/arch/x86/kernel/cpu/cpufreq/longhaul.c
+++ b/arch/x86/kernel/cpu/cpufreq/longhaul.c
@@@ -328,10 -326,10 +328,10 @@@ retry_loop
  	case TYPE_POWERSAVER:
  		if (longhaul_flags & USE_ACPI_C3) {
  			/* Don't allow wakeup */
- 			acpi_set_register(ACPI_BITREG_BUS_MASTER_RLD, 0);
+ 			acpi_write_bit_register(ACPI_BITREG_BUS_MASTER_RLD, 0);
 -			do_powersaver(cx->address, clock_ratio_index, dir);
 +			do_powersaver(cx->address, mults_index, dir);
  		} else {
 -			do_powersaver(0, clock_ratio_index, dir);
 +			do_powersaver(0, mults_index, dir);
  		}
  		break;
  	}
@@@ -341,10 -339,10 +341,10 @@@
  		outb(0, 0x22);
  	} else if ((pr != NULL) && pr->flags.bm_control) {
  		/* Enable bus master arbitration */
- 		acpi_set_register(ACPI_BITREG_ARB_DISABLE, 0);
+ 		acpi_write_bit_register(ACPI_BITREG_ARB_DISABLE, 0);
  	}
 -	outb(pic2_mask,0xA1);	/* restore mask */
 -	outb(pic1_mask,0x21);
 +	outb(pic2_mask, 0xA1);	/* restore mask */
 +	outb(pic1_mask, 0x21);
  
  	local_irq_restore(flags);
  	preempt_enable();
