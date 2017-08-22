From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 22 Aug 2017 14:13:11 +1000
Message-ID: <20170822141311.6a99b1f6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi all,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/x86/mm/tlb.c

between commit:

  94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")

from the tip tree and commit:

  3ed668659e95 ("membarrier: Document scheduler barrier requirements")

from the rcu tree.

I am pretty sure I have reported this before ... but the latter commit
has been rebased.

I fixed it up (I again just dropped the additional commit in
switch_mm_irqs_off()) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell
