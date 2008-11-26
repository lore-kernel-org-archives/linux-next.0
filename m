From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: block tree build failure
Date: Wed, 26 Nov 2008 11:42:59 +0100
Message-ID: <20081126104259.GB6052@elte.hu>
References: <20081126212920.f992f7a5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:58438 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751276AbYKZKnR (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 26 Nov 2008 05:43:17 -0500
Content-Disposition: inline
In-Reply-To: <20081126212920.f992f7a5.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Jens Axboe <jens.axboe@oracle.com>, linux-next@vger.kernel.org, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>, Arnaldo Carvalho de Melo <acme@redhat.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Jens,
> 
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> In file included from block/blk-core.c:31:
> include/trace/block.h:9:15: error: macro "DEFINE_TRACE" passed 3 arguments, but takes just 1
> In file included from block/blk-core.c:31:
> include/trace/block.h:7: warning: data definition has no type or storage class
> include/trace/block.h:7: warning: type defaults to 'int' in declaration of 'DEFINE_TRACE'
> 
> and many more.  This is caused by commit 
> 714d010b5c249c2e9282515e0a2309a61ababbf4 ("blktrace: port to 
> tracepoints") interacting with commit 
> 7e066fb870fcd1025ec3ba7bbde5d541094f4ce1 ("tracepoints: add 
> DECLARE_TRACE () and DEFINE_TRACE()") which entered linux-next for 
> the first time today via the ftrace tree. This latter commit has 
> changed the tracepoints API.
> 
> I will drop the block tree for today.  I am not sure of the way forward.

hm, i think that might be interaction between ftrace tree updates and 
blktrace?

Jens, would it be fine with you if we created a new 
tip/tracing/blktrace branch and picked up your changes and kept it all 
uptodate and merged with the ftrace tree? It should merge fine with 
other bits of the block tree, right? (the tracepoints are in rather 
stable spots of the code i think)

the other direction (you merging ftrace bits) doesnt look too hot, 
you'd have to pick up:

   95 files changed, 5308 insertions(+), 1603 deletions(-)

	Ingo
