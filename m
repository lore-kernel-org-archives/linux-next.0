From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warning after merge of the block tree
Date: Wed, 10 May 2017 13:26:09 +1000
Message-ID: <20170510132609.1f92e89f@canb.auug.org.au>
References: <20170510112411.1e785033@canb.auug.org.au>
        <20170510022054.GA23014@x4>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59595 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751491AbdEJD0M (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 9 May 2017 23:26:12 -0400
In-Reply-To: <20170510022054.GA23014@x4>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Markus Trippelsdorf <markus@trippelsdorf.de>
Cc: Jens Axboe <axboe@kernel.dk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bart Van Assche <bart.vanassche@sandisk.com>

Hi Markus,

On Wed, 10 May 2017 04:20:54 +0200 Markus Trippelsdorf <markus@trippelsdorf.de> wrote:
>
> Yes, it was missing a (void) like "(void)strlcpy(...)". But Jens
> unfortunately removed both warnings, so the following patch should now
> be enough:
> 
> diff --git a/block/elevator.c b/block/elevator.c
> index fda6be933130..dd0ed19e4fb7 100644
> --- a/block/elevator.c
> +++ b/block/elevator.c
> @@ -1099,8 +1099,7 @@ ssize_t elv_iosched_store(struct request_queue *q, const char *name,
>  		return count;
>  
>  	strlcpy(elevator_name, skip_spaces(name), sizeof(elevator_name));
> -	strstrip(elevator_name);
> -	ret = __elevator_change(q, elevator_name);
> +	ret = __elevator_change(q, strstrip(elevator_name));
>  	if (!ret)
>  		return count;

I think you (or someone) needs to do a proper patch submission to Jens,
please.
-- 
Cheers,
Stephen Rothwell
