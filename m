From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for June 5
Date: Fri, 6 Jun 2008 17:13:08 +0200
Message-ID: <20080606151308.GA9533@elte.hu>
References: <20080606024811.70db9ab2.akpm@linux-foundation.org> <20080606035413.37f340ef.akpm@linux-foundation.org> <20080606115759.GA29321@elte.hu> <19f34abd0806060533x6d3ff66tc29306143103fc40@mail.gmail.com> <48493CBD.1000202@sgi.com> <19f34abd0806060650q203bef48rd3b20c0cabec4774@mail.gmail.com> <19f34abd0806060707x7570c835u4b1837b54dfa36ba@mail.gmail.com> <484947A9.5050804@sgi.com> <19f34abd0806060736m10424455kfbc3e6272d18646e@mail.gmail.com> <20080606145717.GA5300@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1757761AbYFFPNn@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080606145717.GA5300@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
To: Vegard Nossum <vegard.nossum@gmail.com>
Cc: Mike Travis <travis@sgi.com>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


* Ingo Molnar <mingo@elte.hu> wrote:

> > Subject: [PATCH] sched: don't call node_to_cpumask() on nodes > nr_node_ids
> 
> AFAICS this is not yet required for v2.6.26, as the requirement to 
> never iterate to MAX_NUMNODES and call nr_cpus_node() with the index 
> only got introduced by Mike's patch.

note that we already had these changes in tip/cpus4096, the fact that 
PERCPU_DEBUG didnt properly detect the problem was icing on the cake.

	Ingo
