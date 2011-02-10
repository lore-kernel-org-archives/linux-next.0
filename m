From: Robert Jennings <rcj@linux.vnet.ibm.com>
Subject: Re: linux-next: manual merge of the staging tree with the
 staging.current tree
Date: Thu, 10 Feb 2011 08:43:00 -0600
Message-ID: <20110210144300.GA15465@linux.vnet.ibm.com>
References: <20110210163527.3b2cc580.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20110210163527.3b2cc580.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Nitin Gupta <ngupta@vflare.org>
List-Id: linux-next.vger.kernel.org

* Stephen Rothwell (sfr@canb.auug.org.au) wrote:
> Hi Greg,
> 
> Today's linux-next merge of the staging tree got a conflict in
> drivers/staging/zram/zram_drv.c between commit
> 5414e557fca545614ceedc3d3496f747457e2e3b ("staging: zram: fix data
> corruption issue") from the staging.current tree and commit
> 2787f959d6c5fb258d964218ac75346019f49ee9 ("zram: Return zero'd pages on
> new reads") from the staging tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/staging/zram/zram_drv.c
> index 4bd8cbd,1017d6d..0000000
> --- a/drivers/staging/zram/zram_drv.c
> +++ b/drivers/staging/zram/zram_drv.c
> @@@ -235,8 -237,7 +238,8 @@@ static void zram_read(struct zram *zram
>   		if (unlikely(!zram->table[index].page)) {
>   			pr_debug("Read before write: sector=%lu, size=%u",
>   				(ulong)(bio->bi_sector), bio->bi_size);
> - 			/* Do nothing */
> + 			handle_zero_page(page);
>  +			index++;
>   			continue;
>   		}
>   

This is correct, thanks.

--Rob Jennings
