From: Jason Gunthorpe <jgg@mellanox.com>
Subject: Re: linux-next: manual merge of the block tree with the rdma tree
Date: Wed, 15 Aug 2018 13:26:01 -0600
Message-ID: <20180815192601.GI2341@mellanox.com>
References: <20180726135804.0257047e@canb.auug.org.au>
 <20180815114539.34e066e1@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180815114539.34e066e1@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Doug Ledford <dledford@redhat.com>, Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>, Max Gurtovoy <maxg@mellanox.com>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

On Wed, Aug 15, 2018 at 11:45:39AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 26 Jul 2018 13:58:04 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Today's linux-next merge of the block tree got a conflict in:
> > 
> >   drivers/nvme/target/rdma.c
> > 
> > between commit:
> > 
> >   23f96d1f15a7 ("nvmet-rdma: Simplify ib_post_(send|recv|srq_recv)() calls")
> >   202093848cac ("nvmet-rdma: add an error flow for post_recv failures")
> > 
> > from the rdma tree and commits:
> > 
> >   2fc464e2162c ("nvmet-rdma: add unlikely check in the fast path")
> > 
> > from the block tree.
> > 
> > I fixed it up (see below) and can carry the fix as necessary. This
> > is now fixed as far as linux-next is concerned, but any non trivial
> > conflicts should be mentioned to your upstream maintainer when your tree
> > is submitted for merging.  You may also want to consider cooperating
> > with the maintainer of the conflicting tree to minimise any particularly
> > complex conflicts.
> > 
> 
> This is now a conflict between Linus' tree and the rdma tree.

Yes, I expect this.. good thing we had linux-next as several of these
needed non-obvious changes.

I keep track of your postings and build a conflict resolution for
Linus to refer to. netdev is the last conflicting tree I expect, and
it hasn't been sent yet..

Thanks,
Jason
