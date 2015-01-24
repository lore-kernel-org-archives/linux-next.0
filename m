From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: mmotm 2015-01-22-15-04: qemu failure due to 'mm: memcontrol:
 remove unnecessary soft limit tree node test'
Date: Fri, 23 Jan 2015 18:02:29 -0800
Message-ID: <54C2FD35.9070803@roeck-us.net>
References: <54c1822d.RtdGfWPekQVAw8Ly%akpm@linux-foundation.org> <20150123050802.GB22751@roeck-us.net> <20150123141817.GA22926@phnom.home.cmpxchg.org> <alpine.DEB.2.11.1501230908560.15325@gentwo.org> <20150123160204.GA32592@phnom.home.cmpxchg.org> <54C27E07.6000908@roeck-us.net> <20150123173659.GB12036@phnom.home.cmpxchg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33864 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752472AbbAXCCm (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 23 Jan 2015 21:02:42 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YEq3e-001sbJ-9d
	for linux-next@vger.kernel.org; Sat, 24 Jan 2015 02:02:42 +0000
In-Reply-To: <20150123173659.GB12036@phnom.home.cmpxchg.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Christoph Lameter <cl@linux.com>, akpm@linux-foundation.org, mm-commits@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, mhocko@suse.cz

On 01/23/2015 09:36 AM, Johannes Weiner wrote:
> On Fri, Jan 23, 2015 at 08:59:51AM -0800, Guenter Roeck wrote:
>> On 01/23/2015 08:02 AM, Johannes Weiner wrote:
>>> On Fri, Jan 23, 2015 at 09:17:44AM -0600, Christoph Lameter wrote:
>>>> On Fri, 23 Jan 2015, Johannes Weiner wrote:
>>>>
>>>>> Is the assumption of this patch wrong?  Does the specified node have
>>>>> to be online for the fallback to work?
>>>>
>>>> Nodes that are offline have no control structures allocated and thus
>>>> allocations will likely segfault when the address of the controls
>>>> structure for the node is accessed.
>>>>
>>>> If we wanted to prevent that then every allocation would have to add a
>>>> check to see if the nodes are online which would impact performance.
>>>
>>> Okay, that makes sense, thank you.
>>>
>>> Andrew, can you please drop this patch?
>>>
>> Problem is that there are three patches.
>>
>> 2537ffb mm: memcontrol: consolidate swap controller code
>> 2f9b346 mm: memcontrol: consolidate memory controller initialization
>> a40d0d2 mm: memcontrol: remove unnecessary soft limit tree node test
>>
>> Reverting (or dropping) a40d0d2 alone is not possible since it modifies
>> mem_cgroup_soft_limit_tree_init which is removed by 2f9b346.
>
> ("mm: memcontrol: consolidate swap controller code") gave me no issues
> when rebasing, but ("mm: memcontrol: consolidate memory controller
> initialization") needs updating.
>
> So how about this one to replace ("mm: memcontrol: remove unnecessary
> soft limit tree node test"):
>
> ---
> From: Johannes Weiner <hannes@cmpxchg.org>
> Subject: [patch] mm: memcontrol: simplify soft limit tree init code
>
> - No need to test the node for N_MEMORY.  node_online() is enough for
>    node fallback to work in slab, use NUMA_NO_NODE for everything else.
>
> - Remove the BUG_ON() for allocation failure.  A NULL pointer crash is
>    just as descriptive, and the absent return value check is obvious.
>
> - Move local variables to the inner-most blocks.
>
> - Point to the tree structure after its initialized, not before, it's
>    just more logical that way.
>
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>

The latest version in mmotm passes my ppc64 qemu test, so it works
at least in this context.

Tested-by: Guenter Roeck <linux@roeck-us.net>
