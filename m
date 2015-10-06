From: Ming Lei <ming.lei@canonical.com>
Subject: Re: linux-next: build failure after merge of the block tree
Date: Tue, 6 Oct 2015 15:20:20 +0800
Message-ID: <CACVXFVMgwv-6GAh6_dY3iVn=kJ36HPXoh-tx3BTvxtZNLvUg3Q@mail.gmail.com>
References: <20151006124322.2a50698e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:43164 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751497AbbJFHUX (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 6 Oct 2015 03:20:23 -0400
In-Reply-To: <20151006124322.2a50698e@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <axboe@kernel.dk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>

On Tue, Oct 6, 2015 at 9:43 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Jens,
>
> After merging the block tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:
>
> drivers/block/loop.c: In function 'lo_rw_aio_complete':
> drivers/block/loop.c:474:2: error: too few arguments to function 'blk_mq_complete_request'
>   blk_mq_complete_request(rq);
>   ^
> In file included from drivers/block/loop.h:14:0,
>                  from drivers/block/loop.c:79:
> include/linux/blk-mq.h:217:6: note: declared here
>  void blk_mq_complete_request(struct request *rq, int error);
>       ^
>
> Caused by commit
>
>   f4829a9b7a61 ("blk-mq: fix racy updates of rq->errors")
>
> from Linus' tree interacting with commit
>
>   bc07c10a3603 ("block: loop: support DIO & AIO")
>
> from the block tree.
>
> I added the this merge fix patch:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Oct 2015 12:39:41 +1100
> Subject: [PATCH] blk-mq: merge fix for "fix racy updates of rq->errors"
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/block/loop.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/block/loop.c b/drivers/block/loop.c
> index c692a3d812e4..9be61ad3163d 100644
> --- a/drivers/block/loop.c
> +++ b/drivers/block/loop.c
> @@ -470,8 +470,7 @@ static void lo_rw_aio_complete(struct kiocb *iocb, long ret, long ret2)
>         else if (ret < 0)
>                 ret = -EIO;
>
> -       rq->errors = ret;
> -       blk_mq_complete_request(rq);
> +       blk_mq_complete_request(rq, ret);

This merge fix looks fine, thanks.

>  }
>
>  static int lo_rw_aio(struct loop_device *lo, struct loop_cmd *cmd,
> --
> 2.5.1
>
> --
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
