From: Peter Zijlstra <a.p.zijlstra@chello.nl>
Subject: Re: linux-next: build failure after merge of the driver-core tree
Date: Wed, 14 Dec 2011 10:24:57 +0100
Message-ID: <1323854697.28489.7.camel@twins>
References: <20111214154844.3ad4e1d685c7987cba0820a0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:47760 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754905Ab1LNJZv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 14 Dec 2011 04:25:51 -0500
In-Reply-To: <20111214154844.3ad4e1d685c7987cba0820a0@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2011-12-14 at 15:48 +1100, Stephen Rothwell wrote:
> Hi Greg,
> 
> After merging the driver-core tree, today's linux-next build
> (powerpc_ppc64_defconfig) failed like this:
> 
> In file included from include/linux/slab.h:185:0,
>                  from include/linux/kref.h:19,
>                  from include/linux/kobject.h:24,
>                  from include/linux/sysdev.h:24,
>                  from include/linux/node.h:17,
>                  from include/linux/swap.h:10,
>                  from include/linux/suspend.h:4,
>                  from arch/powerpc/kernel/asm-offsets.c:24:
> include/linux/slub_def.h:100:17: error: field 'kobj' has incomplete type
> 
> Caused by commit 4af679cd7cbb ("kref: Inline all functions") ... we now
> have kref.h -> slab.h -> slub_def.h -> kobject.h -> kref.h when
> CONFIG_SLUB is set.

Egads, that's nasty.. 

The nicest thing I can come up with is something like the below, but its
not all that nice at all :/



---
--- a/include/linux/kref.h
+++ b/include/linux/kref.h
@@ -16,7 +16,8 @@
 #define _KREF_H_
 
 #include <linux/types.h>
-#include <linux/slab.h>
+
+extern void kfree(const void *);
 
 struct kref {
 	atomic_t refcount;
