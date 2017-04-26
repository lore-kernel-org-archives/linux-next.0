From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Wed, 26 Apr 2017 14:57:14 +1000
Message-ID: <20170426145714.0dfe8710@canb.auug.org.au>
References: <20170412143021.2e3c6209@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43147 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1035192AbdDZE5R (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 26 Apr 2017 00:57:17 -0400
In-Reply-To: <20170412143021.2e3c6209@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>

Hi all,

On Wed, 12 Apr 2017 14:30:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   arch/x86/xen/enlighten.c
> 
> between commit:
> 
>   687d77a5f7b2 ("x86/xen: Update e820 table handling to the new core x86 E820 code")
> 
> from the tip tree and commit:
> 
>   ca7b75377014 ("x86/xen: split off enlighten_pvh.c")
> 
> from the xen-tip tree.
> 
> The latter moved the code changed by the former to another file, so I
> have applied the following merge fix patch.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

The fix patch now looks like this:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 12 Apr 2017 14:27:23 +1000
Subject: [PATCH] x86/xen: merge fix for arch/x86/xen/enlighten.c code movement

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/x86/xen/enlighten_pvh.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 2bc7d5bb01cf..98ab17673454 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -4,6 +4,7 @@
 
 #include <asm/io_apic.h>
 #include <asm/hypervisor.h>
+#include <asm/e820/api.h>
 
 #include <asm/xen/interface.h>
 #include <asm/xen/hypercall.h>
@@ -37,8 +38,8 @@ static void __init init_pvh_bootparams(void)
 
 	memset(&pvh_bootparams, 0, sizeof(pvh_bootparams));
 
-	memmap.nr_entries = ARRAY_SIZE(pvh_bootparams.e820_map);
-	set_xen_guest_handle(memmap.buffer, pvh_bootparams.e820_map);
+	memmap.nr_entries = ARRAY_SIZE(pvh_bootparams.e820_table);
+	set_xen_guest_handle(memmap.buffer, pvh_bootparams.e820_table);
 	rc = HYPERVISOR_memory_op(XENMEM_memory_map, &memmap);
 	if (rc) {
 		xen_raw_printk("XENMEM_memory_map failed (%d)\n", rc);
@@ -46,13 +47,13 @@ static void __init init_pvh_bootparams(void)
 	}
 	pvh_bootparams.e820_entries = memmap.nr_entries;
 
-	if (pvh_bootparams.e820_entries < E820MAX - 1) {
-		pvh_bootparams.e820_map[pvh_bootparams.e820_entries].addr =
+	if (pvh_bootparams.e820_entries < E820_MAX_ENTRIES_ZEROPAGE - 1) {
+		pvh_bootparams.e820_table[pvh_bootparams.e820_entries].addr =
 			ISA_START_ADDRESS;
-		pvh_bootparams.e820_map[pvh_bootparams.e820_entries].size =
+		pvh_bootparams.e820_table[pvh_bootparams.e820_entries].size =
 			ISA_END_ADDRESS - ISA_START_ADDRESS;
-		pvh_bootparams.e820_map[pvh_bootparams.e820_entries].type =
-			E820_RESERVED;
+		pvh_bootparams.e820_table[pvh_bootparams.e820_entries].type =
+			E820_TYPE_RESERVED;
 		pvh_bootparams.e820_entries++;
 	} else
 		xen_raw_printk("Warning: Can fit ISA range into e820\n");
-- 
2.11.0

-- 
Cheers,
Stephen Rothwell
