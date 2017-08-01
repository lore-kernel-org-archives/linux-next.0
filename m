From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: linux-next: manual merge of the rcu tree with the tip tree
Date: Tue, 1 Aug 2017 00:04:05 +0000 (UTC)
Message-ID: <1145333348.610.1501545845911.JavaMail.zimbra@efficios.com>
References: <20170731135029.479025ea@canb.auug.org.au> <20170731161341.GG3730@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170731161341.GG3730@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Andy Lutomirski <luto@kernel.org>
List-Id: linux-next.vger.kernel.org

----- On Jul 31, 2017, at 12:13 PM, Paul E. McKenney paulmck@linux.vnet.ibm.com wrote:

> On Mon, Jul 31, 2017 at 01:50:29PM +1000, Stephen Rothwell wrote:
>> Hi Paul,
>> 
>> Today's linux-next merge of the rcu tree got a conflict in:
>> 
>>   arch/x86/mm/tlb.c
>> 
>> between commit:
>> 
>>   94b1b03b519b ("x86/mm: Rework lazy TLB mode and TLB freshness tracking")
>> 
>> from the tip tree and commit:
>> 
>>   d7713e8f8b23 ("membarrier: Expedited private command")
>> 
>> from the rcu tree.
>> 
>> I fixed it up (the former removed the comment and the load_cr3(), so I
>> just dropped the commend change in the latter) and can carry the fix as
>> necessary. This is now fixed as far as linux-next is concerned, but any
>> non trivial conflicts should be mentioned to your upstream maintainer
>> when your tree is submitted for merging.  You may also want to consider
>> cooperating with the maintainer of the conflicting tree to minimise any
>> particularly complex conflicts.
> 
> Thank you, Stephen!
> 
> Mathieu, Peter, our commit log reads as if removal of load_cr3() would
> simply result in relying on the ordering provided by the atomic ops
> in switch_mm() for mm_cpumask(), so that only the commit log and the
> comment need changing.
> 
> Please let me know if I am missing something here.

I think you are right. Both load_cr3() and mm_cpumask update operations
(LOCK prefixed) provide the appropriate barriers on x86. So it's just a
matter of adapting the comment to the new reality.

Thanks,

Mathieu

> 
> 							Thanx, Paul

-- 
Mathieu Desnoyers
EfficiOS Inc.
http://www.efficios.com
