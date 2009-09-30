From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [Drbd-dev] [PATCH -next] drbd: trace depends on TRACING
Date: Wed, 30 Sep 2009 12:00:01 -0400
Message-ID: <20090930160001.GA3765__9938.20227818123$1254326498$gmane$org@infradead.org>
References: <20090925133830.1ba29584.sfr@canb.auug.org.au> <4ABD4C28.9070202@oracle.com> <200909291732.51383.philipp.reisner@linbit.com> <20090929153747.GA29621@infradead.org> <20090930080221.GA8032@barkeeper1-xen.linbit>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([18.85.46.34]:45848 "EHLO
	bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754910AbZI3QAE (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 30 Sep 2009 12:00:04 -0400
Content-Disposition: inline
In-Reply-To: <20090930080221.GA8032@barkeeper1-xen.linbit>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Philipp Reisner <philipp.reisner@linbit.com>, Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, LKML <linux-kernel@vger.kernel.org>, linux-next@vger.ker

On Wed, Sep 30, 2009 at 10:02:21AM +0200, Lars Ellenberg wrote:
> TRACE_EVENT macros depend on, and use TRACE_POINTS.
> And those trace points are what compiles away if !CONFIG_TRACEPOINTS, no?

Everything compiles away when the right options are not selected.

> If using tracepoints directly, not using the (admittedly elegant)
> trace-events macro system, is in fact not wanted anymore, then
> Documentation/trace/* should be changed accordingly.

I could not find anything actively suggesting to use them.  And if you
look at current mainline there is in fact no user of raw tracepoints
left and none should be introduced.  If you add fancy new tracing it
might be a good idea to run it past Ingo and Steve, btw.

Ingo, now that we killed all raw tracepoints users, what do you think
about removing Documentation/trace/tracepoints.txt and
samples/tracepoints so that people have no easy way to use them?

Even better would be making their use really hard, which is not too easy
as they are used by TRACE_EVENT underneath.

> So what is the plan, going forward?

The plan is that all new tracing should use TRACE_EVENT.  If that
doesn't work for some reason bring it up with the tracing people
for discussion.
