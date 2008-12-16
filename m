From: Mike Travis <travis@sgi.com>
Subject: Re: linux-next: manual merge of the rr_cpumask tree
Date: Mon, 15 Dec 2008 22:02:25 -0800
Message-ID: <49474471.2090409@sgi.com>
References: <20081215170945.b91f3b9c.sfr@canb.auug.org.au> <200812151711.36134.rusty@rustcorp.com.au> <4946855D.7070403@sgi.com> <200812161610.58496.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:33119 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752439AbYLPGC3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Dec 2008 01:02:29 -0500
In-Reply-To: <200812161610.58496.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Yinghai Lu <yinghai@kernel.org>, Ingo Molnar <mingo@elte.hu>

Rusty Russell wrote:
> On Tuesday 16 December 2008 02:57:09 Mike Travis wrote:
>> Rusty Russell wrote:
>>> On Monday 15 December 2008 16:39:45 Stephen Rothwell wrote:
>>>> Hi Rusty,
>>>>
>>>> Today's linux-next merge of the rr_cpumask tree got a conflict in
>>>> arch/x86/kernel/io_apic.c between commit
>>>> 3145e941fcfe2548fa2270afb1a05bab3a6bc418 ("x86, MSI: pass irq_cfg and
>>>> irq_desc") from the sparseirq tree and commit
>>>> 0de26520c7cabf36e1de090ea8092f011a6106ce ("cpumask: make irq_set_affinity
>>>> () take a const struct cpumask") from the rr_cpumask tree.
>>>>
>>>> There are lots of overlapping changes.  I fixed it up (see below) and can carry the
>>>> fix as necessary.
>>> I have performed this merge before.  The results are in
>>> 	git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-2.6-for-ingo.git
>>>
>>> Ingo, can you pull these into cpus4096?  It's just the cpumask/cpus4096 merge.
>>>
>>> Thanks,
>>> Rusty.
>> Hi Rusty,
>>
>> Did you update your tip/cpus4096 branch?
> 
> No.  As I said, I just did a merge of ingo's 4096 tree with the cpumask tree.
> He should pull that, and then the rest of the x86 patches can go on top.
> 
> Cheers,
> Rusty.

Hi Rusty,

Yes, I did finally figure that out.  Thanks for rebasing the part that Ingo needed
so maybe the rest can be pushed.  There was a problem when the 'for-ingo' tree was
merged as there were mixed up API calls in io_apic.c, but I fixed them in the first
x86 only patch.  I wasn't sure of what else to do.

All the x86 patches build and boot (and test! ;-) on x86_64.  My 32-bit box has gone
into a coma until I can figure out what's up (and the 64-bit box lost it's 32-bit
root partition.)  Since they are pretty much exactly as you had tested last week,
I not expecting any problems.

I'm working through the remainder of your cpumask patches now.

Thanks!
Mike
