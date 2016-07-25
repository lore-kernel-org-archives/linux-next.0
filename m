From: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: linux-next: manual merge of the xen-tip tree with the block
 tree
Date: Mon, 25 Jul 2016 10:29:11 -0700 (PDT)
Message-ID: <alpine.DEB.2.10.1607251020130.12319@sstabellini-ThinkPad-X260>
References: <20160724161432.0f5a4011@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:53778 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752859AbcGYR3X (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 Jul 2016 13:29:23 -0400
In-Reply-To: <20160724161432.0f5a4011@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jeremy Fitzhardinge <jeremy@goop.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>, Xen Devel <Xen-devel@lists.xensource.com>, Jens Axboe <axboe@kernel.dk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Beulich <JBeulich@suse.com>, Mike Christie <mchristi@redhat.com>, david.vrabel@citrix.com, boris.ostrovsky@oracle.com

On Sun, 24 Jul 2016, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the xen-tip tree got a conflict in:
> 
>   drivers/block/xen-blkfront.c
> 
> between commit:
> 
>   a418090aa88b ("block: do not use REQ_FLUSH for tracking flush support")
> 
> from the block tree and commit:
> 
>   ff595325ed55 ("xen-blkfront: prefer xenbus_scanf() over xenbus_gather()")
> 
> from the xen-tip tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Hello Stephen,

thanks for letting us know, the fix is good.

The To and CC list for these emails is a bit outdated. I want to make
sure they reach the right people. Could you please add:

boris.ostrovsky@oracle.com
david.vrabel@citrix.com

Thanks!

 
> Cheers,
> Stephen Rothwell
> 
> diff --cc drivers/block/xen-blkfront.c
> index ab382c7997b8,ca0536eb7037..000000000000
> --- a/drivers/block/xen-blkfront.c
> +++ b/drivers/block/xen-blkfront.c
> @@@ -2298,11 -2308,9 +2297,10 @@@ static void blkfront_gather_backend_fea
>   	unsigned int indirect_segments;
>   
>   	info->feature_flush = 0;
>  +	info->feature_fua = 0;
>   
> - 	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> - 			"feature-barrier", "%d", &barrier,
> - 			NULL);
> + 	err = xenbus_scanf(XBT_NIL, info->xbdev->otherend,
> + 			   "feature-barrier", "%d", &barrier);
>   
>   	/*
>   	 * If there's no "feature-barrier" defined, then it means
> @@@ -2311,35 -2319,27 +2309,32 @@@
>   	 *
>   	 * If there are barriers, then we use flush.
>   	 */
> - 	if (!err && barrier) {
>  -	if (err > 0 && barrier)
>  -		info->feature_flush = REQ_FLUSH | REQ_FUA;
> ++	if (err > 0 && barrier) {
>  +		info->feature_flush = 1;
>  +		info->feature_fua = 1;
>  +	}
>  +
>   	/*
>   	 * And if there is "feature-flush-cache" use that above
>   	 * barriers.
>   	 */
> - 	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> - 			"feature-flush-cache", "%d", &flush,
> - 			NULL);
> + 	err = xenbus_scanf(XBT_NIL, info->xbdev->otherend,
> + 			   "feature-flush-cache", "%d", &flush);
>   
> - 	if (!err && flush) {
>  -	if (err > 0 && flush)
>  -		info->feature_flush = REQ_FLUSH;
> ++	if (err > 0 && flush) {
>  +		info->feature_flush = 1;
>  +		info->feature_fua = 0;
>  +	}
>   
> - 	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> - 			"feature-discard", "%d", &discard,
> - 			NULL);
> + 	err = xenbus_scanf(XBT_NIL, info->xbdev->otherend,
> + 			   "feature-discard", "%d", &discard);
>   
> - 	if (!err && discard)
> + 	if (err > 0 && discard)
>   		blkfront_setup_discard(info);
>   
> - 	err = xenbus_gather(XBT_NIL, info->xbdev->otherend,
> - 			"feature-persistent", "%u", &persistent,
> - 			NULL);
> - 	if (err)
> + 	err = xenbus_scanf(XBT_NIL, info->xbdev->otherend,
> + 			   "feature-persistent", "%d", &persistent);
> + 	if (err <= 0)
>   		info->feature_persistent = 0;
>   	else
>   		info->feature_persistent = persistent;
> 
