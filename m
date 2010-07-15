From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: linux-next: build failure after merge of the devicetree tree
Date: Thu, 15 Jul 2010 00:06:40 -0600
Message-ID: <AANLkTikubzqMV50eC5HErr4BBzvRsuVT9xTHkCJjD_BV@mail.gmail.com>
References: <20100715121508.61f66363.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-gy0-f174.google.com ([209.85.160.174]:59796 "EHLO
	mail-gy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932511Ab0GOGHB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 15 Jul 2010 02:07:01 -0400
In-Reply-To: <20100715121508.61f66363.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, Jul 14, 2010 at 8:15 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Grant,
>
> After merging the devicetree tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> drivers/of/platform.c: In function 'of_device_make_bus_id':
> drivers/of/platform.c:437: error: implicit declaration of function 'of_translate_dcr_address'

Oops.  I reworked one of my patches which moved the dcr call into the
common code (protected by a #ifdef) because it was just to messy to
try and factor it out.  Here's the fix:

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 125f2bc..5be0080 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -19,6 +19,10 @@
 #include <linux/of_device.h>
 #include <linux/of_platform.h>

+#if defined(CONFIG_PPC_DCR)
+#include <asm/dcr.h>
+#endif
+
 extern struct device_attribute of_platform_device_attrs[];

 static int of_platform_bus_match(struct device *dev, struct device_driver *drv)

I've pushed it out to my devicetree-next branch so it is ready for you tomorrow.

> As you requested, I have dropped that tree form linux-next for today.

Thanks.  I had to rebase, so by you dropping it I can do a trial merge
without conflicting against my old tree.

> Andrew, I hope this does not cause you too much pain.

If it does, you can pull in git://git.secretlab.ca/git/linux-2.6
next-devicetree.  It is fixed now.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
