From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: ftrace tree build failure
Date: Fri, 2 Jan 2009 10:14:56 +0100
Message-ID: <20090102091456.GB30018@elte.hu>
References: <20090102200754.3cd3661c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:49400 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752007AbZABJPD (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 2 Jan 2009 04:15:03 -0500
Content-Disposition: inline
In-Reply-To: <20090102200754.3cd3661c.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi Ingo,
> 
> Today's linux-next build (sparc defconfig) failed like this:
> 
> mm/slab.c:105:31: error: tracing/kmemtrace.h: No such file or directory
> 
> Caused by commit 3fd4bc015ef879a7d2b955ce97fb125e3a51ba7e
> ("tracing/kmemtrace: export kmemtrace_mark_alloc_node() /
> kmemtrace_mark_free()") from the ftrace tree.
> 
> For a "build fix", this didn't :-)
> 
> I didn't revert the ftrace tree today, but added the patch below.  A bit
> more care, please.

this has been fixed already a few days ago (if you google for the build 
failure string it will send you straight to the fix patch) - i just didnt 
push it out to the -next branches yet during the hollidays. (did that now)

Generally if you see a problem with our trees you can check whether an 
issue is still present in tip/master:

  http://people.redhat.com/mingo/tip.git/README

before duplicating fixing effort and reporting it as a genuine issue - 
especially in a busy timeframe like the merge window when the _next_ merge 
window is the least of our worries.

Thanks,

	Ingo
