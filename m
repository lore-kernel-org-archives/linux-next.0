From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: [PATCH -next] blkdev.h: fix warnings when CONFIG_BLOCK=n
Date: Tue, 16 Sep 2008 23:50:40 +0200
Message-ID: <20080916215039.GZ20055@kernel.dk>
References: <20080916173415.14012569.sfr@canb.auug.org.au> <Pine.LNX.4.64.0809161226230.32267@shark.he.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52718 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751432AbYIPVup (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 16 Sep 2008 17:50:45 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0809161226230.32267@shark.he.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Randy.Dunlap" <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, akpm@linux-foundation.org, LKML <linux-kernel@vger.kernel.org>

On Tue, Sep 16 2008, Randy.Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix lots of build warnings when CONFIG_BLOCK=n:
> 
> linux-next-20080916/include/linux/blkdev.h:1093: warning: 'struct block_device' declared inside parameter list
> linux-next-20080916/include/linux/blkdev.h:1093: warning: its scope is only this definition or declaration, which is probably not what you want
> linux-next-20080916/include/linux/blkdev.h:1097: warning: 'struct gendisk' declared inside parameter list
> linux-next-20080916/include/linux/blkdev.h:1105: warning: 'struct hd_geometry' declared inside parameter list
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> ---
>  include/linux/blkdev.h |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- linux-next-20080916.orig/include/linux/blkdev.h
> +++ linux-next-20080916/include/linux/blkdev.h
> @@ -1089,6 +1089,10 @@ static inline long nr_blockdev_pages(voi
>  
>  #endif /* CONFIG_BLOCK */
>  
> +struct block_device;
> +struct gendisk;
> +struct hd_geometry;
> +
>  extern int __blkdev_driver_ioctl(struct block_device *, fmode_t, unsigned int,
>  				 unsigned long);
>  

Not sure which tree that build problem came from, it isn't from the
block git tree.

-- 
Jens Axboe
