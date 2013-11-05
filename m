From: Chris Mason <chris.mason@fusionio.com>
Subject: Re: Boot failure on Arndale with next-20131105
Date: Tue, 5 Nov 2013 15:56:23 -0500
Message-ID: <20131105205623.3802.5166@localhost.localdomain>
References: <CAHbNUh1Cw3bc4WR0VcD1H_eKYqGBtv_215_euh6mwTbZ41ejUw@mail.gmail.com>
 <52794823.7080503@kernel.dk>
 <CAOesGMj1xXXM-gNgWQwBKOczpJtM7CobYy4h7Fe=4W3U43EJGQ@mail.gmail.com>
 <20131105203308.3802.45122@localhost.localdomain>
 <CAOesGMirg=ex9hLCjGBpj0cMhLeQ5cJQoRv72tgg7PoSKWUDhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dkim2.fusionio.com ([66.114.96.54]:37572 "EHLO
	dkim2.fusionio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754728Ab3KEU42 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 5 Nov 2013 15:56:28 -0500
Received: from mx1.fusionio.com (unknown [10.101.1.160])
	by dkim2.fusionio.com (Postfix) with ESMTP id DB3DE9A06B6
	for <linux-next@vger.kernel.org>; Tue,  5 Nov 2013 13:56:27 -0700 (MST)
In-Reply-To: <CAOesGMirg=ex9hLCjGBpj0cMhLeQ5cJQoRv72tgg7PoSKWUDhA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>
Cc: Jens Axboe <axboe@kernel.dk>, Tushar Behera <tushar.behera@linaro.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Kent Overstreet <kmo@daterainc.com>

Quoting Olof Johansson (2013-11-05 15:38:33)
> On Tue, Nov 5, 2013 at 12:33 PM, Chris Mason <chris.mason@fusionio.com> wrote:
> > Quoting Olof Johansson (2013-11-05 15:23:51)
> >> On Tue, Nov 5, 2013 at 11:33 AM, Jens Axboe <axboe@kernel.dk> wrote:
> >
> > [ horrible crashes fixed by removing my patch ]
> >
> >> > Very weird! What file system is being used?
> >>
> >> Most of my failures have happened on regular MMC cards with ext4
> >> filesystems on them.
> >>
> >> Note that the panic happens during device probe / partition table
> >> scanning, not after mounting the filesystem.
> >>
> >> Giving your patch a go now across the board. I'm very concerned about
> >> the reports of bisectability, build failures and heaps of warnings
> >> though. Did the 0-day builder pick up any of those? :-/
> >>
> >
> > Hmmm, is bcache in your config?
> 
> Doesn't look that way -- no ARM defconfigs enable it (it's what I
> build and boot), and the option defaults to off and nothing selects
> it.

Ok, I think I see it.  My guess is that you're hitting bounce buffers.
__blk_queue_bounce is the only caller of the bio splitting code I can
see that you might be hitting.

My first patch exposed a lurking bug in bio_clone_biovec.  Basically
bio->bi_vcnt is being doubled instead of initialized.

This patch is only compile tested, but I think it'll fix it.

diff --git a/fs/bio.c b/fs/bio.c
index be93de1..3595456 100644
--- a/fs/bio.c
+++ b/fs/bio.c
@@ -612,6 +612,7 @@ int bio_clone_biovec(struct bio *bio, gfp_t gfp_mask)
 	unsigned nr_iovecs = 0;
 	struct bio_vec bv, *bvl = NULL;
 	struct bvec_iter iter;
+	int i;
 
 	BUG_ON(!bio->bi_pool);
 	BUG_ON(BIO_POOL_IDX(bio) != BIO_POOL_NONE);
@@ -628,8 +629,9 @@ int bio_clone_biovec(struct bio *bio, gfp_t gfp_mask)
 		bvl = bio->bi_inline_vecs;
 	}
 
+	i = 0;
 	bio_for_each_segment(bv, bio, iter)
-		bvl[bio->bi_vcnt++] = bv;
+		bvl[i++] = bv;
 
 	bio->bi_io_vec = bvl;
 	bio->bi_iter.bi_idx = 0;
