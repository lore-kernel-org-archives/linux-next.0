From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xen-tip tree with the tip tree
Date: Mon, 18 Jul 2016 16:17:01 +1000
Message-ID: <20160718161701.473203bb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36289 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750755AbcGRGRH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Jul 2016 02:17:07 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Cochran <rcochran@linutronix.de>, Juergen Gross <jgross@suse.com>, David Vrabel <david.vrabel@citrix.com>

Hi all,

Today's linux-next merge of the xen-tip tree got a conflict in:

  arch/arm/xen/enlighten.c

between commit:

  4761adb6f490 ("arm/xen: Convert to hotplug state machine")

from the tip tree and commit:

  ecb23dc6f2ef ("xen: add steal_clock support on x86")

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

diff --cc arch/arm/xen/enlighten.c
index d822e2313950,2f4c3aa540eb..000000000000
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@@ -334,8 -414,12 +397,8 @@@ static int __init xen_guest_init(void
  		return -EINVAL;
  	}
  
- 	pv_time_ops.steal_clock = xen_stolen_accounting;
- 	static_key_slow_inc(&paravirt_steal_enabled);
 -	xen_percpu_init();
 -
 -	register_cpu_notifier(&xen_cpu_notifier);
 -
+ 	xen_time_setup_guest();
+ 
  	if (xen_initial_domain())
  		pvclock_gtod_register_notifier(&xen_pvclock_gtod_notifier);
  
