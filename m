From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 12:22:08 +0100
Message-ID: <20081126112208.GB20601@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126110631.GD14826@Krystal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:55944 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752251AbYKZLWc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:22:32 -0500
Content-Disposition: inline
In-Reply-To: <20081126110631.GD14826@Krystal>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>


* Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> wrote:

> Here is the conversion to the new tracepoint API, which applies to 
> -tip after the patch you just emailed.
> 
> Mathieu
> 
> 
> Blktrace : conversion to tracepoint define
> 
> Adapt declaration/definitions of blktrace tracepoints to the new 
> tracepoint API.
> 
> Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
> CC: Arnaldo Carvalho de Melo <acme@redhat.com>
> CC: 'Ingo Molnar' <mingo@elte.hu>
> CC: Jens Axboe <jens.axboe@oracle.com>
> CC: Arnaldo Carvalho de Melo <acme@redhat.com>
> CC: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  block/blk-core.c      |   13 +++++++++++++
>  block/elevator.c      |    3 +++
>  drivers/md/dm.c       |    2 ++
>  fs/bio.c              |    2 ++
>  include/trace/block.h |   34 +++++++++++++++++-----------------
>  mm/bounce.c           |    2 ++
>  6 files changed, 39 insertions(+), 17 deletions(-)
> 
> Index: linux.trees.git/mm/bounce.c
> ===================================================================
> --- linux.trees.git.orig/mm/bounce.c	2008-11-26 05:49:40.000000000 -0500
> +++ linux.trees.git/mm/bounce.c	2008-11-26 05:50:08.000000000 -0500
> @@ -22,6 +22,8 @@
>  
>  static mempool_t *page_pool, *isa_page_pool;
>  
> +DEFINE_TRACE(block_bio_bounce);
> +

>  #ifdef CONFIG_HIGHMEM
>  static __init int init_emergency_pool(void)
>  {
> Index: linux.trees.git/fs/bio.c
> ===================================================================
> --- linux.trees.git.orig/fs/bio.c	2008-11-26 05:49:40.000000000 -0500
> +++ linux.trees.git/fs/bio.c	2008-11-26 05:50:25.000000000 -0500
> @@ -29,6 +29,8 @@
>  #include <trace/block.h>
>  #include <scsi/sg.h>		/* for struct sg_iovec */
>  
> +DEFINE_TRACE(block_split);
> +
>  static struct kmem_cache *bio_slab __read_mostly;

heh, just did a similar patch :)

i moved the tracepoint definitions into a central place in 
block/blktrace.c, not spread out in the block files - because some of 
the tracepoints such as trace_block_remap() get used from multiple 
places so there's no real "home" file for them.

Moving the tracepoint definitions into blktrace.c consolidates it 
nicely without cluttering the various block/* files and ties their 
presence to CONFIG_BLK_DEV_IO_TRACE as well.

	Ingo
