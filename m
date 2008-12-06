From: Heiko Carstens <heiko.carstens@de.ibm.com>
Subject: Re: linux-next: "aio: make the lookup_ioctx() lockless" causes
	s390 build bug
Date: Sat, 6 Dec 2008 13:53:34 +0100
Message-ID: <20081206125334.GA12040@osiris.boeblingen.de.ibm.com>
References: <20081205164155.GC4491@osiris.boeblingen.de.ibm.com> <20081205220634.GR18255@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mtagate8.de.ibm.com ([195.212.29.157]:62223 "EHLO
	mtagate8.de.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750952AbYLFMxh (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 6 Dec 2008 07:53:37 -0500
Received: from d12nrmr1607.megacenter.de.ibm.com (d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate8.de.ibm.com (8.13.8/8.13.8) with ESMTP id mB6CrZOI379522
	for <linux-next@vger.kernel.org>; Sat, 6 Dec 2008 12:53:35 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com [9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.1) with ESMTP id mB6CrZg92859106
	for <linux-next@vger.kernel.org>; Sat, 6 Dec 2008 13:53:35 +0100
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id mB6CrYd2002370
	for <linux-next@vger.kernel.org>; Sat, 6 Dec 2008 13:53:35 +0100
Content-Disposition: inline
In-Reply-To: <20081205220634.GR18255@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>

On Fri, Dec 05, 2008 at 11:06:35PM +0100, Jens Axboe wrote:
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

Yes, exactly. Thanks!
