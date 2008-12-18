From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 1/4] cpumask: cpu_coregroup_mask(): x86
Date: Thu, 18 Dec 2008 16:44:00 +1030
Message-ID: <200812181644.00796.rusty@rustcorp.com.au>
References: <200812011646.35018.rusty@rustcorp.com.au> <4949831B.2000809@sgi.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:58511 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752144AbYLRGOF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 18 Dec 2008 01:14:05 -0500
In-Reply-To: <4949831B.2000809@sgi.com>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mike Travis <travis@sgi.com>
Cc: Ingo Molnar <mingo@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org, Jack Steiner <steiner@sgi.com>

On Thursday 18 December 2008 09:24:19 Mike Travis wrote:
> Rusty Russell wrote:
> > Like cpu_coregroup_map, but returns a (const) pointer.
> > 
> > (This will go to Ingo separately as part of the x86 series, just
> > airing it here for thoroughness).
> > 
> > Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
> > Signed-off-by: Mike Travis <travis@sgi.com>
> > Cc: Ingo Molnar <mingo@redhat.com>
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

You can't take 4/4 until 2/4 and 3/4 are merged, and since it's not
x86-specific as well, we'll leave it in my tree.

Thanks,
Rusty.
