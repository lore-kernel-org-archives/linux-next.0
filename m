From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] tracing/mm: Move include of trace/events/kmem.h out of
 header into slab.c
Date: Mon, 09 Jan 2012 14:21:04 -0800 (PST)
Message-ID: <20120109.142104.622129906887115582.davem@davemloft.net>
References: <1326147342.7642.41.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([198.137.202.13]:36698 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755793Ab2AIWXQ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 9 Jan 2012 17:23:16 -0500
In-Reply-To: <1326147342.7642.41.camel@gandalf.stny.rr.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: rostedt@goodmis.org
Cc: linux-kernel@vger.kernel.org, sfr@canb.auug.org.au, greg@kroah.com, kay.sievers@vrfy.org, akpm@linux-foundation.org, fweisbec@gmail.com, mingo@redhat.com, linux-next@vger.kernel.org, torvalds@linux-foundation.org

From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 09 Jan 2012 17:15:42 -0500

> Including trace/events/*.h TRACE_EVENT() macro headers in other headers
> can cause strange side effects if another trace/event/*.h header
> includes that header. Having trace/events/kmem.h inside slab_def.h
> caused a compile error in sparc64 when changes were done to some header
> files. Moving the kmem.h trace header out of slab.h and into slab.c
> fixes the problem.
> 
> Note, both slub.c and slob.c already include the trace/events/kmem.h
> file. Only slab.c had it missing.
> 
> Link: http://lkml.kernel.org/r/20120105190405.1e3191fb5a43b2a0f1655e1f@canb.auug.org.au
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Acked-by: David S. Miller <davem@davemloft.net>
