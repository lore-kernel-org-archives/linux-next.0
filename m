From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the acpi tree
Date: Wed, 25 Jun 2008 21:57:54 +0200
Message-ID: <20080625195754.GA21689@elte.hu>
References: <20080625142034.59b343c7.sfr@canb.auug.org.au> <20080625071508.GA20454@elte.hu> <20080626015918.71a6b4d7.sfr@canb.auug.org.au> <20080625162923.GB6040@elte.hu> <alpine.LFD.1.10.0806251516460.3014@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:36484 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754202AbYFYT6S (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Jun 2008 15:58:18 -0400
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.10.0806251516460.3014@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Len Brown <lenb@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Bob Moore <robert.moore@intel.com>, Yinghai Lu <yhlu.kernel@gmail.com>


* Len Brown <lenb@kernel.org> wrote:

> 
> 
> On Wed, 25 Jun 2008, Ingo Molnar wrote:
> 
> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > On Wed, 25 Jun 2008 09:15:08 +0200 Ingo Molnar <mingo@elte.hu> wrote:
> > > >
> > > > I suspect we cannot really eliminate this particular conflict 
> > > > because the latter change is a (much welcome!) infrastructure 
> > > > cleanup in all things ACPI, the former is an early init 
> > > > refactoring/cleanup that depends on a whole lot of other (non-ACPI) 
> > > > changes in tip/x86/*. It's too late in .26-rc cycle to push the 
> > > > infrastructure cleanup upstream, so i suspect we have to live with 
> > > > this conflict for a while.
> > > 
> > > No problem.  How long can it be until all this is merged in Linus' 
> > > tree anyway? :-)
> > 
> > if Len acks these patches i can do a by-line mini-topic with just these 
> > commits and put them into tip/auto-x86-next. It's Len's call though :-)
> 
> Ingo,
> can you point me tot he patches you'd like me to review/ack?
> 
> I don't understand how you propose to void a linux-next merge conflict 
> -- unless you're going to cherry-pick the ACPICA changes into your 
> tree?

sorry, i was thinking about a different issue - you are right that in 
this case there's little we can do.

I was thinking about these:

 acpi-acpi_numa_init-build-fix
 ia64, acpi: fix Altix boot breakage in ACPI
 acpi: fix boot breakage on Altix

note that this build failure does _not_ occur with current mainline, so 
it's a linux-next issue.

i've prepared a tip/acpi-for-len branch for you so that you can have a 
look at these, you can pull them from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git acpi-for-len

Thanks,

	Ingo

------------------>
Ingo Molnar (1):
      acpi: NR_NODE_MEMBLKS build fix

Russ Anderson (2):
      ia64, acpi: fix Altix boot breakage in ACPI
      acpi: fix boot breakage on Altix, #2

 arch/ia64/Kconfig    |    4 ++++
 drivers/acpi/numa.c  |    4 ++++
 include/linux/acpi.h |    2 +-
 3 files changed, 9 insertions(+), 1 deletions(-)

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
diff --git a/drivers/acpi/numa.c b/drivers/acpi/numa.c
index 658e5f3..0fb4d2a 100644
--- a/drivers/acpi/numa.c
+++ b/drivers/acpi/numa.c
@@ -199,6 +199,7 @@ acpi_parse_processor_affinity(struct acpi_subtable_header * header,
 	return 0;
 }
 
+#ifdef CONFIG_HAVE_ARCH_PARSE_SRAT
 static int __init
 acpi_parse_memory_affinity(struct acpi_subtable_header * header,
 			   const unsigned long end)
@@ -216,6 +217,7 @@ acpi_parse_memory_affinity(struct acpi_subtable_header * header,
 
 	return 0;
 }
+#endif
 
 static int __init acpi_parse_srat(struct acpi_table_header *table)
 {
@@ -244,9 +246,11 @@ int __init acpi_numa_init(void)
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
