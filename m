From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: block tree build failure
Date: Wed, 26 Nov 2008 12:28:36 +0100
Message-ID: <20081126112836.GB23544@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au> <20081126104259.GB6052@elte.hu> <20081126104700.GI26308@kernel.dk> <20081126111621.GA20601@elte.hu> <20081126112026.GJ26308@kernel.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:50662 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752266AbYKZL3b (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 06:29:31 -0500
Content-Disposition: inline
In-Reply-To: <20081126112026.GJ26308@kernel.dk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <jens.axboe@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Arnaldo Carvalho de Melo <acme@redhat.com>


* Jens Axboe <jens.axboe@oracle.com> wrote:

> On Wed, Nov 26 2008, Ingo Molnar wrote:
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
> > thanks, here's the conversion to tracepoints below. Stephen, you 
> > might want to pick up the blk tree straight away plus the fix 
> > below.
> 
> I already pruned the patch from for-next and updated it, so you 
> should not have any conflicts with or without this being merged.

ok, thanks. The next ftrace-next update will have this.

	Ingo
