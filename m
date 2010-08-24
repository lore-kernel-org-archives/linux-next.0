From: Christoph Lameter <cl@linux.com>
Subject: Re: linux-next: build failure after merge of the final tree (slab
 tree related)
Date: Tue, 24 Aug 2010 13:53:35 -0500 (CDT)
Message-ID: <alpine.DEB.2.00.1008241352240.5388@router.home>
References: <20100824120714.8918f8de.sfr@canb.auug.org.au> <4C740450.3030000@cs.helsinki.fi> <alpine.DEB.2.00.1008241256280.4763@router.home> <4C741029.7090300@cs.helsinki.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4C741029.7090300@cs.helsinki.fi>
Sender: linux-kernel-owner@vger.kernel.org
To: Pekka Enberg <penberg@cs.helsinki.fi>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, 24 Aug 2010, Pekka Enberg wrote:

> On 24.8.2010 20.59, Christoph Lameter wrote:
> > On Tue, 24 Aug 2010, Pekka Enberg wrote:
> >
> > > Thanks for the report. The problem should be fixed by this commit:
> >
> > Its not that easy. __alloc_percpu falls back to kzalloc() on UP and this
> > can result in unique bootstrap problems with UP since the bootstrap array
> > is no longer there. Does the UP kernel boot?
>
> No, I get this under kvm:

> [    0.000000] Kernel panic - not syncing: Cannot create slab kmem_cache
> size=232 realsize=256 order=0 offset=0 flags=42000

alloc per cpu result in kmalloc which fails.

Tejon: Is there some way we could get a reserved per cpu area under UP
instead of fallback to slab allocations during bootup?
