From: Benny Halevy <bhalevy@panasas.com>
Subject: Re: [PATCH -next] lib: Move find_last_bit.o to obj-y to enable use
 by modules.
Date: Thu, 16 Apr 2009 11:11:02 +0300
Message-ID: <49E6E816.8010709@panasas.com>
References: <20090416030704.GH16961@linux-sh.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:15376 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751137AbZDPIMV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Apr 2009 04:12:21 -0400
In-Reply-To: <20090416030704.GH16961@linux-sh.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Paul Mundt <lethal@linux-sh.org>, Trond Myklebust <Trond.Myklebust@netapp.com>
Cc: linux-next@vger.kernel.org, Andy Adamson <andros@netapp.com>, Fredric Isaman <iisaman@citi.umich.edu>

On Apr. 16, 2009, 6:07 +0300, Paul Mundt <lethal@linux-sh.org> wrote:
> Caught with the sh allmodconfig:
> 
> 	ERROR: "find_last_bit" [fs/nfs/nfs.ko] undefined!
> 	make[2]: *** [__modpost] Error 1
> 	make[1]: *** [modules] Error 2
> 	make: *** [sub-make] Error 2
> 
> find_last_bit.o is currently built with lib-y, which ends up breaking
> the nfs module build after the ("nfs41: free slot") commit. Move it
> to obj-y so the EXPORT_SYMBOL() actually has some effect.
> 
> Signed-off-by: Paul Mundt <lethal@linux-sh.org>
> Cc: Benny Halevy <bhalevy@panasas.com>

ACK. and thanks!

FYI, Fred's original patch can be found here:
http://patchwork.kernel.org/patch/14572/

It is also queued in the linux-pnfs tree:
http://git.linux-nfs.org/?p=bhalevy/linux-pnfs.git;a=commitdiff;h=1e3a7552d9de2ba101b76deed99605f0145fc4d5
but I haven't submitted it to Trond since I expected
it to get upstream (and to -next) via linux-kbuild.

Trond, would you like to pull this change to your nfsv41 branch?
(should appear before "nfs41: free slot" as Paul noticed)

Benny

> Cc: Andy Adamson <andros@netapp.com>
> Cc: Trond Myklebust <Trond.Myklebust@netapp.com>
> 
> ---
> 
> diff --git a/lib/Makefile b/lib/Makefile
> index d6edd67..33a40e4 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -38,7 +38,7 @@ lib-$(CONFIG_RWSEM_GENERIC_SPINLOCK) += rwsem-spinlock.o
>  lib-$(CONFIG_RWSEM_XCHGADD_ALGORITHM) += rwsem.o
>  lib-$(CONFIG_GENERIC_FIND_FIRST_BIT) += find_next_bit.o
>  lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find_next_bit.o
> -lib-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
> +obj-$(CONFIG_GENERIC_FIND_LAST_BIT) += find_last_bit.o
>  obj-$(CONFIG_GENERIC_HWEIGHT) += hweight.o
>  obj-$(CONFIG_LOCK_KERNEL) += kernel_lock.o
>  obj-$(CONFIG_DEBUG_PREEMPT) += smp_processor_id.o
