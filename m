From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the akpm-current tree with the kspp
 tree
Date: Mon, 3 Jul 2017 11:31:17 +1000
Message-ID: <20170703113117.0ae8b7f9@canb.auug.org.au>
References: <20170620151549.3380276f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46023 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752220AbdGCBbT (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 2 Jul 2017 21:31:19 -0400
In-Reply-To: <20170620151549.3380276f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Kees Cook <keescook@chromium.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Manfred Spraul <manfred@colorfullife.com>

Hi all,

With the merge window opening, just a reminder that this conflict still
exists.

On Tue, 20 Jun 2017 15:15:49 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Today's linux-next merge of the akpm-current tree got a conflict in:
> 
>   include/linux/sem.h
> 
> between commit:
> 
>   1a12979f61e4 ("randstruct: Mark various structs for randomization")
> 
> from the kspp tree and commit:
> 
>   337e62a32a54 ("ipc/sem.c: remove sem_base, embed struct sem")
> 
> from the akpm-current tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell
> 
> diff --cc include/linux/sem.h
> index 23bcbdfad4a6,be5cf2ea14ad..000000000000
> --- a/include/linux/sem.h
> +++ b/include/linux/sem.h
> @@@ -21,7 -39,9 +39,9 @@@ struct sem_array 
>   	int			sem_nsems;	/* no. of semaphores in array */
>   	int			complex_count;	/* pending complex operations */
>   	unsigned int		use_global_lock;/* >0: global lock required */
> + 
> + 	struct sem		sems[];
>  -};
>  +} __randomize_layout;
>   
>   #ifdef CONFIG_SYSVIPC
>   

-- 
Cheers,
Stephen Rothwell
