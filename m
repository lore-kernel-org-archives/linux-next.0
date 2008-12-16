From: Mike Travis <travis@sgi.com>
Subject: Re: [PATCH 1/1] cpumask: add alloc_cpumask_var_node
Date: Mon, 15 Dec 2008 19:47:51 -0800
Message-ID: <494724E7.4090701@sgi.com>
References: <49471353.9070204@sgi.com> <20081216143045.2afa85a7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:54410 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752360AbYLPDrx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 15 Dec 2008 22:47:53 -0500
In-Reply-To: <20081216143045.2afa85a7.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, Ingo Molnar <mingo@redhat.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Stephen Rothwell wrote:
> Hi Mike,
> 
> Just some simple comments.
> 
> On Mon, 15 Dec 2008 18:32:51 -0800 Mike Travis <travis@sgi.com> wrote:
>> +/**
>> + * alloc_cpumask_var - return an allocated struct cpumask
>> + * @mask: pointer to cpumask_var_t where the cpumask is returned
>> + * @cpu: GFP_ flags
>        ^^^
> flags

Hmm, even the simplest changes can go awry... ;-)

> 
>> + * alloc_cpumask_var_node - return an allocated struct cpumask on a
>> + * specific node.
>> + * @mask: pointer to cpumask_var_t where the cpumask is returned
>> + * @cpu: GFP_ flags
>        ^^^
> flags

Gotcha.
> 
>> + * @node: node to allocate memory on
>> + *
>> + * Only defined when CONFIG_CPUMASK_OFFSTACK=y, otherwise is
>> + * a nop returning a constant 1 (in <linux/cpumask.h>)
>> + * Returns TRUE if memory allocation succeeded, FALSE otherwise.
>> + */
>> +bool alloc_cpumask_var_node(cpumask_var_t *mask, gfp_t flags, int node)
>> +{
>> +	if (likely(slab_is_available()))
>> +		*mask = kmalloc_node(cpumask_size(), flags, node);
>> +	else {
>> +#ifdef CONFIG_DEBUG_PER_CPU_MAPS
>> +		printk(KERN_ERR
>> +			"=> alloc_cpumask_var_node: kmalloc not available!\n");
>> +		dump_stack();
>> +#endif
>> +		*mask = NULL;
>> +	}
>> +#ifdef CONFIG_DEBUG_PER_CPU_MAPS
>> +	if (!*mask) {
>> +		printk(KERN_ERR "=> alloc_cpumask_var_node: failed!\n");
>> +		dump_stack();
>> +	}
>> +#endif
> 
> So if !slab_is_available() and CONFIG_DEBUG_PER_CPU_MAPS is set, we get
> two stack dumps?

Umm, you're right, one message should suffice... ;-)

Here's one place I discovered it in testing:

[    0.000000] Initializing CPU#0
[    0.000000] RCU-based detection of stalled CPUs is enabled.
[    0.000000] => alloc_cpumask_var: kmalloc not available!
[    0.000000] Pid: 0, comm: swapper Not tainted 2.6.28-rc8-128-defconfig.12151554-00944-g968ea6d
-dirty #21
[    0.000000] Call Trace:
[    0.000000]  [<ffffffff8123b5bb>] alloc_cpumask_var+0x73/0xa7
[    0.000000]  [<ffffffff819197d0>] arch_early_irq_init+0x35/0xc3
[    0.000000]  [<ffffffff8192583d>] early_irq_init+0x57/0x59
[    0.000000]  [<ffffffff8190ab77>] start_kernel+0x1f9/0x3c2
[    0.000000]  [<ffffffff8190a29a>] x86_64_start_reservations+0xa9/0xad
[    0.000000]  [<ffffffff8190a39b>] x86_64_start_kernel+0xda/0xe1
[    0.000000] => alloc_cpumask_var: failed!
<same as above>
...

The message clued me into the fact that the function was allocating
early and needed to be an alloc_bootmem_cpumask_var().
                                                                                                 
> 
>> + * free_cpumask_var - frees memory allocated for a struct cpumask.
>> + * mask: cpumask to free
>       ^
> missing '@'
> 
>> + * free_bootmem_cpumask_var - frees bootmem memory allocated for a struct cpumask.
>> + * mask: cpumask to free
>       ^
> here as well.
> 

Will fix it up and resend.

Thanks!
Mike
