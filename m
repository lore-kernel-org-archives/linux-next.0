From: Borislav Petkov <petkovbb@googlemail.com>
Subject: Re: linux-next: ide tree build failure
Date: Mon, 15 Jun 2009 07:35:14 +0200
Message-ID: <20090615053514.GA13226@liondog.tnic>
References: <20090615113430.21122e44.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f213.google.com ([209.85.218.213]:54250 "EHLO
	mail-bw0-f213.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132AbZFOFfQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 15 Jun 2009 01:35:16 -0400
Content-Disposition: inline
In-Reply-To: <20090615113430.21122e44.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On Mon, Jun 15, 2009 at 11:34:30AM +1000, Stephen Rothwell wrote:
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> drivers/ide/ide-tape.c: In function 'idetape_chrdev_open':
> drivers/ide/ide-tape.c:1515: error: implicit declaration of function 'idetape_read_position'
> 
> Caused by commit 55ce3a129ea2e8faba4a11bb5dbc305590d1c20c ("ide-tape: fix
> READ POSITION cmd handling") interacting with the later merge
> 8dcce4081305d3d1629190edd112e6473c315cbc ("Merge branch
> 'bp-remove-pc-buf' into for-next").
> 
> I have used the ide tree from next-20090612 for today.

Ah, the function got renamed in 55ce3a129ea2e8faba4a11bb5dbc305590d1c20c. Here's
a fix:

---
From: Borislav Petkov <petkovbb@gmail.com>
Date: Mon, 15 Jun 2009 07:32:04 +0200
Subject: [PATCH] ide-tape: fix build issue

This fixes

drivers/ide/ide-tape.c: In function `idetape_chrdev_open':
drivers/ide/ide-tape.c:1515: error: implicit declaration of function `idetape_read_position'
make[1]: *** [drivers/ide/ide-tape.o] Error 1

Signed-off-by: Borislav Petkov <petkovbb@gmail.com>
---
 drivers/ide/ide-tape.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/ide/ide-tape.c b/drivers/ide/ide-tape.c
index bb71e1e..3a3f10f 100644
--- a/drivers/ide/ide-tape.c
+++ b/drivers/ide/ide-tape.c
@@ -1512,7 +1512,7 @@ static int idetape_chrdev_open(struct inode *inode, struct file *filp)
 		goto out_put_tape;
 	}
 
-	idetape_read_position(drive);
+	ide_tape_read_position(drive);
 	if (!test_bit(ilog2(IDE_AFLAG_ADDRESS_VALID), &drive->atapi_flags))
 		(void)idetape_rewind_tape(drive);
 
-- 
1.6.3.1


-- 
Regards/Gruss,
    Boris.
