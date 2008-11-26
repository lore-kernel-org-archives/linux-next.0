From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 06:56:41 -0500
Message-ID: <20081126115640.GA19132@Krystal>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126110631.GD14826@Krystal> <20081126113727.GA25861@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tomts10.bellnexxia.net ([209.226.175.54]:37135 "EHLO
	tomts10-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751255AbYKZL4m (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:56:42 -0500
Received: from toip6.srvr.bell.ca ([209.226.175.125])
          by tomts10-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20081126115641.ZWSP1703.tomts10-srv.bellnexxia.net@toip6.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 06:56:41 -0500
Content-Disposition: inline
In-Reply-To: <20081126113727.GA25861@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

* Ingo Molnar (mingo@elte.hu) wrote:
> 
> * Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> wrote:
> 
> > +DECLARE_TRACE(block_rq_abort,
> 
> btw., you forgot to define this one.
> 

I seems like it comes from a delta between 2.6.27.7 and 2.6.28-rc.
Thanks for spotting it.

Mathieu

> it should all be fine in tip/tracing/blktrace.
> 
> 	Ingo

-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
