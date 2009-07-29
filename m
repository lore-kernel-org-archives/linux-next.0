From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: drbd tree build failure
Date: Wed, 29 Jul 2009 08:20:58 +0200
Message-ID: <20090729062058.GE4148@kernel.dk>
References: <20090729152933.47664b18.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([93.163.65.50]:48900 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751876AbZG2GVI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 29 Jul 2009 02:21:08 -0400
Content-Disposition: inline
In-Reply-To: <20090729152933.47664b18.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Philipp Reisner <philipp.reisner@linbit.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 29 2009, Stephen Rothwell wrote:
> Hi Philipp,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/block/drbd/drbd_req.c: In function 'drbd_make_request_26':
> drivers/block/drbd/drbd_req.c:1023: error: implicit declaration of function 'bio_barrier'
> drivers/block/drbd/drbd_actlog.c: In function '_drbd_md_sync_page_io':
> drivers/block/drbd/drbd_actlog.c:120: error: implicit declaration of function 'bio_barrier'
> drivers/block/drbd/drbd_main.c: In function 'drbd_send_dblock':
> drivers/block/drbd/drbd_main.c:2373: error: implicit declaration of function 'bio_barrier'
> drivers/block/drbd/drbd_main.c:2375: error: implicit declaration of function 'bio_sync'
> 
> Caused by commit d206aaff0c5ee065f382c626ea21c5166a3047a7 ("bio: first
> step in sanitizing the bio->bi_rw flag testing") from the block tree.
> 
> I applied the following patch for today.

That fixup looks good, thanks Stephen.


-- 
Jens Axboe
