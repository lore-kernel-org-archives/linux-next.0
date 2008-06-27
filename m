From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree
Date: Fri, 27 Jun 2008 10:47:58 +0200
Message-ID: <20080627084758.GR20851@kernel.dk>
References: <20080627161347.0af905fb.sfr@canb.auug.org.au> <20080627083053.GC6562@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:11360 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755641AbYF0IsA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 27 Jun 2008 04:48:00 -0400
Content-Disposition: inline
In-Reply-To: <20080627083053.GC6562@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, the arch/x86 maintainers <x86@kernel.org>

On Fri, Jun 27 2008, Ingo Molnar wrote:
> 
> * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> 
> > Hi Jens,
> > 
> > Today's linux-next merge of the block tree got a trivial conflict in 
> > include/asm-x86/smp.h between commit 
> > a4c81cf684350797939416c99effb9d3ae46bca6 ("x86: extend e820 ealy_res 
> > support 32bit") from the x86 tree and commit 
> > 3b16cf874861436725c43ba0b68bdd799297be7c ("x86: convert to generic 
> > helpers for IPI function calls") from the block tree.
> > 
> > A case of contextually close deletions.
> 
> Jens, would it be possible for you to prepare a pullable branch for us 
> for the x86 and generic bits of the SMP generic helpers thing - 
> independent of any block tree bits? (it can touch generic code but it 
> should not break the build on other architectures)
> 
> That way we could pull it into tip/x86 and give it some testing on the 
> x86 side, and resolve its integration effects. Would that be possible?

Currently I have two branches for this - one is generic-ipi, which
contains the generic bits and all the arch conversions. The other is
smp_call_function, which kills the unused argument to
smp_call_function() (and friends) and on_each_cpu(). If I separate out
the non-x86 archs, I'll have trouble getting it all in for 2.6.27 as
I'll be on vacation as of july 5th.

So it's not tied in with any block bits, but it does have all archs.
Even if it's a bit of a weird thing to put the whole thing into the x86
tree, I don't mind if we do that. Heck, it's in the block repo to begin
with :-)

So if you could pull:

git://git.kernel.dk/linux-2.6-block.git generic-ipi

and

git://git.kernel.dk/linux-2.6-block.git smp_call_function

and merge them with the x86 changes, that would be fine. It's also the
place where we currently have conflicts due to 32-bit and 64-bit stuff
being merged, so it would help Stephen as well.

-- 
Jens Axboe
