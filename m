From: Jason Wessel <jason.wessel@windriver.com>
Subject: Re: linux-next: manual merge of the tip tree with the kgdb tree
Date: Thu, 14 Jan 2010 09:49:51 -0600
Message-ID: <4B4F3D1F.5000100@windriver.com>
References: <20100114161302.285ebe27.sfr@canb.auug.org.au> <20100114092600.GA13503@elte.hu>  <4B4F31D4.1000707@windriver.com> <1263482452.28171.3853.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:57879 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756034Ab0ANPzY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 14 Jan 2010 10:55:24 -0500
In-Reply-To: <1263482452.28171.3853.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rostedt@goodmis.org
Cc: Ingo Molnar <mingo@elte.hu>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Lai Jiangshan <laijs@cn.fujitsu.com>, Fr??d??ric Weisbecker <fweisbec@gmail.com>

Steven Rostedt wrote:
>> Steven Rostedt wrote:
>>
>>     
>>>> On Tue, 2010-01-05 at 23:57 -0600, Jason Wessel wrote:
>>>>         
>>>   
>>>       
>>>>>> Here is another try at adding a dump function for kdb.  I had to
>>>>>> changes some of the static -> global scope in kernel/trace/trace.c in
>>>>>> order to be able to reference other semi-private via "trace.h".
>>>>>>             
>>>>     
>>>>
>>>> Actually, could you write access functions instead. If we make these
>>>> items global in scope, then others will just start accessing them
>>>> directly. I've had this issue before because others have tried to make
>>>> the global_trace visible by all. But that variable may disappear and
>>>> break all that use it.
>>>>
>>>>         
>>>   
>>>       
>> Thanks for the insight.
>>
>> Here is v3.
>>
>> I added a function called trace_init_global_iter().  I'll rename it if
>> you like.  I also changed the ftrace_dump() to make use of it as well
>> so we are more likely to see an issue when it changes if there are
>> more consumers of the function.
>>
>> The other question it brings up is if you want a helper function for
>> the atomic_inc / atomic_dec of the tracing cpus.  That would move that
>> for_each_tracing_cpu macro back into trace.c.
>>     
>
>
> I think the point Ingo is making, is that the changes to the
> kernel/trace directory would best go through the tip tree. This will
> ensure that this change does not have any undesirable effects to other
> parts of tracing that is being worked on.
>
> There's always an issue with having one subsystem depend on changes in
> another subsystem. What I did in the past when PPC needed changes to the
> trace directory, was that I made the changes in the trace code directly
> against Linus's tree in a separate branch. Then the two git repo's (PPC
> and tip) could pull that change in. Which ever one went first to Linus
> would get the required change without causing duplicates.
>
> But since this is the last patch in the series, perhaps it can just go
> directly into tip?
>
>   

It depends if you agree with the changes or not and if this patch is now
in a "ready for merge" state.

The patch is completely self contained and could be merged before or
after the kdb/kgdb change set.  If it is merged into tip or a sub
branch, I just need to know the location of preference.

Some of the kms changes have the same problem as this patch, and they
too might move outside the public kernel debugger git tree.

Thanks,
Jason.
