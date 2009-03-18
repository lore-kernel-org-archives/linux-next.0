From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: Tree for March 11 (tracing)
Date: Wed, 18 Mar 2009 17:06:21 +0100
Message-ID: <20090318160621.GA21331@elte.hu>
References: <20090311225913.51589223.sfr@canb.auug.org.au> <49B7F691.5000305@oracle.com> <49B93584.3020302@oracle.com> <1236875181.11290.1.camel@localhost.localdomain> <20090318084651.3dbf01e3.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:38934 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752937AbZCRQGm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Mar 2009 12:06:42 -0400
Content-Disposition: inline
In-Reply-To: <20090318084651.3dbf01e3.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Steven Rostedt <srostedt@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frederic Weisbecker <fweisbec@gmail.com>


* Randy Dunlap <randy.dunlap@oracle.com> wrote:

> On Thu, 12 Mar 2009 12:26:21 -0400 Steven Rostedt wrote:
> 
> > 
> > On Thu, 2009-03-12 at 09:17 -0700, Randy Dunlap wrote:
> > > [adding cc:s]
> > > 
> > > [same report for March 12]
> > > 
> > > Randy Dunlap wrote:
> > > > Stephen Rothwell wrote:
> > > >> Hi all,
> > > >>
> > > >> Changes since 20090310:
> > > > 
> > > > 
> > > > Building on i386 generates a ton of printk format warnings:
> > > > 
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 5 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 6 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 9 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 10 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 13 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 14 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 17 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 18 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 21 has type 'unsigned int'
> > > > kernel/trace/trace_events.c:470: warning: format '%lu' expects type 'long unsigned int', but argument 22 has type 'unsigned int'
> > > > 
> > 
> > I believe this is corrected in Ingo's tip tree. I changed %lu to %zu to
> > handle the "sizeof()" case. The fix was suggested by Andrew Morton.
> 
> 
> This build warning is still around (20090318).
> Is the fix not in some branch that is imported into linux-next or what?

be patient.

	Ingo
