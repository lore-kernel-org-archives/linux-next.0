From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: m68k/semaphore build failure
Date: Wed, 28 May 2008 16:04:06 +1000
Message-ID: <20080528160406.4fceb036.sfr@canb.auug.org.au>
References: <20080527201038.d70e23d6.sfr@canb.auug.org.au>
	<Pine.LNX.4.64.0805271809520.4081@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53325 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752413AbYE1GEI (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 28 May 2008 02:04:08 -0400
In-Reply-To: <Pine.LNX.4.64.0805271809520.4081@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Matthew Wilcox <matthew@wil.cx>, linux-next@vger.kernel.org

On Tue, 27 May 2008 18:10:51 +0200 (CEST) Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> On Tue, 27 May 2008, Stephen Rothwell wrote:
> > Today's linux-next build (m68k multi_defconfig) failed like this:
> > 
> > drivers/input/keyboard/hil_kbd.c:336: error: 'PCI_VENDOR_ID_HP' undeclared (first use in this function)
> > drivers/input/keyboard/hil_kbd.c:336: error: (Each undeclared identifier is reported only once
> > drivers/input/keyboard/hil_kbd.c:336: error: for each function it appears in.)
> > 
> > This is caused by commit fd7c1a9773fd107674216b63a752f21ba6495045 ("Add
> > missing semaphore.h includes") from the semaphore tree.  That commit adds
> > a linux/semaphore.h include but removes the linux/pci_ids.h include.
> 
> Thx!
> 
> I'd swear I reported this to Willy the first time it appeared, but according
> to my mail logs, I never did...

I have added the following patch to linux-next for today, but I am
assuming the Willy will fix his semaphore tree shortly.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 4307d699fe862f594d27fc3e877de5628142aeb7 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 28 May 2008 15:47:53 +1000
Subject: [PATCH] hil_kbd: restore pci_ids.h

This was removed by a semaphore patch (presumable by accident).

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/input/keyboard/hil_kbd.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/input/keyboard/hil_kbd.c b/drivers/input/keyboard/hil_kbd.c
index c0336ff..724f5b4 100644
--- a/drivers/input/keyboard/hil_kbd.c
+++ b/drivers/input/keyboard/hil_kbd.c
@@ -38,6 +38,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/slab.h>
+#include <linux/pci_ids.h>
 #include <linux/semaphore.h>
 
 #define PREFIX "HIL KEYB: "
-- 
1.5.5.1

