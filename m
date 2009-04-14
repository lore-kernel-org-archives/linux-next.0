From: David Woodhouse <dwmw2@infradead.org>
Subject: Re: linux-next: firmware tree build failure
Date: Tue, 14 Apr 2009 13:25:06 +0100
Message-ID: <1239711906.3342.229.camel@macbook.infradead.org>
References: <20090414141254.70ddc8ce.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:46961 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753985AbZDNM2T (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 14 Apr 2009 08:28:19 -0400
In-Reply-To: <20090414141254.70ddc8ce.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

On Tue, 2009-04-14 at 14:12 +1000, Stephen Rothwell wrote: 
> Hi Dave,
> 
> Today's linux-next build (sparc64 defconfig) failed like this:
> 
> drivers/base/firmware_class.c: In function 'firmware_loading_store':
> drivers/base/firmware_class.c:173: error: 'PAGE_KERNEL_RO' undeclared (first use in this function)
> 
> Caused by commit 0bb1338d4467c143987560f841130292c124074c ("firmware:
> speed up request_firmware()").  PAGE_KERNEL_RO appears to not be defined
> for several architectures.
> 
> I have reverted that commit for today.

Ah, thanks. The fix for lack of PAGE_KERNEL_EXEC in vmalloc.c seems to
be:

#ifndef PAGE_KERNEL_EXEC
# define PAGE_KERNEL_EXEC PAGE_KERNEL
#endif

I think I'll do the equivalent for PAGE_KERNEL_RO, and at least we'll be
mapping the firmware images as read-only on _some_ architectures.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
