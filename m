From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: manual merge of the block tree with the
        dma-mapping tree
Date: Wed, 17 Jan 2018 17:18:43 +0100
Message-ID: <20180117161843.GA14823@lst.de>
References: <20180117133817.739d6751@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180117133817.739d6751@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@wdc.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 17, 2018 at 01:38:17PM +1100, Stephen Rothwell wrote:
> from the dma-mapping tree and commit:
> 
>   e80a0af4759a ("lib/scatterlist: Introduce sgl_alloc() and sgl_free()")
> 
> from the block tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks, the trivial fix look good.
