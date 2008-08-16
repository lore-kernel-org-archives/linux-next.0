From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build warning
Date: Fri, 15 Aug 2008 22:34:32 -0700
Message-ID: <20080816053432.GC20161@kroah.com>
References: <20080815125957.97930de0.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:40580 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbYHPFgw (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 16 Aug 2008 01:36:52 -0400
Content-Disposition: inline
In-Reply-To: <20080815125957.97930de0.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, Jason Baron <jbaron@redhat.com>

On Fri, Aug 15, 2008 at 12:59:57PM +1000, Stephen Rothwell wrote:
> Hi Greg,
> 
> Today's linux-next build (x86_64 allmodconfig) produced this warning:
> 
> In file included from include2/asm/string.h:4,
>                  from include/linux/string.h:19,
>                  from include/linux/dynamic_printk.h:4,
>                  from include/linux/kernel.h:19,
>                  from arch/x86/boot/memory.c:16:
> include2/asm/string_64.h:34:1: warning: "memcpy" redefined
> In file included from /scratch/sfr/next/arch/x86/boot/memory.c:15:
> arch/x86/boot/boot.h:231:1: warning: this is the location of the previous definition
> 
> Probably caused by commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
> ("driver core: basic infrastructure for per-module dynamic debug
> messages") which added an include of linux/dynamic_printk.h to
> linux/kernel.h.

Wierd.  Jason, any thoughts?

thanks,

greg k-h
