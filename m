From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: bkl-removal build failure
Date: Mon, 19 May 2008 16:32:03 +1000
Message-ID: <20080519163203.89a54b82.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53264 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753450AbYESGcG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 19 May 2008 02:32:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-next@vger.kernel.org

Hi Jon,

[Resend with correct address]

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

drivers/char/viotape.c: In function 'viotap_open':
/scratch/sfr/next/drivers/char/viotape.c:692: error: expected ';' before 'get_dev_info'

I have temporarily applied the patch below.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 442ab511fe8c5d61ff81a85a188b0eb1c677b2c6 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 19 May 2008 16:06:52 +1000
Subject: [PATCH] bkl-removal viotape fixup

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/char/viotape.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/char/viotape.c b/drivers/char/viotape.c
index 57be035..9f4c4ba 100644
--- a/drivers/char/viotape.c
+++ b/drivers/char/viotape.c
@@ -688,7 +688,7 @@ static int viotap_open(struct inode *inode, struct file *file)
 	if (op == NULL)
 		return -ENOMEM;
 
-	lock_kernel()
+	lock_kernel();
 	get_dev_info(file->f_path.dentry->d_inode, &devi);
 
 	/* Note: We currently only support one mode! */
-- 
1.5.5.1
