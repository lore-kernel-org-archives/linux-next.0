From: Sedat Dilek <sedat.dilek@gmail.com>
Subject: Re: linux-next: Tree for Feb 4
Date: Thu, 5 Feb 2015 20:46:44 +0100
Message-ID: <CA+icZUUXj2mLa4HT4nqusKOsxCE-hHPWoc7TcfsfCiWaBxXy9w@mail.gmail.com>
References: <20150204193535.58f132c5@canb.auug.org.au>
	<CA+icZUXkMv+RYoHLN-BQSrYti8FUjqWih2XsARY4hDAP=2v1Yw@mail.gmail.com>
	<54D237D9.4070209@kernel.dk>
	<CA+icZUXh3jdiF1SbJx4aRzYf2fjq_CErQ5drdQRK36ath0A-SA@mail.gmail.com>
	<54D23B58.9000703@kernel.dk>
	<CA+icZUWeO03=kYT1MZ3p8ZZaUTv-MxzSjL3gjuq1-q-Qm5WYpA@mail.gmail.com>
	<yq1zj8tactc.fsf@sermon.lab.mkp.net>
	<CA+icZUXrSSeFakX4w5nARo3eh35-p2JwKE5kw4KuuFQkv7dMOg@mail.gmail.com>
	<yq17fvx9hct.fsf@sermon.lab.mkp.net>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <yq17fvx9hct.fsf@sermon.lab.mkp.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Jens Axboe <axboe@kernel.dk>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 5, 2015 at 4:17 AM, Martin K. Petersen
<martin.petersen@oracle.com> wrote:
>>>>>> "Sedat" == Sedat Dilek <sedat.dilek@gmail.com> writes:
>
> Sedat> No, but I am here on a so-called WUBI installation which
> Sedat> triggered some bugs being an exotic installation.  My
> Sedat> Ubuntu/precise is a 18GiB image laying on my Win7 partition
> Sedat> (/dev/sda2).
>
> I've been mulling over this for a while and can't come up with a good
> approach. So let's just nuke these warnings.
>
> --
> Martin K. Petersen      Oracle Linux Engineering
>
>
> block: Quiesce zeroout wrapper
>
> blkdev_issue_zeroout() printed a warning if a device failed a discard or
> write same request despite advertising support for these. That's fine
> for SCSI since we'll disable these commands if we get an error back from
> the disk saying that they are not supported. And consequently the
> warning only gets printed once.
>
> There are other types of block devices that support discard, however,
> and these may return -EOPNOTSUPP for each command but leave discard
> enabled in the queue limits. This will cause a warning message for every
> blkdev_issue_zeroout() invocation.
>
> Remove the offending warning messages.
>
> Reported-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
> ---
>  block/blk-lib.c |   26 +++++++-------------------
>  1 file changed, 7 insertions(+), 19 deletions(-)
>
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 715e948f58a4..7688ee3f5d72 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -286,7 +286,6 @@ static int __blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>   * @discard:   whether to discard the block range
>   *
>   * Description:
> -
>   *  Zero-fill a block range.  If the discard flag is set and the block
>   *  device guarantees that subsequent READ operations to the block range
>   *  in question will return zeroes, the blocks will be discarded. Should
> @@ -303,26 +302,15 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>                          sector_t nr_sects, gfp_t gfp_mask, bool discard)
>  {
>         struct request_queue *q = bdev_get_queue(bdev);
> -       unsigned char bdn[BDEVNAME_SIZE];
> -
> -       if (discard && blk_queue_discard(q) && q->limits.discard_zeroes_data) {
>
> -               if (!blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, 0))
> -                       return 0;
> -
> -               bdevname(bdev, bdn);
> -               pr_warn("%s: DISCARD failed. Manually zeroing.\n", bdn);
> -       }
> +       if (discard && blk_queue_discard(q) && q->limits.discard_zeroes_data &&
> +           blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, 0) == 0)
> +               return 0;
>
> -       if (bdev_write_same(bdev)) {
> -
> -               if (!blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask,
> -                                            ZERO_PAGE(0)))
> -                       return 0;
> -
> -               bdevname(bdev, bdn);
> -               pr_warn("%s: WRITE SAME failed. Manually zeroing.\n", bdn);
> -       }
> +       if (bdev_write_same(bdev) &&
> +           blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask,
> +                                   ZERO_PAGE(0)) == 0)
> +               return 0;
>
>         return __blkdev_issue_zeroout(bdev, sector, nr_sects, gfp_mask);
>  }

Martin, will you send a separate patch for that?

Thanks.

- Sedat -
