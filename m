From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next:  ide/m68k build failure
Date: Tue, 8 Jul 2008 22:55:55 +1000
Message-ID: <20080708225555.e3dae9be.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58796 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751579AbYGHMz6 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 8 Jul 2008 08:55:58 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

Hi Bart,

Today's linux-next build (m68k defconfig) failed like this:

drivers/ide/legacy/falconide.c:120: error: 'NODEV' undeclared (first use in this function)

Caused by commit 6c99c52c52e6a1532b502df89a6cffe19626d295 ("ide: add
ide_host_free() helper").

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

diff --git a/drivers/ide/legacy/falconide.c b/drivers/ide/legacy/falconide.c
index f8394cc..724f950 100644
--- a/drivers/ide/legacy/falconide.c
+++ b/drivers/ide/legacy/falconide.c
@@ -117,7 +117,7 @@ static int __init falconide_init(void)
 	int rc;
 
 	if (!MACH_IS_ATARI || !ATARIHW_PRESENT(IDE))
-		return -NODEV;
+		return -ENODEV;
 
 	printk(KERN_INFO "ide: Falcon IDE controller\n");
 

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

P.S. untested but pretty obvious.
