From: Chris Mason <clmason@fusionio.com>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Mon, 20 May 2013 08:19:52 -0400
Message-ID: <20130520121952.31110.50221@localhost.localdomain>
References: <20130520140449.5da8b61ceaaf06618914e76f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from dkim1.fusionio.com ([66.114.96.53]:47439 "EHLO
	dkim1.fusionio.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756092Ab3ETMT4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 20 May 2013 08:19:56 -0400
Received: from mx1.fusionio.com (unknown [10.101.1.160])
	by dkim1.fusionio.com (Postfix) with ESMTP id AC0D47C0302
	for <linux-next@vger.kernel.org>; Mon, 20 May 2013 06:19:55 -0600 (MDT)
In-Reply-To: <20130520140449.5da8b61ceaaf06618914e76f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kent Overstreet <koverstreet@google.com>

Quoting Stephen Rothwell (2013-05-20 00:04:49)
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got conflicts in
> fs/btrfs/inode.c and fs/btrfs/volumes.c between commit 9be3395bcd4a
> ("Btrfs: use a btrfs bioset instead of abusing bio internals") from
> Linus' tree and commit "block: prep work for batch completion" from the
> akpm tree.
> 
> I fixed it up (I think - see below) and can carry the fix as necessary
> (no action is required).
> 
> I also noticed that a single conversion of bio_endio to bio_endio_batch
> is done in the akpm patch but bio_endio_batch is not introduced until a
> later patch ... :-(

Thanks, this looks right and I've linux-next through an aio/dio test on
btrfs.

Kent, reviewing the merge I see a missing bio_endio_batch conversion.  I
think this was missing from the original:

diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index faf20f5..a47bc10 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -7084,7 +7084,7 @@ static void btrfs_end_dio_bio(struct bio *bio, int err,
 		bio_io_error(dip->orig_bio);
 	} else {
 		set_bit(BIO_UPTODATE, &dip->dio_bio->bi_flags);
-		bio_endio(dip->orig_bio, 0);
+		bio_endio_batch(dip->orig_bio, 0, batch);
 	}
 out:
 	bio_put(bio);
