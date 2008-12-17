From: Mike Travis <travis@sgi.com>
Subject: Re: [PATCH 1/4] cpumask: cpu_coregroup_mask(): x86
Date: Wed, 17 Dec 2008 15:02:54 -0800
Message-ID: <4949851E.5000304@sgi.com>
References: <200812011646.35018.rusty@rustcorp.com.au> <4949831B.2000809@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay2.sgi.com ([192.48.179.30]:39976 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752187AbYLQXC4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Dec 2008 18:02:56 -0500
In-Reply-To: <4949831B.2000809@sgi.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Ingo Molnar <mingo@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Jack Steiner <steiner@sgi.com>

Mike Travis wrote:
> Rusty Russell wrote:
>> Like cpu_coregroup_map, but returns a (const) pointer.
>>
>> (This will go to Ingo separately as part of the x86 series, just
>> airing it here for thoroughness).
>>
>> Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
>> Signed-off-by: Mike Travis <travis@sgi.com>
>> Cc: Ingo Molnar <mingo@redhat.com>
> 
> I've pulled this patch into the queue for my cpus4096-for-ingo tree.
> 
> 	[PATCH 1/4] cpumask: cpu_coregroup_mask(): x86
> 
> I can also line up a queue for sched related changes:
> 
> 	[PATCH 4/4] cpumask: Replace cpu_coregroup_map with cpu_coregroup_map()
> 
> Is there any status on the corresponding changes for sparc, s390?  (I assume
> that they'll need to be merged into linux-next?)
> 
> 	[PATCH 2/4] cpumask: cpu_coregroup_mask(): sparc
> 	[PATCH 3/4] cpumask: cpu_coregroup_mask(): s390

Oops, never mind.  I just noticed that all 4 have already been pushed via
linux-next.

Ingo - how do we get these back into -tip for testing with other cpus4096
changes?  Do I need to do anything?

Thanks,
Mike
