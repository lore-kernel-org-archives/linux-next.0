From: Mike Travis <travis@sgi.com>
Subject: Re: [PATCH] sysrq: include interrupt.h instead of irq.h
Date: Wed, 21 Jan 2009 08:50:03 -0800
Message-ID: <4977523B.6000507@sgi.com>
References: <20090121150249.a87aca09.sfr@canb.auug.org.au> <1232545758.31303.2.camel@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay3.sgi.com ([192.48.171.31]:52335 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750880AbZAUQuG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 21 Jan 2009 11:50:06 -0500
In-Reply-To: <1232545758.31303.2.camel@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>

Thanks for catching this Heiko!
Mike

Heiko Carstens wrote:
> From: Heiko Carstens <heiko.carstens@de.ibm.com>
> 
> With "cpumask: update irq_desc to use cpumask_var_t" in linux-next
> we get this compile bug on s390:
> 
>   CC      drivers/char/sysrq.o
> In file included from drivers/char/sysrq.c:38:
> include/linux/irq.h: In function 'init_alloc_desc_masks':
> include/linux/irq.h:442: error: dereferencing pointer to incomplete type
> 
> drivers/char/sysrq.c should include interrupt.h instead of irq.h.
> 
> Cc: Mike Travis <travis@sgi.com>
> Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
> ---
>  drivers/char/sysrq.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: linux-next/drivers/char/sysrq.c
> ===================================================================
> --- linux-next.orig/drivers/char/sysrq.c
> +++ linux-next/drivers/char/sysrq.c
> @@ -35,7 +35,7 @@
>  #include <linux/vt_kern.h>
>  #include <linux/workqueue.h>
>  #include <linux/kexec.h>
> -#include <linux/irq.h>
> +#include <linux/interrupt.h>
>  #include <linux/hrtimer.h>
>  #include <linux/oom.h>
>  
> 
