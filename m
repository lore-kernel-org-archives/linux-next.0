From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: linux-next: kbuild tree build failure
Date: Wed, 26 Nov 2008 22:06:57 +0100
Message-ID: <20081126210657.GA11963@uranus.ravnborg.org>
References: <20081126154206.31958aed.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:60976 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752222AbYKZVFc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 26 Nov 2008 16:05:32 -0500
Content-Disposition: inline
In-Reply-To: <20081126154206.31958aed.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org

On Wed, Nov 26, 2008 at 03:42:06PM +1100, Stephen Rothwell wrote:
> Hi Sam,
> 
> Today's linux-next build (x86_64 allmodconfig) failed like this:
> 
> In file included from arch/x86/include/asm/processor.h:15,
>                  from include/linux/prefetch.h:14,
>                  from include/linux/list.h:6,
>                  from include/linux/module.h:9,
>                  from kernel/configs.mod.c:1:
> arch/x86/include/asm/current.h:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before 'struct'
> 
> and went rapidly down hill from there.

This bug puzzeled me for a while...
It triggers only when we do make O=... builds (which I did not do for a total build myself)
But the flags are the same but in different order before/after my patch.

Moving -D__KERNEL__ to be present earlier on the commandline fixed the build but
it did not explain why it worked in the non O=... case.
So I had to look for something else.

I noticed that I had the following options in the O=... case:

-I/full/path/ -I -D__KERNEL__

And there I had the bug. There is an optional space between -I and the path,
so in this case gcc assume the path for the empty -I is "-D__KERNEL__"
and we looses the -D__KERNEL__ definition - not good.

But why had we not seen this before?
Before it looked like this:
-I/full/path/ -I -Wall
so in the old case we lost the "-Wall" option.

But as this bug only manifest itself when building the module.mod.o
file then it is of no importance and not something I need to go back
and fix in older kernels.

I will cook up a fix tomorrow if day-time job does not become night-time.

	Sam
