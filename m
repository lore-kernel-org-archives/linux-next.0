From: Christoph Hellwig <hch@lst.de>
Subject: Re: [xfs-masters] linux-next: manual merge of the xfs tree with
	Linus' tree
Date: Mon, 28 Mar 2011 12:47:53 +0200
Message-ID: <20110328104753.GA27327@lst.de>
References: <20110328122148.1b48a742.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110328122148.1b48a742.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Chinner <david@fromorbit.com>, xfs-masters@oss.sgi.com, Jens Axboe <jaxboe@fusionio.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Mar 28, 2011 at 12:21:48PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xfs tree got a conflict in
> fs/xfs/linux-2.6/xfs_buf.c between commit 7eaceaccab5f ("block: remove
> per-queue plugging") from Linus' tree and commit 0e6e847ffe37 ("xfs: stop
> using the page cache to back the buffer cache") from the xfs tree.
> 
> I assume that these changes (on both sides) were discussed somewhere, but
> maybe not clearly enough?
> 
> I have no idea how to fix this, so I tried to just use the xfs tree
> version for today.  That failed like this:
> 
> fs/xfs/linux-2.6/xfs_buf.c: In function 'xfs_buf_lock':
> fs/xfs/linux-2.6/xfs_buf.c:923: error: implicit declaration of function 'blk_run_backing_dev'
> 
> So I used the xfs tree from next-20110325 for today.

What XFS does is to replace blk_run_address_space, which was a wrapper
around blk_run_backing_dev with a direct call to blk_run_backing_dev,
as there change means we don't have the address_space around anymore.

Jens' tree removes both these functions, and introduces blk_flush_plug
as a sort-of replacement.  Sticking to the variant from Jens' tree / mainline
with blk_flush_plug is the correct thing here for this case.

Where there more conflicts than just this?
