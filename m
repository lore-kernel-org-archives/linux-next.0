From: Theodore Ts'o <tytso@mit.edu>
Subject: Re: linux-next: manual merge of the random tree
Date: Tue, 1 Oct 2013 07:29:37 -0400
Message-ID: <20131001112937.GC1994@thunk.org>
References: <20131001110344.GA20249@ulmo.nvidia.com>
 <1380625644-11331-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from imap.thunk.org ([74.207.234.97]:40663 "EHLO imap.thunk.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751210Ab3JAL3k (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 1 Oct 2013 07:29:40 -0400
Content-Disposition: inline
In-Reply-To: <1380625644-11331-6-git-send-email-treding@nvidia.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 01, 2013 at 01:07:22PM +0200, Thierry Reding wrote:
> Today's linux-next merge of the random tree got a conflict in:
> 
> 	init/main.c
> 
> I fixed it up (see below). Please check if the resolution looks correct.

Looks good, thanks.

						- Ted

> 
> Thanks,
> Thierry
> ---
> diff --cc init/main.c
> index 7cc4b78,586cd33..379090f
> --- a/init/main.c
> +++ b/init/main.c
> @@@ -75,7 -75,7 +75,8 @@@
>   #include <linux/blkdev.h>
>   #include <linux/elevator.h>
>   #include <linux/sched_clock.h>
>  +#include <linux/context_tracking.h>
> + #include <linux/random.h>
>   
>   #include <asm/io.h>
>   #include <asm/bugs.h>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
