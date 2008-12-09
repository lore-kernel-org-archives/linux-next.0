From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: Re: linux-next: "aio: make the lookup_ioctx() lockless" causes
	s390 build bug
Date: Tue, 9 Dec 2008 16:51:05 +0530
Message-ID: <20081209112105.GD12102@linux.vnet.ibm.com>
References: <20081205164155.GC4491@osiris.boeblingen.de.ibm.com> <20081205220634.GR18255@kernel.dk>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp05.in.ibm.com ([59.145.155.5]:55982 "EHLO
	e28smtp05.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752152AbYLILVM (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 9 Dec 2008 06:21:12 -0500
Received: from d28relay04.in.ibm.com (d28relay04.in.ibm.com [9.184.220.61])
	by e28smtp05.in.ibm.com (8.13.1/8.13.1) with ESMTP id mB9BL8F4006364
	for <linux-next@vger.kernel.org>; Tue, 9 Dec 2008 16:51:08 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay04.in.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mB9BLAig3539086
	for <linux-next@vger.kernel.org>; Tue, 9 Dec 2008 16:51:10 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.13.1/8.13.3) with ESMTP id mB9BL7ZR014041
	for <linux-next@vger.kernel.org>; Tue, 9 Dec 2008 22:21:08 +1100
Content-Disposition: inline
In-Reply-To: <20081205220634.GR18255@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

* Jens Axboe <jens.axboe@oracle.com> [2008-12-05 23:06:35]:

> On Fri, Dec 05 2008, Heiko Carstens wrote:
> > Hi Jens,
> > 
> > your patch "aio: make the lookup_ioctx() lockless" in linux-next
> > causes this build bug on s390:
> > 
> > arch/s390/mm/pgtable.c: In function 's390_enable_sie':
> > arch/s390/mm/pgtable.c:266: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
> > arch/s390/mm/pgtable.c:282: error: invalid operands to binary || (have 'int' and 'struct hlist_head')
> > make[1]: *** [arch/s390/mm/pgtable.o] Error 1
> > make: *** [arch/s390/mm] Error 2
> > 
> > Could you please fix that? Thanks! ;)
> 
> Something like this?

Hi Jens,

	Thank you for the patch, it fixes the build failure.

Tested-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
> 
> diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
> index ef3635b..0767827 100644
> --- a/arch/s390/mm/pgtable.c
> +++ b/arch/s390/mm/pgtable.c
> @@ -263,7 +263,7 @@ int s390_enable_sie(void)
>  	/* lets check if we are allowed to replace the mm */
>  	task_lock(tsk);
>  	if (!tsk->mm || atomic_read(&tsk->mm->mm_users) > 1 ||
> -	    tsk->mm != tsk->active_mm || tsk->mm->ioctx_list) {
> +	    tsk->mm != tsk->active_mm || !hlist_empty(&tsk->mm->ioctx_list)) {
>  		task_unlock(tsk);
>  		return -EINVAL;
>  	}
> @@ -279,7 +279,7 @@ int s390_enable_sie(void)
>  	/* Now lets check again if something happened */
>  	task_lock(tsk);
>  	if (!tsk->mm || atomic_read(&tsk->mm->mm_users) > 1 ||
> -	    tsk->mm != tsk->active_mm || tsk->mm->ioctx_list) {
> +	    tsk->mm != tsk->active_mm || !hlist_empty(&tsk->mm->ioctx_list)) {
>  		mmput(mm);
>  		task_unlock(tsk);
>  		return -EINVAL;
> 
> -- 
> Jens Axboe
> 

-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
