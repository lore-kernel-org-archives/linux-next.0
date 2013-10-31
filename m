From: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH -next] sched/wait: fix
 __wait_event_interruptible_lock_irq_timeout()
Date: Thu, 31 Oct 2013 15:41:23 +0100
Message-ID: <20131031144123.GW19466@laptop.lan>
References: <20131031114814.GB5551@osiris>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:43912 "EHLO
	merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753115Ab3JaOl2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 31 Oct 2013 10:41:28 -0400
Content-Disposition: inline
In-Reply-To: <20131031114814.GB5551@osiris>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Ingo Molnar <mingo@elte.hu>, linux-next@vger.kernel.org

On Thu, Oct 31, 2013 at 12:48:14PM +0100, Heiko Carstens wrote:
> __wait_event_interruptible_lock_irq_timeout() needs the timeout parameter
> passed instead of "ret".
> This magically compiled since the only user has a local ret variable.
> Luckily we got a build warning:
> 
>   CC      drivers/s390/scsi/zfcp_qdio.o
> drivers/s390/scsi/zfcp_qdio.c: In function 'zfcp_qdio_sbal_get':
> include/linux/wait.h:780:15: warning: 'ret' may be used uninitialized
>          __ret = schedule_timeout(__ret);   \
>                ^
> drivers/s390/scsi/zfcp_qdio.c:245:7: note: 'ret' was declared here
>   long ret;
>        ^
> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>

Urgh, sorry about that..

Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>

> ---
>  include/linux/wait.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/wait.h b/include/linux/wait.h
> index fcc968087f05..d3d033ec5313 100644
> --- a/include/linux/wait.h
> +++ b/include/linux/wait.h
> @@ -775,7 +775,7 @@ do {									\
>  #define __wait_event_interruptible_lock_irq_timeout(wq, condition,	\
>  						    lock, timeout)	\
>  	___wait_event(wq, ___wait_cond_timeout(condition),		\
> -		      TASK_INTERRUPTIBLE, 0, ret,			\
> +		      TASK_INTERRUPTIBLE, 0, timeout,			\
>  		      spin_unlock_irq(&lock);				\
>  		      __ret = schedule_timeout(__ret);			\
>  		      spin_lock_irq(&lock));
> -- 
> 1.8.3.4
> 
