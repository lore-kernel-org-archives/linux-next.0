From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: [PATCH -next] power: fix block_io.c printk warning
Date: Tue, 4 May 2010 00:00:56 +0200
Message-ID: <201005040000.56650.rjw@sisk.pl>
References: <20100503151619.f75e3a80.sfr@canb.auug.org.au> <20100503100611.2ca63b58.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:38673 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756882Ab0ECWA2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 3 May 2010 18:00:28 -0400
In-Reply-To: <20100503100611.2ca63b58.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-pm@lists.linux-foundation.org

On Monday 03 May 2010, Randy Dunlap wrote:
> From: Randy Dunlap <randy.dunlap@oracle.com>
> 
> Fix printk format warning in block_io.c:
> 
> kernel/power/block_io.c:41: warning: format '%ld' expects type 'long int', but argument 2 has type 'sector_t'
> 
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: "Rafael J. Wysocki" <rjw@sisk.pl>

Applied to suspend-2.6/linux-next.

Thanks,
Rafael


> ---
>  kernel/power/block_io.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20100503.orig/kernel/power/block_io.c
> +++ linux-next-20100503/kernel/power/block_io.c
> @@ -37,8 +37,8 @@ static int submit(int rw, struct block_d
>  	bio->bi_end_io = end_swap_bio_read;
>  
>  	if (bio_add_page(bio, page, PAGE_SIZE, 0) < PAGE_SIZE) {
> -		printk(KERN_ERR "PM: Adding page to bio failed at %ld\n",
> -			sector);
> +		printk(KERN_ERR "PM: Adding page to bio failed at %llu\n",
> +			(unsigned long long)sector);
>  		bio_put(bio);
>  		return -EFAULT;
>  	}
> 
> 
