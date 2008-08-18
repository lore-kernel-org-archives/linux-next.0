From: Greg KH <greg@kroah.com>
Subject: Re: linux-next: driver-core tree build warning
Date: Mon, 18 Aug 2008 15:35:01 -0700
Message-ID: <20080818223501.GA14477@kroah.com>
References: <20080815125957.97930de0.sfr@canb.auug.org.au> <20080816053432.GC20161@kroah.com> <20080818190947.GA6200@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:39718 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754540AbYHSAjM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 18 Aug 2008 20:39:12 -0400
Content-Disposition: inline
In-Reply-To: <20080818190947.GA6200@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jason Baron <jbaron@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Mon, Aug 18, 2008 at 03:09:47PM -0400, Jason Baron wrote:
> On Fri, Aug 15, 2008 at 10:34:32PM -0700, Greg KH wrote:
> > > Hi Greg,
> > > 
> > > Today's linux-next build (x86_64 allmodconfig) produced this warning:
> > > 
> > > In file included from include2/asm/string.h:4,
> > >                  from include/linux/string.h:19,
> > >                  from include/linux/dynamic_printk.h:4,
> > >                  from include/linux/kernel.h:19,
> > >                  from arch/x86/boot/memory.c:16:
> > > include2/asm/string_64.h:34:1: warning: "memcpy" redefined
> > > In file included from /scratch/sfr/next/arch/x86/boot/memory.c:15:
> > > arch/x86/boot/boot.h:231:1: warning: this is the location of the previous definition
> > > 
> > > Probably caused by commit 1b75321c2d0561d9ecfe3794fa939264f3eb7e26
> > > ("driver core: basic infrastructure for per-module dynamic debug
> > > messages") which added an include of linux/dynamic_printk.h to
> > > linux/kernel.h.
> > 
> > Wierd.  Jason, any thoughts?
> > 
> > thanks,
> > 
> > greg k-h
> 
> hmm...i wasn't actually able to reproduce this (gcc 4.3.0-8), but I think I see
> how this comes about. Anyways, we don't actually need to include "string.h",
> its a remnant from an earlier version. The following patch should resolve this
> issue.

Thanks, I've merged this with the original one.

greg k-h
