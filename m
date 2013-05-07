From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH -next] ashmem: Fix ashmem_shrink deadlock.
Date: Tue, 7 May 2013 13:52:30 -0700
Message-ID: <20130507135230.ba90c299a79be635ef768a2a@linux-foundation.org>
References: <1367416573-5430-1-git-send-email-rlove@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:54893 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757187Ab3EGUwc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 7 May 2013 16:52:32 -0400
In-Reply-To: <1367416573-5430-1-git-send-email-rlove@google.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Robert Love <rlove@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shankar Brahadeeswaran <shankoo77@gmail.com>, Dan Carpenter <dan.carpenter@oracle.com>, LKML <linux-kernel@vger.kernel.org>, Bjorn Bringert <bringert@google.com>, devel <devel@driverdev.osuosl.org>, Hugh Dickins <hughd@google.com>, Anjana V Kumar <anjanavk12@gmail.com>, linux-next <linux-next@vger.kernel.org>

On Wed,  1 May 2013 09:56:13 -0400 Robert Love <rlove@google.com> wrote:

> Don't acquire ashmem_mutex in ashmem_shrink if we've somehow recursed into the
> shrinker code from within ashmem. Just bail out, avoiding a deadlock. This is
> fine, as ashmem cache pruning is advisory anyhow.
> 

Sorry, but I don't think "somehow" is an adequate description of a
kernel bug.  The deadlock should be described with specificity, so that
others can understand and review the fix and perhaps suggest
alternative implementations.

Presumably someone is performing a memory allocation while holding
ashmem_mutex.  A more idiomatic way of avoiding a call to direct
reclaim in these circumstances would be for the task to set its
PF_MEMALLOC flag, or to use GFP_ATOMIC.  But without any details that's
as far as I can go.

> --- a/drivers/staging/android/ashmem.c
> +++ b/drivers/staging/android/ashmem.c
> @@ -363,7 +363,11 @@ static int ashmem_shrink(struct shrinker *s, struct shrink_control *sc)
>  	if (!sc->nr_to_scan)
>  		return lru_count;
>  
> -	mutex_lock(&ashmem_mutex);
> +	/* avoid recursing into this code from within ashmem itself */
> +	if (!mutex_trylock(&ashmem_mutex)) {
> +		return -1;
> +	}

This is rather hacky.  It consumes more CPU than the above approaches,
and more stack.

Worst of all, it obviously hasn't met checkpatch.pl ;)
