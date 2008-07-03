From: Jens Axboe <jens.axboe@oracle.com>
Subject: Re: linux-next: generic helpers for arch IPI function calls build bug  / s390
Date: Thu, 3 Jul 2008 22:12:35 +0200
Message-ID: <20080703201235.GD20055@kernel.dk>
References: <20080703193750.GB8958@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from brick.kernel.dk ([87.55.233.238]:21753 "EHLO kernel.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751562AbYGCUMi (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 3 Jul 2008 16:12:38 -0400
Content-Disposition: inline
In-Reply-To: <20080703193750.GB8958@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: linux-next@vger.kernel.org

On Thu, Jul 03 2008, Heiko Carstens wrote:
> Jens,
> 
> you forgot to remove #include <linux/spinlock.h> from linux/smp.h while
> fixing the original s390 build bug.
> 
> Patch below fixes this build bug caused by header inclusion dependencies:
> 
>   CC      kernel/timer.o
> In file included from include/linux/spinlock.h:87,
>                  from include/linux/smp.h:11,
>                  from include/linux/kernel_stat.h:4,
>                  from kernel/timer.c:22:
> include/asm/spinlock.h: In function '__raw_spin_lock':
> include/asm/spinlock.h:69: error: implicit declaration of function 'smp_processor_id'
> 
> Please merge the patch below with
> 
> "Add generic helpers for arch IPI function calls"
> 
> Thanks.
> 
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  include/linux/smp.h |    1 -
>  1 file changed, 1 deletion(-)
> 
> Index: linux-next/include/linux/smp.h
> ===================================================================
> --- linux-next.orig/include/linux/smp.h
> +++ linux-next/include/linux/smp.h
> @@ -8,7 +8,6 @@
>  
>  #include <linux/errno.h>
>  #include <linux/list.h>
> -#include <linux/spinlock.h>
>  #include <linux/cpumask.h>
>  
>  extern void cpu_idle(void);

ugh indeed, that was silly. Thanks!

-- 
Jens Axboe
