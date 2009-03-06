From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: rr tree build failure
Date: Fri, 6 Mar 2009 15:53:44 +1030
Message-ID: <200903061553.44675.rusty@rustcorp.com.au>
References: <20090305193352.bb6969cb.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:35520 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752019AbZCFFYf (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 6 Mar 2009 00:24:35 -0500
In-Reply-To: <20090305193352.bb6969cb.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, David Miller <davem@davemloft.net>

On Thursday 05 March 2009 19:03:52 Stephen Rothwell wrote:
> Hi Rusty,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/pci/probe.c: In function 'pci_bus_show_cpuaffinity':
> drivers/pci/probe.c:56: error: 'CPU_MASK_ALL_PTR' undeclared (first use in this function)
> 
> Caused by commit 66ec53ceff39a3daf3b1a3628bca1198bd88c7b3
> ("cpumask:remove-CPU_MASK_ALL_PTR"). 2.6.29-rc2 added cpumask_of_pcibus()
> (which references CPU_MASK_ALL_PTR) to
> arch/sparc/include/asm/topology_64.h .

Hmm, I *did* get that, but somehow lost it from the series file in the patch
shuffle.

cpumask:remove-address-of-CPU_MASK_ALL-sparc.patch

cpumask: remove dangerous CPU_MASK_ALL_PTR, &CPU_MASK_ALL.: sparc

Impact: cleanup

(Thanks to Al Viro for reminding me of this, via Ingo)

CPU_MASK_ALL is the (deprecated) "all bits set" cpumask, defined as so:

	#define CPU_MASK_ALL (cpumask_t) { { ... } }

Taking the address of such a temporary is questionable at best,
unfortunately 321a8e9d (cpumask: add CPU_MASK_ALL_PTR macro) added
CPU_MASK_ALL_PTR:

	#define CPU_MASK_ALL_PTR (&CPU_MASK_ALL)

Which formalizes this practice.  One day gcc could bite us over this
usage (though we seem to have gotten away with it so far).

So replace everywhere which used &CPU_MASK_ALL or CPU_MASK_ALL_PTR
with the modern "cpu_all_mask" (a real struct cpumask *), and remove
CPU_MASK_ALL_PTR altogether.

Also remove the confusing and deprecated large-NR_CPUS-only
"cpu_mask_all".

Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
Acked-by: Ingo Molnar <mingo@elte.hu>
Reported-by: Al Viro <viro@zeniv.linux.org.uk>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Mike Travis <travis@sgi.com>
---
 arch/mips/alchemy/common/time.c      |    2 +-
 arch/sparc/include/asm/topology_64.h |    2 +-
 arch/x86/include/asm/es7000/apic.h   |    2 +-
 arch/x86/include/asm/numaq/apic.h    |    2 +-
 include/linux/cpumask.h              |    6 ------
 init/main.c                          |    7 +------
 kernel/kmod.c                        |    2 +-
 kernel/kthread.c                     |    4 ++--
 mm/pdflush.c                         |    2 +-
 9 files changed, 9 insertions(+), 20 deletions(-)

diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
--- a/arch/sparc/include/asm/topology_64.h
+++ b/arch/sparc/include/asm/topology_64.h
@@ -45,7 +45,7 @@ static inline int pcibus_to_node(struct 
 
 #define cpumask_of_pcibus(bus)	\
 	(pcibus_to_node(bus) == -1 ? \
-	 CPU_MASK_ALL_PTR : \
+	 cpu_all_mask : \
 	 cpumask_of_node(pcibus_to_node(bus)))
 
 #define SD_NODE_INIT (struct sched_domain) {		\
