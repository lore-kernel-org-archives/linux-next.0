From: Jason Baron <jbaron@redhat.com>
Subject: Re: linux-next: driver-core tree build warning
Date: Mon, 18 Aug 2008 15:09:47 -0400
Message-ID: <20080818190947.GA6200@redhat.com>
References: <20080815125957.97930de0.sfr@canb.auug.org.au> <20080816053432.GC20161@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([66.187.233.31]:45629 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1763522AbYHRTKJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 18 Aug 2008 15:10:09 -0400
Content-Disposition: inline
In-Reply-To: <20080816053432.GC20161@kroah.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Fri, Aug 15, 2008 at 10:34:32PM -0700, Greg KH wrote:
> > Hi Greg,
> > 
> > Today's linux-next build (x86_64 allmodconfig) produced this warning:
> > 
> > In file included from include2/asm/string.h:4,
> >                  from include/linux/string.h:19,
> >                  from include/linux/dynamic_printk.h:4,
> >                  from include/linux/kernel.h:19,
> >                  from arch/x86/boot/memory.c:16:
> > include2/asm/string_64.h:34:1: warning: "memcpy" redefined
> > In file included from /scratch/sfr/next/arch/x86/boot/memory.c:15:
> > arch/x86/boot/boot.h:231:1: warning: this is the location of the previous definition
> > 
> > Probably caused by commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
> > ("driver core: basic infrastructure for per-module dynamic debug
> > messages") which added an include of linux/dynamic_printk.h to
> > linux/kernel.h.
> 
> Wierd.  Jason, any thoughts?
> 
> thanks,
> 
> greg k-h

hmm...i wasn't actually able to reproduce this (gcc 4.3.0-8), but I think I see
how this comes about. Anyways, we don't actually need to include "string.h",
its a remnant from an earlier version. The following patch should resolve this
issue.

thanks,

-Jason


Signed-off-by: Jason Baron <jbaron@redhat.com>

---


diff --git a/include/linux/dynamic_printk.h b/include/linux/dynamic_printk.h
index 210bf61..c54cf84 100644
--- a/include/linux/dynamic_printk.h
+++ b/include/linux/dynamic_printk.h
@@ -1,9 +1,6 @@
 #ifndef _DYNAMIC_PRINTK_H
 #define _DYNAMIC_PRINTK_H
 
-#include <linux/string.h>
-#include <linux/hash.h>
-
 #define DYNAMIC_DEBUG_HASH_BITS 6
 #define DEBUG_HASH_TABLE_SIZE (1 << DYNAMIC_DEBUG_HASH_BITS)
 
