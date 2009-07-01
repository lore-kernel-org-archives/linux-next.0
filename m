From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: manual merge of the block tree with the  tree
Date: Wed, 1 Jul 2009 08:59:10 +0200
Message-ID: <20090701065910.GN23611@kernel.dk>
References: <20090701153715.7e2935a8.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1753336AbZGAG7T@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20090701153715.7e2935a8.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Kennedy <richard@rsk.demon.co.uk>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 01 2009, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> mm/page-writeback.c between commit
> d7831a0bdf06b9f722b947bb0c205ff7d77cebd8 ("mm: prevent balance_dirty_pages
> () from doing too much work") from Linus' tree and commit
> 83f866f06c6d0266330e1631f4644ba6a63e6925 ("writeback: switch to per-bdi
> threads for flushing data") from the block tree.
> 
> Context changes.  I fixed it up (see below) but am not sure if this is
> the correct fix.
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc mm/page-writeback.c
> index 7687879,7b87d10..0000000
> --- a/mm/page-writeback.c
> +++ b/mm/page-writeback.c
> @@@ -541,12 -527,9 +527,12 @@@ static void balance_dirty_pages(struct 
>   		 * filesystems (i.e. NFS) in which data may have been
>   		 * written to the server's write cache, but has not yet
>   		 * been flushed to permanent storage.
>  +		 * Only move pages to writeback if this bdi is over its
>  +		 * threshold otherwise wait until the disk writes catch
>  +		 * up.
>   		 */
>  -		if (bdi_nr_reclaimable) {
>  +		if (bdi_nr_reclaimable > bdi_thresh) {
> - 			writeback_inodes(&wbc);
> + 			generic_sync_bdi_inodes(NULL, &wbc);
>   			pages_written += write_chunk - wbc.nr_to_write;
>   			get_dirty_limits(&background_thresh, &dirty_thresh,
>   				       &bdi_thresh, bdi);

I'll fix that up, I didn't expect this patch to go in, since there are
still pending issues with it...

-- 
Jens Axboe
