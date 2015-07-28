From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Tue, 28 Jul 2015 11:14:40 -0700
Message-ID: <1438107280.2249.81.camel@stgolabs.net>
References: <20150724153334.543cfc7b@canb.auug.org.au>
	 <1437768965.3298.52.camel@stgolabs.net>
	 <20150724230902.GQ3717@linux.vnet.ibm.com> <20150725194739.GA9753@x>
	 <1437859442.3298.68.camel@stgolabs.net> <20150725223524.GA14593@x>
	 <20150727130312.d87e352473dfd8b431c8c07b@linux-foundation.org>
	 <1438028402.25997.58.camel@stgolabs.net> <20150727203110.GB28119@cloud>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42647 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752465AbbG1SOt (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 28 Jul 2015 14:14:49 -0400
In-Reply-To: <20150727203110.GB28119@cloud>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: josh@joshtriplett.org
Cc: Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2015-07-27 at 13:31 -0700, josh@joshtriplett.org wrote:
> That sounds interesting!  mmap_sem is definitely a performance
> bottleneck.  How do you handle writes versus reads?

The idea is to make vmas srcu aware, such that their lookups in the
vmacache are lockless and can survive the entire fault path, among
others we have ->vm_file. We simply handle cases when the
vma/page-tables have changed between when the lookup was done and when
we grab the pte lock with mmap_sem. These invalidations are a pain,
albeit non fatal in some cases.

> 
> > Yes, you can argue that they're not published all you want,
> > but I'm talking beyond my specific use case. Linux VM is known to scale,
> > why should we hide a core scalability tool from it?
> 
> In the case of mmap_sem, does it help at all if tiny kernels were 1)
> non-preemptible and 2) non-SMP?  Tiny kernels don't necessarily care
> about scaling.

Yes, I believe it would! I actually assumed tiny kernels were already
UP. I don't think it makes much sense to have it at that level. Same
with preemption.

Thanks,
Davidlohr
