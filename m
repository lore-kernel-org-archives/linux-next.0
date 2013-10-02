From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Wed, 2 Oct 2013 10:53:11 +0200
Message-ID: <20131002085308.GA7941@localhost.localdomain>
References: <20130925110643.db5fa154bea3838ed6affa45@canb.auug.org.au>
 <20130925132612.d1685bc8fb72558eef6fb09d@linux-foundation.org>
 <alpine.LNX.2.00.1309251426150.2479@eggly.anvils>
 <20130925144328.c679dc74178e78e188386b5a@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:39490 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752765Ab3JBIxO (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 2 Oct 2013 04:53:14 -0400
Content-Disposition: inline
In-Reply-To: <20130925144328.c679dc74178e78e188386b5a@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Hugh Dickins <hughd@google.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergei Trofimovich <slyfox@gentoo.org>, Timur Tabi <timur@freescale.com>, Greg KH <greg@kroah.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Wed, Sep 25, 2013 at 02:43:28PM -0700, Andrew Morton wrote:
> On Wed, 25 Sep 2013 14:32:14 -0700 (PDT) Hugh Dickins <hughd@google.com> wrote:
> 
> > On Wed, 25 Sep 2013, Andrew Morton wrote:
> > > On Wed, 25 Sep 2013 11:06:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > > > Hi Andrew,
> > > > 
> > > > After merging the akpm tree, linux-next builds (powerpc allmodconfig)
> > > > fail like this:
> > > 
> > > I can't get powerpc to build at all at present:
> > > 
> > >   CHK     include/config/kernel.release
> > >   CHK     include/generated/uapi/linux/version.h
> > >   CHK     include/generated/utsrelease.h
> > >   CC      arch/powerpc/kernel/asm-offsets.s
> > > In file included from include/linux/vtime.h:6,
> > >                  from include/linux/hardirq.h:7,
> > >                  from include/linux/memcontrol.h:24,
> > >                  from include/linux/swap.h:8,
> > >                  from include/linux/suspend.h:4,
> > >                  from arch/powerpc/kernel/asm-offsets.c:24:
> > > arch/powerpc/include/generated/asm/vtime.h:1:31: error: asm-generic/vtime.h: No such file or directory
> > 
> > That caught me too: include/asm-generic/vtime.h is a patch-unfriendly
> > 0-length file in the git tree;
> 
> hm, this?
> 
> 
> From: Andrew Morton <akpm@linux-foundation.org>
> Subject: include/asm-generic/vtime.h: avoid zero-length file
> 
> patch(1) can't handle zero-length files - it appears to simply not create
> the file, so my powerpc build fails.
> 
> Put something in here to make life easier.
> 
> Cc: Hugh Dickins <hughd@google.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
> 
>  include/asm-generic/vtime.h |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff -puN /dev/null include/asm-generic/vtime.h
> --- /dev/null
> +++ a/include/asm-generic/vtime.h
> @@ -0,0 +1 @@
> +/* no content, but patch(1) dislikes empty files */
> _
> 
> 
> 
> > I wonder what use it's supposed to have.
> 
> Frederic, can you please confirm that include/asm-generic/vtime.h is
> supposed to be empty?

Yep. I use <asm/vtime.h> to let archs override some CPP symbols. And if they
don't override these, they simply return the generic vtime.h file that is empty
and as such doesn't override anything.

May be that's an ugly way to handle this kind of override scenario but I
couldn't find a better mechanism.

Actually, a Kconfig symbol would do the trick. It just seemed to me like
an overkill at that time. But it may be better.

Thanks.

> 
> > (And I'm not very keen on the growing trend for symlinks in the git tree.)
> 
> ooh, that explains why I lost my arch/microblaze/boot/dts/system.dts.
