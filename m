From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: x86 tree build failure
Date: Tue, 17 Jun 2008 08:45:59 +0200
Message-ID: <20080617064559.GA23580@elte.hu>
References: <20080617134615.d70be9f6.sfr@canb.auug.org.au> <20080617055816.GA13556@elte.hu> <20080617060835.GA16162@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55386 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750793AbYFQGqN (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 02:46:13 -0400
Content-Disposition: inline
In-Reply-To: <20080617060835.GA16162@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > | commit d94325315f241f86bd07a2ce113cbf28dc98de72
> > | Author: Ingo Molnar <mingo@elte.hu>
> > | Date:   Thu May 1 09:51:47 2008 +0000
> > |
> > |     acpi-acpi_numa_init-build-fix
> > |
> > |     x86.git testing found the following build error on latest -git:
> > |
> > |     drivers/acpi/numa.c: In function 'acpi_numa_init':
> > |     drivers/acpi/numa.c:226: error: 'NR_NODE_MEMBLKS' undeclared (first use in
> > |     drivers/acpi/numa.c:226: error: (Each undeclared identifier is reported onl
> > |     drivers/acpi/numa.c:226: error: for each function it appears in.)

btw., googling for "error: 'NR_NODE_MEMBLKS' undeclared" jumps straight 
to the patch i posted to lkml long ago.

> note, if you cherry-pick that, you'll also need:
> 
> | commit aca9de453911d095a9701ee6ebbae7fd3d6c7c1e
> | Author: Russ Anderson <rja@sgi.com>
> | Date:   Fri May 16 10:02:06 2008 -0500
> |
> |     acpi: fix boot breakage on Altix

i double-checked that cherry-picking these two out-of-x86-scope fixes 
from a month ago (which we found during -tip build testing) into 
auto-x86-next gets allmodconfig going.

I'm reluctant to permanently put them into the x86 branches though, as 
they are 'out of scope' of arch/x86 and would make the branch eligible 
to be 'pruned' out of linux-next.

the two fixes are attached below.

	Ingo

---------------------->
commit d94325315f241f86bd07a2ce113cbf28dc98de72
Author: Ingo Molnar <mingo@elte.hu>
Date:   Thu May 1 09:51:47 2008 +0000

    acpi-acpi_numa_init-build-fix
    
    x86.git testing found the following build error on latest -git:
    
     drivers/acpi/numa.c: In function 'acpi_numa_init':
     drivers/acpi/numa.c:226: error: 'NR_NODE_MEMBLKS' undeclared (first use in this function)
     drivers/acpi/numa.c:226: error: (Each undeclared identifier is reported only once
     drivers/acpi/numa.c:226: error: for each function it appears in.)
    
    with this config:
    
     http://redhat.com/~mingo/misc/config-Wed_Apr_30_22_42_42_CEST_2008.bad
    
    i suspect we dont want SRAT parsing when CONFIG_HAVE_ARCH_PARSE_SRAT
    is unset - but the fix looks a bit ugly. Perhaps we should define
    NR_NODE_MEMBLKS even in this case and just let the code fall back
    to some sane behavior?
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

diff --git a/drivers/acpi/numa.c b/drivers/acpi/numa.c
index 5d59cb3..8cab8c5 100644
--- a/drivers/acpi/numa.c
+++ b/drivers/acpi/numa.c
@@ -176,6 +176,7 @@ acpi_parse_processor_affinity(struct acpi_subtable_header * header,
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_ARCH_PARSE_SRAT
 static int __init
 acpi_parse_memory_affinity(struct acpi_subtable_header * header,
 			   const unsigned long end)
@@ -193,6 +194,7 @@ acpi_parse_memory_affinity(struct acpi_subtable_header * header,
 
 	return 0;
 }
+#endif
 
 static int __init acpi_parse_srat(struct acpi_table_header *table)
 {
@@ -221,9 +223,11 @@ int __init acpi_numa_init(void)
 	if (!acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat)) {
 		acpi_table_parse_srat(ACPI_SRAT_TYPE_CPU_AFFINITY,
 				      acpi_parse_processor_affinity, NR_CPUS);
+#ifdef CONFIG_HAVE_ARCH_PARSE_SRAT
 		acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 				      acpi_parse_memory_affinity,
 				      NR_NODE_MEMBLKS);
+#endif
 	}
 
 	/* SLIT: System Locality Information Table */

commit aca9de453911d095a9701ee6ebbae7fd3d6c7c1e
Author: Russ Anderson <rja@sgi.com>
Date:   Fri May 16 10:02:06 2008 -0500

    acpi: fix boot breakage on Altix
    
    Signed-off-by: Ingo Molnar <mingo@elte.hu>

diff --git a/arch/ia64/Kconfig b/arch/ia64/Kconfig
index 16be414..1be94eb 100644
--- a/arch/ia64/Kconfig
+++ b/arch/ia64/Kconfig
@@ -60,6 +60,10 @@ config RWSEM_XCHGADD_ALGORITHM
 	bool
 	default y
 
+config HAVE_ARCH_PARSE_SRAT
+	bool
+	default y
+
 config ARCH_HAS_ILOG2_U32
 	bool
 	default n
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 41f7ce7..b426ac5 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -93,7 +93,7 @@ int acpi_parse_mcfg (struct acpi_table_header *header);
 void acpi_table_print_madt_entry (struct acpi_subtable_header *madt);
 
 /* the following four functions are architecture-dependent */
-#ifdef CONFIG_HAVE_ARCH_PARSE_SRAT
+#if defined(CONFIG_HAVE_ARCH_PARSE_SRAT) && !defined(NR_NODE_MEMBLKS)
 #define NR_NODE_MEMBLKS MAX_NUMNODES
 #define acpi_numa_slit_init(slit) do {} while (0)
 #define acpi_numa_processor_affinity_init(pa) do {} while (0)
