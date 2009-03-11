From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: block/proc tree build failure
Date: Wed, 11 Mar 2009 22:44:18 +1100
Message-ID: <20090311224418.f1a7cb5f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:55785 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754230AbZCKLoV (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 11 Mar 2009 07:44:21 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>, Alexey Dobriyan <adobriyan@gmail.com>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>

Hi Jens, Alexey,

Today's linux-next build (powerpc allyesconfig) failed like this:

drivers/block/ps3vram.c: In function 'ps3vram_proc_init':
drivers/block/ps3vram.c:555: error: 'struct proc_dir_entry' has no member named 'owner'

Caused by the interaction of commit
ce12b152a2e5c0f831853180e84f3ba6e3fee4a1 ("ps3/block: Replace mtd/ps3vram
by block/ps3vram") from the block tree with commit
773c363c5607e8713efe49e1df11317dfa8f48fc ("proc 2/2: remove struct
proc_dir_entry::owner") from the proc tree.

I have applied the following patch that I will add as a merge fixup for
the proc tree tomorrow and apply as long as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 11 Mar 2009 22:22:04 +1100
Subject: [PATCH] proc: remove a new user of proc_dir_entry::owner

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/block/ps3vram.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/block/ps3vram.c b/drivers/block/ps3vram.c
index 393ed67..23fc853 100644
--- a/drivers/block/ps3vram.c
+++ b/drivers/block/ps3vram.c
@@ -552,7 +552,6 @@ static void __devinit ps3vram_proc_init(struct ps3_system_bus_device *dev)
 		return;
 	}
 
-	pde->owner = THIS_MODULE;
 	pde->data = priv;
 }
 
-- 
1.6.1.3
