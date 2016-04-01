From: Peter Hurley <peter@hurleysoftware.com>
Subject: [PATCH] tty: Fix merge of "tty: Refactor tty_open()"
Date: Thu, 31 Mar 2016 17:47:07 -0700
Message-ID: <1459471627-20669-1-git-send-email-peter@hurleysoftware.com>
References: <CAKU3ayUnachD60Q1HwfMAXTOThwH1cF55t2yBwAVVzYoM4QE-Q@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34845 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757688AbcDAArQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Mar 2016 20:47:16 -0400
Received: by mail-pa0-f54.google.com with SMTP id td3so77313871pab.2
        for <linux-next@vger.kernel.org>; Thu, 31 Mar 2016 17:47:16 -0700 (PDT)
In-Reply-To: <CAKU3ayUnachD60Q1HwfMAXTOThwH1cF55t2yBwAVVzYoM4QE-Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Hurley <peter@hurleysoftware.com>

Commit e9036d066236 ("tty: Drop krefs for interrupted tty lock")
fixed a tty reference counting problem introduced in
commit 0bfd464d3fdd ("tty: Wait interruptibly for tty lock on reopen"),
so v4.5.0 is correct.

However, commit d6203d0c7b73 ("tty: Refactor tty_open()") moved the
relevant code for 4.6-rc1; correct the merge.

Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
---
 drivers/tty/tty_io.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/tty/tty_io.c b/drivers/tty/tty_io.c
index 8d26ed7..c14c45f 100644
--- a/drivers/tty/tty_io.c
+++ b/drivers/tty/tty_io.c
@@ -2049,14 +2049,13 @@ static struct tty_struct *tty_open_by_driver(dev_t device, struct inode *inode,
 	if (tty) {
 		mutex_unlock(&tty_mutex);
 		retval = tty_lock_interruptible(tty);
+		tty_kref_put(tty);  /* drop kref from tty_driver_lookup_tty() */
 		if (retval) {
 			if (retval == -EINTR)
 				retval = -ERESTARTSYS;
 			tty = ERR_PTR(retval);
 			goto out;
 		}
-		/* safe to drop the kref from tty_driver_lookup_tty() */
-		tty_kref_put(tty);
 		retval = tty_reopen(tty);
 		if (retval < 0) {
 			tty_unlock(tty);
-- 
2.8.0
