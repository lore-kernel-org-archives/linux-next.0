From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: manual merge of the staging tree with the vfs tree
Date: Mon, 4 Dec 2017 10:10:10 +0100
Message-ID: <20171204091010.GC16936@kroah.com>
References: <20171204130649.65e1c2c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20171204130649.65e1c2c4@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christian Gromm <christian.gromm@microchip.com>
List-Id: linux-next.vger.kernel.org

On Mon, Dec 04, 2017 at 01:06:49PM +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in:
> 
>   drivers/staging/most/video/video.c
> 
> between commit:
> 
>   afc9a42b7464 ("the rest of drivers/*: annotate ->poll() instances")
> 
> from the vfs tree and commit:
> 
>   1b10a0316e2d ("staging: most: video: remove aim designators")
> 
> from the staging tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Fix looks correct to me, thanks.

greg k-h
