From: "Vegard Nossum" <vegard.nossum@gmail.com>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 16:07:09 +0200
Message-ID: <19f34abd0806060707x7570c835u4b1837b54dfa36ba@mail.gmail.com>
References: <20080605175217.cee497f3.sfr@canb.auug.org.au>
	 <20080605195604.41623687.akpm@linux-foundation.org>
	 <20080606071707.GB9708@elte.hu>
	 <20080606002957.6329a0ec.akpm@linux-foundation.org>
	 <20080606024811.70db9ab2.akpm@linux-foundation.org>
	 <20080606035413.37f340ef.akpm@linux-foundation.org>
	 <20080606115759.GA29321@elte.hu>
	 <19f34abd0806060533x6d3ff66tc29306143103fc40@mail.gmail.com>
	 <48493CBD.1000202@sgi.com>
	 <19f34abd0806060650q203bef48rd3b20c0cabec4774@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rv-out-0506.google.com ([209.85.198.239]:21503 "EHLO
	rv-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753453AbYFFOHK (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Jun 2008 10:07:10 -0400
Received: by rv-out-0506.google.com with SMTP id l9so1509146rvb.1
        for <linux-next@vger.kernel.org>; Fri, 06 Jun 2008 07:07:09 -0700 (PDT)
In-Reply-To: <19f34abd0806060650q203bef48rd3b20c0cabec4774@mail.gmail.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Jun 6, 2008 at 3:50 PM, Vegard Nossum <vegard.nossum@gmail.com> wrote:
> On Fri, Jun 6, 2008 at 3:33 PM, Mike Travis <travis@sgi.com> wrote:
>> Vegard Nossum wrote:
>>>
>>> I reproced it with gc 4.1.2. I think the error is somewhere in kernel/sched.c.
>>>
>>> static int __build_sched_domains(const cpumask_t *cpu_map,
>>>                                  struct sched_domain_attr *attr)
>>> {
>>> ...
>>>         for (i = 0; i < MAX_NUMNODES; i++) {
>>> ...
>>>                 sg = kmalloc_node(sizeof(struct sched_group), GFP_KERNEL, i);
>>> ...
>>>
>>> This code is calling into the allocator with a spurious value of i,
>>> which causes SLAB to use an index (of 4 in my case) that is out of
>>> bounds for its nodelist array (at least it hasn't been initialized).
>>>
>>> This bit of code (a bit further down, inside the same loop) is also dubious:
>>>
>>>                         sg = kmalloc_node(sizeof(struct sched_group),
>>>                                           GFP_KERNEL, i);
>>>                         if (!sg) {
>>>                                 printk(KERN_WARNING
>>>                                 "Can not alloc domain group for node %d\n", j);
>>>                                 goto error;
>>>                         }
>>>
>>> Where it passes i to kmalloc_node() but reports an allocation for node
>>> j. Which one is correct?
>>>
>
> Hm, I think I'm wrong and the code is correct. However...
>
>>> Hope this helps, will send an update if I find out more.
>>>
>>>
>>> Vegard
>>>
>>
>> Thanks Vegard for tracking this down.  My thoughts were along the same
>> wavelength... ;-)

...

>
> This is a P4 3.0GHz with 1 physical CPU (but HT, so two logical CPUs).
> Yet node 4 is claimed to have a cpu too. That's bogus!
>
> (But I don't think it's an error in sched.c any more, probably the
> code that sets up the node maps.)

Aha.

The error is of course that the node masks for nodes > nr_node_ids are
not valid. While this function ignores that:

cpumask_t *_node_to_cpumask_ptr(int node)
{
        if (node_to_cpumask_map == NULL) {
                printk(KERN_WARNING
                        "_node_to_cpumask_ptr(%d): no node_to_cpumask_map!\n",
                        node);
                dump_stack();
                return &cpu_online_map;
        }
        return &node_to_cpumask_map[node];
}
EXPORT_SYMBOL(_node_to_cpumask_ptr);

Notice the return statement. It needs to check if node < nr_node_ids.


Vegard

-- 
"The animistic metaphor of the bug that maliciously sneaked in while
the programmer was not looking is intellectually dishonest as it
disguises that the error is the programmer's own creation."
	-- E. W. Dijkstra, EWD1036
