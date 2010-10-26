From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the swiotlb-xen tree with the tip tree
Date: Tue, 26 Oct 2010 13:03:32 +1100
Message-ID: <20101026130332.002937e5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45841 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755715Ab0JZCDj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Oct 2010 22:03:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jeremy Fitzhardinge <jeremy.fitzhardinge@citrix.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Dirk Brandewie <dirk.j.brandewie@intel.com>

Hi Konrad,

Today's linux-next merge of the swiotlb-xen tree got a conflict in
arch/x86/include/asm/io_apic.h between commit
23f9b267159b4c7ff59d2e6c8ed31693eff841e3 ("x86: apic: Move
probe_nr_irqs_gsi() into ioapic_init_mappings()") from the tip tree and
commit 7b586d71858091f0958e5808b7e3d5390c2ae47d ("x86/io_apic: add
get_nr_irqs_gsi()") from the swiotlb-xen tree.

Just context changes. I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/include/asm/io_apic.h
index 240a0a5,a6b28d0..0000000
--- a/arch/x86/include/asm/io_apic.h
+++ b/arch/x86/include/asm/io_apic.h
@@@ -168,6 -168,9 +168,8 @@@ extern int save_IO_APIC_setup(struct IO
  extern void mask_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries);
  extern int restore_IO_APIC_setup(struct IO_APIC_route_entry **ioapic_entries);
  
 -extern void probe_nr_irqs_gsi(void);
+ extern int get_nr_irqs_gsi(void);
+ 
  extern void setup_ioapic_ids_from_mpc(void);
  
  struct mp_ioapic_gsi{
