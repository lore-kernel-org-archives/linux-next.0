From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Re: linux-next: manual merge of the powerpc tree
Date: Sat, 12 Jul 2008 13:41:30 +1000
Message-ID: <1215834090.7549.149.camel@pasglop>
References: <20080707230717.10429faf.sfr@canb.auug.org.au>
	 <200807112101.25704.bzolnier@gmail.com>
Reply-To: benh@kernel.crashing.org
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:46630 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756631AbYGLDro (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 23:47:44 -0400
In-Reply-To: <200807112101.25704.bzolnier@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Daniel Walker <dwalker@mvista.com>, Andrew Morton <akpm@linux-foundation.org>

On Fri, 2008-07-11 at 21:01 +0200, Bartlomiej Zolnierkiewicz wrote:
> 
> Since I haven't heard back from Ben [1] on ide-pmac/media-bay IRQ issue
> I took another look at ide-pmac patches and I think that it should be
> possible to rework them in such way that consecutive ide patches (> 100)
> won't depend on "ide-pmac: media-bay support fixes (take 4)" patch.
> 
> This would allow us to re-schedule it to 2.6.28 (which is probably what
> we want because 2.6.26 is probably just around the corner and we will be
> pretty busy with 2.6.27 merge window soon).  Ben, what's your opinion?
> 
> [1] which doesn't surprise me given his new responsibilities ;)

That and I just moved house... been hectic lately.

I'll give another shot at the IRQ issues early next week, and if it
still doesn't work, we'll postpone.

Cheers,
Ben.
