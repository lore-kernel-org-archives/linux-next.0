From: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Subject: Re: [PATCH] Blktrace : conversion to tracepoint define
Date: Wed, 26 Nov 2008 06:27:13 -0500
Message-ID: <20081126112713.GC17392@Krystal>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126110631.GD14826@Krystal> <20081126112208.GB20601@elte.hu> <20081126112351.GA23386@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tomts10.bellnexxia.net ([209.226.175.54]:36132 "EHLO
	tomts10-srv.bellnexxia.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750971AbYKZL1P (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:27:15 -0500
Received: from toip4.srvr.bell.ca ([209.226.175.87])
          by tomts10-srv.bellnexxia.net
          (InterMail vM.5.01.06.13 201-253-122-130-113-20050324) with ESMTP
          id <20081126112713.ZRZW1703.tomts10-srv.bellnexxia.net@toip4.srvr.bell.ca>
          for <linux-next@vger.kernel.org>; Wed, 26 Nov 2008 06:27:13 -0500
Content-Disposition: inline
In-Reply-To: <20081126112351.GA23386@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

* Ingo Molnar (mingo@elte.hu) wrote:
> 
> * Ingo Molnar <mingo@elte.hu> wrote:
> 
> > Moving the tracepoint definitions into blktrace.c consolidates it 
> > nicely without cluttering the various block/* files and ties their 
> > presence to CONFIG_BLK_DEV_IO_TRACE as well.
> 
> hm, the latter is not a good idea: the tracepoints will be undefined 
> when the io tracer is disabled - not good. I'll spread them out like 
> you did.
> 
> 	Ingo

Ah, yes, I thought there should be good reason for me doing things the
way I did them. ;)

Mathieu

-- 
Mathieu Desnoyers
OpenPGP key fingerprint: 8CD5 52C3 8E3C 4140 715F  BA06 3F25 A8FE 3BAE 9A68
