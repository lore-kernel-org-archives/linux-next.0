From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: manual merge of the block tree with the ide tree
Date: Tue, 9 Jun 2009 09:57:06 +0200
Message-ID: <20090609075706.GA6878@liondog.tnic>
References: <20090609163405.69795630.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f213.google.com ([209.85.220.213]:52821 "EHLO
	mail-fx0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752295AbZFIH5I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Jun 2009 03:57:08 -0400
Content-Disposition: inline
In-Reply-To: <20090609163405.69795630.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Borislav Petkov <petkovbb@googlemail.com>, Mark de Wever <koraq@xs4all.nl>

On Tue, Jun 09, 2009 at 04:34:05PM +1000, Stephen Rothwell wrote:
> Hi Jens,
> 
> Today's linux-next merge of the block tree got a conflict in
> drivers/ide/ide-tape.c between various commits from the ide tree and
> various commits from the block tree.
> 
> I fixed it up as best I could (see below).

Yep, looks good. Thanks.

> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
> 
> diff --cc drivers/ide/ide-tape.c
> index 51ea59e,683ff37..0000000
> --- a/drivers/ide/ide-tape.c
> +++ b/drivers/ide/ide-tape.c
> @@@ -610,8 -617,8 +628,8 @@@ static ide_startstop_t idetape_do_reque
>   	struct ide_cmd cmd;
>   	u8 stat;
>   
> - 	debug_log(DBG_SENSE, "sector: %llu, nr_sectors: %lu\n",
> - 		  (unsigned long long)rq->sector, rq->nr_sectors);
>  -	debug_log(DBG_SENSE, "sector: %llu, nr_sectors: %u\n"
> ++	debug_log(DBG_SENSE, "sector: %llu, nr_sectors: %u\n",
> + 		  (unsigned long long)blk_rq_pos(rq), blk_rq_sectors(rq));
>   
>   	if (!(blk_special_request(rq) || blk_sense_request(rq))) {
>   		/* We do not support buffer cache originated requests. */



-- 
Regards/Gruss,
    Boris.
