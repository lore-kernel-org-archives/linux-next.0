From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-trivial tree with the  tree
Date: Wed, 15 Sep 2010 13:23:03 +1000
Message-ID: <20100915132303.1b97756c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46275 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753517Ab0IODXF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Sep 2010 23:23:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman <gregkh@suse.de>

Hi Arnd,

Today's linux-next merge of the bkl-trivial tree got a conflict in
drivers/staging/spectra/ffsport.c between commit
f8d261d39a24f9f612cb8b2d5ad68654727543cd ("staging: spectra needs
<linux/slab.h>") from Linus' tree and commit
a0293f8b84de7525083a97c7215c74ce1a066aeb ("block: autoconvert trivial BKL
users to private mutex") from the bkl-trivial tree.

Just context changes.  I fixed it up (see below) and can carry it for a
while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/staging/spectra/ffsport.c
index fa21a0f,905a67c..0000000
--- a/drivers/staging/spectra/ffsport.c
+++ b/drivers/staging/spectra/ffsport.c
@@@ -27,8 -27,6 +27,7 @@@
  #include <linux/kthread.h>
  #include <linux/log2.h>
  #include <linux/init.h>
- #include <linux/smp_lock.h>
 +#include <linux/slab.h>
  
  /**** Helper functions used for Div, Remainder operation on u64 ****/
  
