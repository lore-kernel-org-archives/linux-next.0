From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Wed, 6 Nov 2013 11:45:24 +0530
Message-ID: <CAHbNUh2N2ZJVKV8s-JODfa8PTVaUK9yKpWL-mgYLBwOCQ8ATpg@mail.gmail.com>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>
	<52794823.7080503@kernel.dk>
	<CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
	<20131105203308.3802.45122@localhost.localdomain>
	<CAOesGMirg=ex9hLCjGBpj0cMhLeQ5cJQoRv72tgg7PoSKWUDhA@mail.gmail.com>
	<20131105205623.3802.5166@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:50022 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780Ab3KFGP2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 6 Nov 2013 01:15:28 -0500
Received: by mail-ob0-f176.google.com with SMTP id uy5so9547300obc.21
        for <linux-next@vger.kernel.org>; Tue, 05 Nov 2013 22:15:25 -0800 (PST)
In-Reply-To: <20131105205623.3802.5166@localhost.localdomain>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Chris Mason <chris.mason@fusionio.com>
Cc: Olof Johansson <olof@lixom.net>, Jens Axboe <axboe@kernel.dk>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Kent Overstreet <kmo@daterainc.com>

On 6 November 2013 02:26, Chris Mason <chris.mason@fusionio.com> wrote:
> Quoting Olof Johansson (2013-11-05 15:38:33)
>> On Tue, Nov 5, 2013 at 12:33 PM, Chris Mason <chris.mason@fusionio.com> wrote:
>> > Quoting Olof Johansson (2013-11-05 15:23:51)
>> >> On Tue, Nov 5, 2013 at 11:33 AM, Jens Axboe <axboe@kernel.dk> wrote:

> This patch is only compile tested, but I think it'll fix it.
>
> diff --git a/fs/bio.c b/fs/bio.c
> index be93de1..3595456 100644
> --- a/fs/bio.c
> +++ b/fs/bio.c
> @@ -612,6 +612,7 @@ int bio_clone_biovec(struct bio *bio, gfp_t gfp_mask)
>         unsigned nr_iovecs = 0;
>         struct bio_vec bv, *bvl = NULL;
>         struct bvec_iter iter;
> +       int i;
>
>         BUG_ON(!bio->bi_pool);
>         BUG_ON(BIO_POOL_IDX(bio) != BIO_POOL_NONE);
> @@ -628,8 +629,9 @@ int bio_clone_biovec(struct bio *bio, gfp_t gfp_mask)
>                 bvl = bio->bi_inline_vecs;
>         }
>
> +       i = 0;
>         bio_for_each_segment(bv, bio, iter)
> -               bvl[bio->bi_vcnt++] = bv;
> +               bvl[i++] = bv;
>
>         bio->bi_io_vec = bvl;
>         bio->bi_iter.bi_idx = 0;


Tested-by: Tushar Behera <tushar.behera@linaro.org>
(Fixes boot failure on Exynos5250-based Arndale board.)

-- 
Tushar Behera
