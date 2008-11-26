From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: block tree build failure
Date: Wed, 26 Nov 2008 12:25:46 +0100
Message-ID: <20081126112546.GA23544@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126111621.GA20601@elte.hu> <20081126112310.GA17392@Krystal>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:54188 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750971AbYKZL0I (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:26:08 -0500
Content-Disposition: inline
In-Reply-To: <20081126112310.GA17392@Krystal>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
Cc: Jens Axboe <jens.axboe@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>


* Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca> wrote:

> * Ingo Molnar (mingo@elte.hu) wrote:
> > 
> > * Jens Axboe <jens.axboe@oracle.com> wrote:
> > 
> > > > the other direction (you merging ftrace bits) doesnt look too hot, 
> > > > you'd have to pick up:
> > > > 
> > > >    95 files changed, 5308 insertions(+), 1603 deletions(-)
> > > 
> > > Lets do that, it's just a single patch here from Arnaldo. I have 
> > > attached it to this email.
> > 
> > thanks, here's the conversion to tracepoints below. Stephen, you might 
> > want to pick up the blk tree straight away plus the fix below.
> 
> I guess the only difference between your implementation and mine is 
> that you define all the tracepoints in block/blktrace.c, while I 
> define them in the various files where they are used. I don't feel 
> very strongly opinioned about any of the two alternatives.

usage site build attribute must be the same as definition site 
attribute. So blktrace.c is not a good place - we will fail the build 
in the !CONFIG_BLK_DEV_IO_TRACE case. I'll apply your spread-out 
definition variant.

	Ingo
