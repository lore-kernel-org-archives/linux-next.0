From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: linux-next: block tree build failure
Date: Wed, 26 Nov 2008 06:23:10 -0500
Message-ID: <20081126112310.GA17392@Krystal>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126111621.GA20601@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tomts16.bellnexxia.net ([209.226.175.4]:56850 "EHLO
	tomts16-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752207AbYKZLXN (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:23:13 -0500
Received: from toip6.srvr.bell.ca ([209.226.175.125])
          by tomts16-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20081126112312.IBFT1809.tomts16-srv.bellnexxia.net@toip6.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 06:23:12 -0500
Content-Disposition: inline
In-Reply-To: <20081126111621.GA20601@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

* Ingo Molnar (mingo@elte.hu) wrote:
> 
> * Jens Axboe <jens.axboe@oracle.com> wrote:
> 
> > > the other direction (you merging ftrace bits) doesnt look too hot, 
> > > you'd have to pick up:
> > > 
> > >    95 files changed, 5308 insertions(+), 1603 deletions(-)
> > 
> > Lets do that, it's just a single patch here from Arnaldo. I have 
> > attached it to this email.
> 
> thanks, here's the conversion to tracepoints below. Stephen, you might 
> want to pick up the blk tree straight away plus the fix below.
> 

I guess the only difference between your implementation and mine is that
you define all the tracepoints in block/blktrace.c, while I define them
in the various files where they are used. I don't feel very strongly
opinioned about any of the two alternatives.

Mathieu

> 	Ingo
> 
> --------------->
> From 65ae5a3c622e707dbf7630397e94b7e2e9cd0ea5 Mon Sep 17 00:00:00 2001
> From: Ingo Molnar <mingo@elte.hu>
> Date: Wed, 26 Nov 2008 11:59:56 +0100
> Subject: [PATCH] blktrace: port to tracepoints, update
> 
> Port to the new tracepoints API: split DEFINE_TRACE() and DECLARE_TRACE()
> sites.
> 
> Signed-off-by: Ingo Molnar <mingo@elte.hu>
> ---
>  block/blktrace.c      |   18 ++++++++++
>  include/trace/block.h |   84 +++++++++++++++++++++++++++++--------------------
>  2 files changed, 68 insertions(+), 34 deletions(-)
> 
> diff --git a/block/blktrace.c b/block/blktrace.c
> index b0a2cae..1dba3fb 100644
> --- a/block/blktrace.c
> +++ b/block/blktrace.c
> @@ -35,6 +35,24 @@ static atomic_t blk_probes_ref = ATOMIC_INIT(0);
>  static int blk_register_tracepoints(void);
>  static void blk_unregister_tracepoints(void);
>  
> +DEFINE_TRACE(block_bio_backmerge);
> +DEFINE_TRACE(block_bio_bounce);
> +DEFINE_TRACE(block_bio_complete);
> +DEFINE_TRACE(block_bio_frontmerge);
> +DEFINE_TRACE(block_bio_queue);
> +DEFINE_TRACE(block_getrq);
> +DEFINE_TRACE(block_plug);
> +DEFINE_TRACE(block_remap);
> +DEFINE_TRACE(block_rq_abort);
> +DEFINE_TRACE(block_rq_complete);
> +DEFINE_TRACE(block_rq_insert);
> +DEFINE_TRACE(block_rq_issue);
> +DEFINE_TRACE(block_rq_requeue);
> +DEFINE_TRACE(block_sleeprq);
> +DEFINE_TRACE(block_split);
> +DEFINE_TRACE(block_unplug_io);
> +DEFINE_TRACE(block_unplug_timer);
> +
>  /*
>   * Send out a notify message.
>   */
> diff --git a/include/trace/block.h b/include/trace/block.h
> index 3cc2675..25c6a1f 100644
> --- a/include/trace/block.h
> +++ b/include/trace/block.h
> @@ -4,57 +4,73 @@
>  #include <linux/blkdev.h>
>  #include <linux/tracepoint.h>
>  
> -DEFINE_TRACE(block_rq_abort,
> +DECLARE_TRACE(block_rq_abort,
>  	TPPROTO(struct request_queue *q, struct request *rq),
> -	TPARGS(q, rq));
> -DEFINE_TRACE(block_rq_insert,
> +		TPARGS(q, rq));
> +
> +DECLARE_TRACE(block_rq_insert,
>  	TPPROTO(struct request_queue *q, struct request *rq),
> -	TPARGS(q, rq));
> -DEFINE_TRACE(block_rq_issue,
> +		TPARGS(q, rq));
> +
> +DECLARE_TRACE(block_rq_issue,
>  	TPPROTO(struct request_queue *q, struct request *rq),
> -	TPARGS(q, rq));
> -DEFINE_TRACE(block_rq_requeue,
> +		TPARGS(q, rq));
> +
> +DECLARE_TRACE(block_rq_requeue,
>  	TPPROTO(struct request_queue *q, struct request *rq),
> -	TPARGS(q, rq));
> -DEFINE_TRACE(block_rq_complete,
> +		TPARGS(q, rq));
> +
> +DECLARE_TRACE(block_rq_complete,
>  	TPPROTO(struct request_queue *q, struct request *rq),
> -	TPARGS(q, rq));
> -DEFINE_TRACE(block_bio_bounce,
> +		TPARGS(q, rq));
> +
> +DECLARE_TRACE(block_bio_bounce,
>  	TPPROTO(struct request_queue *q, struct bio *bio),
> -	TPARGS(q, bio));
> -DEFINE_TRACE(block_bio_complete,
> +		TPARGS(q, bio));
> +
> +DECLARE_TRACE(block_bio_complete,
>  	TPPROTO(struct request_queue *q, struct bio *bio),
> -	TPARGS(q, bio));
> -DEFINE_TRACE(block_bio_backmerge,
> +		TPARGS(q, bio));
> +
> +DECLARE_TRACE(block_bio_backmerge,
>  	TPPROTO(struct request_queue *q, struct bio *bio),
> -	TPARGS(q, bio));
> -DEFINE_TRACE(block_bio_frontmerge,
> +		TPARGS(q, bio));
> +
> +DECLARE_TRACE(block_bio_frontmerge,
>  	TPPROTO(struct request_queue *q, struct bio *bio),
> -	TPARGS(q, bio));
> -DEFINE_TRACE(block_bio_queue,
> +		TPARGS(q, bio));
> +
> +DECLARE_TRACE(block_bio_queue,
>  	TPPROTO(struct request_queue *q, struct bio *bio),
> -	TPARGS(q, bio));
> -DEFINE_TRACE(block_getrq,
> +		TPARGS(q, bio));
> +
> +DECLARE_TRACE(block_getrq,
>  	TPPROTO(struct request_queue *q, struct bio *bio, int rw),
> -	TPARGS(q, bio, rw));
> -DEFINE_TRACE(block_sleeprq,
> +		TPARGS(q, bio, rw));
> +
> +DECLARE_TRACE(block_sleeprq,
>  	TPPROTO(struct request_queue *q, struct bio *bio, int rw),
> -	TPARGS(q, bio, rw));
> -DEFINE_TRACE(block_plug,
> +		TPARGS(q, bio, rw));
> +
> +DECLARE_TRACE(block_plug,
>  	TPPROTO(struct request_queue *q),
> -	TPARGS(q));
> -DEFINE_TRACE(block_unplug_timer,
> +		TPARGS(q));
> +
> +DECLARE_TRACE(block_unplug_timer,
>  	TPPROTO(struct request_queue *q),
> -	TPARGS(q));
> -DEFINE_TRACE(block_unplug_io,
> +		TPARGS(q));
> +
> +DECLARE_TRACE(block_unplug_io,
>  	TPPROTO(struct request_queue *q),
> -	TPARGS(q));
> -DEFINE_TRACE(block_split,
> +		TPARGS(q));
> +
> +DECLARE_TRACE(block_split,
>  	TPPROTO(struct request_queue *q, struct bio *bio, unsigned int pdu),
> -	TPARGS(q, bio, pdu));
> -DEFINE_TRACE(block_remap,
> +		TPARGS(q, bio, pdu));
> +
> +DECLARE_TRACE(block_remap,
>  	TPPROTO(struct request_queue *q, struct bio *bio, dev_t dev,
>  		sector_t from, sector_t to),
> -	TPARGS(q, bio, dev, from, to));
> +		TPARGS(q, bio, dev, from, to));
>  
>  #endif

-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
