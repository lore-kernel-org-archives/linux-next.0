From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rseq tree with Linus' tree
Date: Wed, 15 Nov 2017 15:35:39 +1100
Message-ID: <20171115153539.77e27249@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58641 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756129AbdKOEfm (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 14 Nov 2017 23:35:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

Hi Mathieu,

Today's linux-next merge of the rseq tree got a conflict in:

  kernel/sched/core.c

between commit:

  7863406143d8 ("sched/isolation: Move housekeeping related code to its own file")

from Linus' tree and commit:

  533bd7403b04 ("x86: Introduce sync_core_before_usermode (v2)")

from the rseq tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/sched/core.c
index c85dfb746f8c,43099a091742..000000000000
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@@ -27,7 -26,7 +27,8 @@@
  #include <linux/profile.h>
  #include <linux/security.h>
  #include <linux/syscalls.h>
 +#include <linux/sched/isolation.h>
+ #include <linux/processor.h>
  
  #include <asm/switch_to.h>
  #include <asm/tlb.h>
