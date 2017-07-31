From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Mon, 31 Jul 2017 13:50:29 +1000
Message-ID: <20170731135029.479025ea@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37965 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751615AbdGaDuc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Jul 2017 23:50:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/x86/mm/tlb.c

between commit:

  94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")

from the tip tree and commit:

  d7713e8f8b23 ("membarrier: Expedited private command")

from the rcu tree.

I fixed it up (the former removed the comment and the load_cr3(), so I
just dropped the commend change in the latter) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.



-- 
Cheers,
Stephen Rothwell
