From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 09:31:05 -0700
Message-ID: <20170801163105.GY3730@linux.vnet.ibm.com>
References: <20170731135029.479025ea@canb.auug.org.au>
 <20170731161341.GG3730@linux.vnet.ibm.com>
 <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
 <20170801040323.GP3730@linux.vnet.ibm.com>
 <788306045.812.1501561556636.JavaMail.zimbra@efficios.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <788306045.812.1501561556636.JavaMail.zimbra@efficios.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Aug 01, 2017 at 04:25:56AM +0000, Mathieu Desnoyers wrote:
> ----- On Aug 1, 2017, at 12:03 AM, Paul E. McKenney paulmck@linux.vnet.ibm.com wrote:
> 
> > On Tue, Aug 01, 2017 at 12:04:05AM +0000, Mathieu Desnoyers wrote:
> >> ----- On Jul 31, 2017, at 12:13 PM, Paul E. McKenney paulmck@linux.vnet.ibm.com
> >> wrote:
> >> 
> >> > On Mon, Jul 31, 2017 at 01:50:29PM +1000, Stephen Rothwell wrote:
> >> >> Hi Paul,
> >> >> 
> >> >> Today's linux-next merge of the rcu tree got a conflict in:
> >> >> 
> >> >>   arch/x86/mm/tlb.c
> >> >> 
> >> >> between commit:
> >> >> 
> >> >>   94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")
> >> >> 
> >> >> from the tip tree and commit:
> >> >> 
> >> >>   d7713e8f8b23 ("membarrier: Expedited private command")
> >> >> 
> >> >> from the rcu tree.
> >> >> 
> >> >> I fixed it up (the former removed the comment and the load_cr3(), so I
> >> >> just dropped the commend change in the latter) and can carry the fix as
> >> >> necessary. This is now fixed as far as linux-next is concerned, but any
> >> >> non trivial conflicts should be mentioned to your upstream maintainer
> >> >> when your tree is submitted for merging.  You may also want to consider
> >> >> cooperating with the maintainer of the conflicting tree to minimise any
> >> >> particularly complex conflicts.
> >> > 
> >> > Thank you, Stephen!
> >> > 
> >> > Mathieu, Peter, our commit log reads as if removal of load_cr3() would
> >> > simply result in relying on the ordering provided by the atomic ops
> >> > in switch_mm() for mm_cpumask(), so that only the commit log and the
> >> > comment need changing.
> >> > 
> >> > Please let me know if I am missing something here.
> >> 
> >> I think you are right. Both load_cr3() and mm_cpumask update operations
> >> (LOCK prefixed) provide the appropriate barriers on x86. So it's just a
> >> matter of adapting the comment to the new reality.
> > 
> > Like this?
> 
> The updated comment in the commit message looks good, but I would be
> tempted to add a comment in x86 switch_mm_irqs_off() stating the
> following requirement just before the line invoking cpumask_set_cpu():
> 
> /*
>  * The full memory barrier implied by mm_cpumask update operations
>  * is required by the membarrier system call.
>  */

This looks good to me, but I will give the discussion another day or
so to settle out.  ;-)

							Thanx, Paul
