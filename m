From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the driver-core tree with the
 dma-mapping tree
Date: Fri, 1 Jun 2018 09:37:00 +0200
Message-ID: <20180601073700.GA12809@kroah.com>
References: <20180601170825.622c7084@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180601170825.622c7084@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christoph Hellwig <hch@lst.de>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Martin Liu <liumartin@google.com>
List-Id: linux-next.vger.kernel.org

On Fri, Jun 01, 2018 at 05:08:25PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the driver-core tree got a conflict in:
> 
>   include/linux/device.h
> 
> between commit:
> 
>   3d6ce86ee794 ("drivers: remove force dma flag from buses")
> 
> from the dma-mapping tree and commit:
> 
>   8c97a46af04b ("driver core: hold dev's parent lock when needed")
> 
> from the driver-core tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Fix looks great to me, thanks for this.

greg k-h
