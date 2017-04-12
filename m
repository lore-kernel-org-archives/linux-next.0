From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 12 Apr 2017 14:30:21 +1000
Message-ID: <20170412143021.2e3c6209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46151 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750908AbdDLEaY (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 12 Apr 2017 00:30:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/x86/xen/enlighten.c

between commit:

  687d77a5f7b2 ("x86/xen: Update e820 table handling to the new core x86 E820 code")

from the tip tree and commit:

  ca7b75377014 ("x86/xen: split off enlighten_pvh.c")

from the xen-tip tree.

The latter moved the code changed by the former to another file, so I
have applied the following merge fix patch.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Apr 2017 14:27:23 +1000
Subject: [PATCH] x86/xen: merge fix for arch/x86/xen/enlighten.c code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/enlighten_pvh.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 331d7696af45..a4272c8620ce 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -4,6 +4,7 @@
 
 #include <asm/io_apic.h>
 #include <asm/hypervisor.h>
+#include <asm/e820/api.h>
 
 #include <asm/xen/interface.h>
 #include <asm/xen/hypercall.h>
@@ -38,34 +39,32 @@ static void __init init_pvh_bootparams(void)
 
 	memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
-	memmap.nr_entries = ARRAY_SIZE(pvh_bootparams.e820_map);
-	set_xen_guest_handle(memmap.buffer, pvh_bootparams.e820_map);
+	memmap.nr_entries = ARRAY_SIZE(pvh_bootparams.e820_table);
+	set_xen_guest_handle(memmap.buffer, pvh_bootparams.e820_table);
 	rc = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
 	if (rc) {
 		xen_raw_printk("XENMEM_memory_map failed (%d)\n", rc);
 		BUG();
 	}
 
-	if (memmap.nr_entries < E820MAX - 1) {
-		pvh_bootparams.e820_map[memmap.nr_entries].addr =
+	if (memmap.nr_entries < E820_MAX_ENTRIES_ZEROPAGE - 1) {
+		pvh_bootparams.e820_table[memmap.nr_entries].addr =
 			ISA_START_ADDRESS;
-		pvh_bootparams.e820_map[memmap.nr_entries].size =
+		pvh_bootparams.e820_table[memmap.nr_entries].size =
 			ISA_END_ADDRESS - ISA_START_ADDRESS;
-		pvh_bootparams.e820_map[memmap.nr_entries].type =
-			E820_RESERVED;
+		pvh_bootparams.e820_table[memmap.nr_entries].type =
+			E820_TYPE_RESERVED;
 		memmap.nr_entries++;
 	} else
 		xen_raw_printk("Warning: Can fit ISA range into e820\n");
 
-	sanitize_e820_map(pvh_bootparams.e820_map,
-			  ARRAY_SIZE(pvh_bootparams.e820_map),
-			  &memmap.nr_entries);
-
 	pvh_bootparams.e820_entries = memmap.nr_entries;
 	for (i = 0; i < pvh_bootparams.e820_entries; i++)
-		e820_add_region(pvh_bootparams.e820_map[i].addr,
-				pvh_bootparams.e820_map[i].size,
-				pvh_bootparams.e820_map[i].type);
+		e820__range_add(pvh_bootparams.e820_table[i].addr,
+				pvh_bootparams.e820_table[i].size,
+				pvh_bootparams.e820_table[i].type);
+
+	e820__update_table(e820_table);
 
 	pvh_bootparams.hdr.cmd_line_ptr =
 		pvh_start_info.cmdline_paddr;
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
