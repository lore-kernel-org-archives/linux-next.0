From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: linux-next: manual merge of the rcu tree with the modules and tip trees
Date: Wed, 24 Jun 2015 09:39:02 +0930
Message-ID: <87a8vqrmqp.fsf@rustcorp.com.au>
References: <20150528172507.31f6fc8c@canb.auug.org.au> <20150624092344.1814c761@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41168 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755009AbbFXAZa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Jun 2015 20:25:30 -0400
In-Reply-To: <20150624092344.1814c761@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi Rusty,
>
> On Thu, 28 May 2015 17:25:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next merge of the rcu tree got a conflict in
>> include/linux/rcupdate.h between commits 0a04b0166929 ("rcu: Move
>> lockless_dereference() out of rcupdate.h") from the modules tree and
>> c1ad348b452a ("tick: Nohz: Rework next timer evaluation") from the tip
>> tree and commits 7d0ae8086b82 ("rcu: Convert ACCESS_ONCE() to
>> READ_ONCE() and WRITE_ONCE()") and 3382adbc1bb8 ("rcu: Eliminate a few
>> CONFIG_RCU_NOCB_CPU_ALL #ifdefs") from the rcu tree.
>> 
>> I fixed it up (see below) and can carry the fix as necessary (no action
>> is required).
>> 
>> I also had to add this merge fix patch:
>> 
>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>> Date: Thu, 28 May 2015 17:20:58 +1000
>> Subject: [PATCH] rcu: merge fix for Convert ACCESS_ONCE() to READ_ONCE() and
>>  WRITE_ONCE()
>> 
>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> ---
>>  include/linux/compiler.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/include/linux/compiler.h b/include/linux/compiler.h
>> index ba91e5c88a32..f7e7235f3a91 100644
>> --- a/include/linux/compiler.h
>> +++ b/include/linux/compiler.h
>> @@ -483,7 +483,7 @@ static __always_inline void __write_once_size(volatile void *p, void *res, int s
>>   */
>>  #define lockless_dereference(p) \
>>  ({ \
>> -	typeof(p) _________p1 = ACCESS_ONCE(p); \
>> +	typeof(p) _________p1 = READ_ONCE(p); \
>>  	smp_read_barrier_depends(); /* Dependency order vs. p above. */ \
>>  	(_________p1); \
>>  })

Good catch.  I've apply this to my modules-next tree now, as it will
work fine pre-merge.

Thanks,
Rusty.
