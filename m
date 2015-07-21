From: Benjamin LaHaise <bcrl@kvack.org>
Subject: Re: [PATCH v2] mm-move-mremap-from-file_operations-to-vm_operations_struct-fix
Date: Tue, 21 Jul 2015 11:38:51 -0400
Message-ID: <20150721153851.GK21558@kvack.org>
References: <20150716231405.GA25147@redhat.com> <20150721152903.GA10180@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from kanga.kvack.org ([205.233.56.17]:42602 "EHLO kanga.kvack.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754146AbbGUPiw (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Jul 2015 11:38:52 -0400
Content-Disposition: inline
In-Reply-To: <20150721152903.GA10180@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Joonsoo Kim <js1304@gmail.com>, Fengguang Wu <fengguang.wu@intel.com>, Jeff Moyer <jmoyer@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 21, 2015 at 05:29:03PM +0200, Oleg Nesterov wrote:
> Andrew,
> 
> this replaces
> 
> 	mm-move-mremap-from-file_operations-to-vm_operations_struct-fix.patch
> 
> in -mm tree nacked by Benjamin.
> 
> fs/aio.c can't be compiled if CONFIG_MMU=n, filemap_page_mkwrite() is
> not defined in this case. Add ifdef(CONFIG_MMU) into aio_ring_vm_ops.
> 
> Note that this only fixes the build error, currently aio doesn't work
> if !CONFIG_MMU anyway.
> 
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>
> ---
>  fs/aio.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/aio.c b/fs/aio.c
> index c122624..822c199 100644
> --- a/fs/aio.c
> +++ b/fs/aio.c
> @@ -338,9 +338,11 @@ static int aio_ring_mremap(struct vm_area_struct *vma)
>  
>  static const struct vm_operations_struct aio_ring_vm_ops = {
>  	.mremap		= aio_ring_mremap,
> +#ifdef CONFIG_MMU
>  	.fault		= filemap_fault,
>  	.map_pages	= filemap_map_pages,
>  	.page_mkwrite	= filemap_page_mkwrite,
> +#endif
>  };

One nit: using #if IS_ENABLED(CONFIG_MMU) is recommended these days not 
#ifdef CONFIG_MMU.

		-ben

>  static int aio_ring_mmap(struct file *file, struct vm_area_struct *vma)
> -- 
> 1.7.1
> 

-- 
"Thought is the essence of where you are now."
