From: Dave Chinner <david@fromorbit.com>
Subject: Re: BUG: sleeping function called from invalid context at
	kernel/rwsem.c:131 XFS? (was: Re: linux-next: Tree for October 17)
Date: Thu, 23 Oct 2008 08:10:28 +1100
Message-ID: <20081022211028.GO18495@disturbed>
References: <20081017203710.GA27187@infradead.org> <20081017135510.7127c4e7@infradead.org> <a4423d670810200758m3cea3841h40988afc8eaf81@mail.gmail.com> <20081020163327.GA15651@infradead.org> <a4423d670810201013w6448cb38w402771799cefb5f5@mail.gmail.com> <20081020223549.GA21152@disturbed> <a4423d670810210442y51b62fc2naf6cb649e6b26942@mail.gmail.com> <20081022075838.GK18495@disturbed> <20081022082550.GM18495@disturbed> <20081022101351.GB11313@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759617AbYJVVKr@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20081022101351.GB11313@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexander Beregalov <a.beregalov@gmail.com>, lachlan@sgi.com, Arjan van de Ven <arjan@infradead.org>, xfs@oss.sgi.com, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Oct 22, 2008 at 06:13:51AM -0400, Christoph Hellwig wrote:
> On Wed, Oct 22, 2008 at 07:25:50PM +1100, Dave Chinner wrote:
> > > Basically the above commit moved xfs_ilock() inside
> > > radix_tree_preload()/radix_tree_preload_end(), which means we are
> > > taking a rwsem() while we have an elevated preempt count. I'll
> > > get a patch out to fix it.
> 
> This really needs a warning.  Then again I don't really understand this
> as the point of radix_tree_preload was that we can do the actual
> radix-tree under a lock, or not?

Right - the preload allows us to do GFP_KERNEL allocations for radix
tree nodes and use a spinlock for inserts into the tree. We could
drop the preload stuff if we initialised the radix tree to use
GFP_ATOMIC allocations for radix tree nodes, but that is more likely
to lead to insert failures under low memory conditions compared to
the preload method.

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com
