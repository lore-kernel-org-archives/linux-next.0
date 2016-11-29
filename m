From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: linux-next: manual merge of the mmc tree with the block tree
Date: Tue, 29 Nov 2016 10:13:59 +0100
Message-ID: <CAPDyKFrRFOhaQPedRO_2BSinA=cWTza2tHAnP7oPFGKzW5E2Wg@mail.gmail.com>
References: <20161128131211.55f096b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161128131211.55f096b8@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@fb.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
List-Id: linux-next.vger.kernel.org

+Jens

On 28 November 2016 at 03:12, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Ulf,
>
> Today's linux-next merge of the mmc tree got a conflict in:
>
>   drivers/mmc/card/block.c
>
> between commit:
>
>   e806402130c9 ("block: split out request-only flags into a new namespace")
>
> from the block tree and commit:
>
>   95105fc9ffbb ("mmc: block: delete packed command support")
>
> from the mmc tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Stephen, thanks for reporting! Just to let you know, I have today
re-based my next branch, which makes ("mmc: block: delete packed
command support") get a new commit id. Perhaps that causes you to
re-resolve the conflict, then apologize for the inconvenience.

Jens, Christoph, I believe I said this before; could you please make
sure patches for mmc also becomes cc:ed to me?
Don't get me wrong, I have no problem you carrying changes for mmc,
especially clean-ups like this one, but it just be nice to be aware of
what goes on.

Kind regards
Uffe

>
> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/mmc/card/block.c
> index ae9cbe6101be,86ff28f84698..000000000000
> --- a/drivers/mmc/card/block.c
> +++ b/drivers/mmc/card/block.c
> @@@ -2114,28 -1728,18 +1728,18 @@@ static int mmc_blk_issue_rw_rq(struct m
>         return 1;
>
>    cmd_abort:
> -       if (mmc_packed_cmd(mq_rq->cmd_type)) {
> -               mmc_blk_abort_packed_req(mq_rq);
> -       } else {
> -               if (mmc_card_removed(card))
> -                       req->rq_flags |= RQF_QUIET;
> -               while (ret)
> -                       ret = blk_end_request(req, -EIO,
> -                                       blk_rq_cur_bytes(req));
> -       }
> +       if (mmc_card_removed(card))
>  -              req->cmd_flags |= REQ_QUIET;
> ++              req->rq_flags |= RQF_QUIET;
> +       while (ret)
> +               ret = blk_end_request(req, -EIO,
> +                               blk_rq_cur_bytes(req));
>
>    start_new_req:
>         if (rqc) {
>                 if (mmc_card_removed(card)) {
>  -                      rqc->cmd_flags |= REQ_QUIET;
>  +                      rqc->rq_flags |= RQF_QUIET;
>                         blk_end_request_all(rqc, -EIO);
>                 } else {
> -                       /*
> -                        * If current request is packed, it needs to put back.
> -                        */
> -                       if (mmc_packed_cmd(mq->mqrq_cur->cmd_type))
> -                               mmc_blk_revert_packed_req(mq, mq->mqrq_cur);
> -
>                         mmc_blk_rw_rq_prep(mq->mqrq_cur, card, 0, mq);
>                         mmc_start_req(card->host,
>                                       &mq->mqrq_cur->mmc_active, NULL);
