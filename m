From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Mon, 31 Jul 2017 09:13:41 -0700
Message-ID: <20170731161341.GG3730@linux.vnet.ibm.com>
References: <20170731135029.479025ea@canb.auug.org.au>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170731135029.479025ea@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jul 31, 2017 at 01:50:29PM +1000, Stephen Rothwell wrote:
> Hi Paul,
> 
> Today's linux-next merge of the rcu tree got a conflict in:
> 
>   arch/x86/mm/tlb.c
> 
> between commit:
> 
>   94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")
> 
> from the tip tree and commit:
> 
>   d7713e8f8b23 ("membarrier: Expedited private command")
> 
> from the rcu tree.
> 
> I fixed it up (the former removed the comment and the load_cr3(), so I
> just dropped the commend change in the latter) and can carry the fix as
> necessary. This is now fixed as far as linux-next is concerned, but any
> non trivial conflicts should be mentioned to your upstream maintainer
> when your tree is submitted for merging.  You may also want to consider
> cooperating with the maintainer of the conflicting tree to minimise any
> particularly complex conflicts.

Thank you, Stephen!

Mathieu, Peter, our commit log reads as if removal of load_cr3() would
simply result in relying on the ordering provided by the atomic ops
in switch_mm() for mm_cpumask(), so that only the commit log and the
comment need changing.

Please let me know if I am missing something here.

							Thanx, Paul
