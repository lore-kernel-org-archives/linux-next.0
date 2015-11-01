From: Oleg Nesterov <oleg@redhat.com>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Sun, 1 Nov 2015 19:26:46 +0100
Message-ID: <20151101182645.GA32642@redhat.com>
References: <20151102031508.59636627@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:52175 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752067AbbKARab (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 1 Nov 2015 12:30:31 -0500
Content-Disposition: inline
In-Reply-To: <20151102031508.59636627@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Markus Pargmann <mpa@pengutronix.de>, Jens Axboe <axboe@fb.com>

On 11/02, Stephen Rothwell wrote:
>
> Hi Andrew,
>
> After merging the akpm-current tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/block/nbd.c: In function 'nbd_thread_send':
> drivers/block/nbd.c:592:3: error: implicit declaration of function 'dequeue_signal_lock' [-Werror=implicit-function-declaration]
>    dequeue_signal_lock(current, &current->blocked, &info);
>    ^
>
> Caused by commit
>
>   ffcb8dc55a97 ("signal: turn dequeue_signal_lock() into kernel_dequeue_signal()")
>
> interacting with commit
>
>   dcc909d90ccd ("nbd: Add locking for tasks")
>
> from Linus' tree.

Yes, thanks, this should be fixed by

	signal-turn-dequeue_signal_lock-into-kernel_dequeue_signal-fix.patch

in -mm tree,

> I added this merge fix patch:

the same as the patch above, thanks.

> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 2 Nov 2015 03:04:27 +1100
> Subject: [PATCH] ndb: fix up for dequeue_signal_lock API change
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/block/nbd.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/block/nbd.c b/drivers/block/nbd.c
> index 5101fd2aca77..93b3f99b6865 100644
> --- a/drivers/block/nbd.c
> +++ b/drivers/block/nbd.c
> @@ -587,10 +587,8 @@ static int nbd_thread_send(void *data)
>  	spin_unlock_irqrestore(&nbd->tasks_lock, flags);
>
>  	/* Clear maybe pending signals */
> -	if (signal_pending(current)) {
> -		siginfo_t info;
> -		dequeue_signal_lock(current, &current->blocked, &info);
> -	}
> +	if (signal_pending(current))
> +		kernel_dequeue_signal(NULL);
>
>  	return 0;
>  }
> --
> 2.6.1
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
