From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the tip tree with the powerpc tree
Date: Wed, 1 Nov 2017 16:53:09 +1100
Message-ID: <20171101165309.515688bc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57511 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750716AbdKAFxL (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 1 Nov 2017 01:53:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michael Bringmann <mwb@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>

Hi all,

Today's linux-next merge of the tip tree got a conflict in:

  arch/powerpc/mm/numa.c

between commit:

  cee5405da402 ("powerpc/hotplug: Improve responsiveness of hotplug change")

from the powerpc tree and commit:

  df7e828c1b69 ("timer: Remove init_timer_deferrable() in favor of timer_setup()")

from the tip tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/mm/numa.c
index eb604b3574fa,73016451f330..000000000000
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@@ -1506,9 -1466,7 +1505,7 @@@ static struct timer_list topology_timer
  
  static void reset_topology_timer(void)
  {
- 	topology_timer.data = 0;
- 	topology_timer.expires = jiffies + topology_timer_secs * HZ;
- 	mod_timer(&topology_timer, topology_timer.expires);
 -	mod_timer(&topology_timer, jiffies + 60 * HZ);
++	mod_timer(&topology_timer, jiffies + topology_timer_secs * HZ);
  }
  
  #ifdef CONFIG_SMP
@@@ -1561,13 -1520,14 +1558,14 @@@ int start_topology_update(void
  			rc = of_reconfig_notifier_register(&dt_update_nb);
  #endif
  		}
 -	} else if (firmware_has_feature(FW_FEATURE_VPHN) &&
 +	}
 +	if (firmware_has_feature(FW_FEATURE_VPHN) &&
  		   lppaca_shared_proc(get_lppaca())) {
  		if (!vphn_enabled) {
 -			prrn_enabled = 0;
  			vphn_enabled = 1;
  			setup_cpu_associativity_change_counters();
- 			init_timer_deferrable(&topology_timer);
+ 			timer_setup(&topology_timer, topology_timer_fn,
+ 				    TIMER_DEFERRABLE);
  			reset_topology_timer();
  		}
  	}
