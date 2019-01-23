From: Christoph Hellwig <hch@lst.de>
Subject: Re: linux-next: Fixes tags need some work in the dma-mapping-fixes
 tree
Date: Wed, 23 Jan 2019 08:19:33 +0100
Message-ID: <20190123071933.GA24861@lst.de>
References: <20190123074747.7cd44f12@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190123074747.7cd44f12@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

On Wed, Jan 23, 2019 at 07:47:47AM +1100, Stephen Rothwell wrote:
> Hi Christoph,
> 
> In commit
> 
>   702e8ed37bed ("arm64/xen: fix xen-swiotlb cache flushing")
> 
> Fixes tag
> 
>   Fixes: 356da6d0cd ("dma-mapping: bypass indirect calls for dma-direct")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long

When did we decide on that?  As far as I know it was bumped to 10
a while ago.  12 basically makes the line even more unreadable.

> In commit
> 
>   8218a55b6b91 ("sbitmap: Protect swap_lock from hardirq")
> 
> Fixes tag
> 
>   Fixes: ab53dcfb3e7b ("sbitmap: Protect swap_lock from hardirq")
> 
> has these problem(s):
> 
>   - Target SHA1 does not exist
> 
> This later patch appears to already be in Linus' tree as commit
> fe76fc6aaf53 (also with an incorrect Fixes tag :-()

That commit is not from the dma-mapping tree..
