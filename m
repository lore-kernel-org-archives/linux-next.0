From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Mon, 3 Oct 2016 12:29:42 +1100
Message-ID: <20161003122942.492ff09c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Juergen Gross <jgross@suse.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, David Vrabel <david.vrabel@citrix.com>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  include/linux/cpuhotplug.h

between commit:

  dfc616d8b3df ("cpuidle/coupled: Convert to hotplug state machine")
  68e694dcef24 ("powerpc/powermac: Convert to hotplug state machine")
  da3ed6519b19 ("powerpc/mmu nohash: Convert to hotplug state machine")

from the tip tree and commits:

  4d737042d6c4 ("xen/x86: Convert to hotplug state machine")
  c8761e2016aa ("xen/events: Convert to hotplug state machine")

from the xen-tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc include/linux/cpuhotplug.h
index a8ffc405f915,5f603166831c..000000000000
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@@ -36,20 -20,11 +36,22 @@@ enum cpuhp_state 
  	CPUHP_PROFILE_PREPARE,
  	CPUHP_X2APIC_PREPARE,
  	CPUHP_SMPCFD_PREPARE,
 +	CPUHP_RELAY_PREPARE,
 +	CPUHP_SLAB_PREPARE,
 +	CPUHP_MD_RAID5_PREPARE,
  	CPUHP_RCUTREE_PREP,
 +	CPUHP_CPUIDLE_COUPLED_PREPARE,
 +	CPUHP_POWERPC_PMAC_PREPARE,
 +	CPUHP_POWERPC_MMU_CTX_PREPARE,
+ 	CPUHP_XEN_PREPARE,
+ 	CPUHP_XEN_EVTCHN_PREPARE,
  	CPUHP_NOTIFY_PREPARE,
 +	CPUHP_ARM_SHMOBILE_SCU_PREPARE,
 +	CPUHP_SH_SH3X_PREPARE,
 +	CPUHP_BLK_MQ_PREPARE,
  	CPUHP_TIMERS_DEAD,
 +	CPUHP_NOTF_ERR_INJ_PREPARE,
 +	CPUHP_MIPS_SOC_PREPARE,
  	CPUHP_BRINGUP_CPU,
  	CPUHP_AP_IDLE_DEAD,
  	CPUHP_AP_OFFLINE,
