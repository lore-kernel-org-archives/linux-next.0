From: Hugh Dickins <hughd@google.com>
Subject: Re: linux-next: build failure after merge of the akpm tree
Date: Wed, 25 Sep 2013 14:32:14 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.1309251426150.2479@eggly.anvils>
References: <20130925110643.db5fa154bea3838ed6affa45@canb.auug.org.au> <20130925132612.d1685bc8fb72558eef6fb09d@linux-foundation.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:62548 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755411Ab3IYVcq (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 25 Sep 2013 17:32:46 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so377927pad.19
        for <linux-next@vger.kernel.org>; Wed, 25 Sep 2013 14:32:46 -0700 (PDT)
In-Reply-To: <20130925132612.d1685bc8fb72558eef6fb09d@linux-foundation.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Frederic Weisbecker <fweisbec@gmail.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergei Trofimovich <slyfox@gentoo.org>, Timur Tabi <timur@freescale.com>, Greg KH <greg@kroah.com>, ppc-dev <linuxppc-dev@lists.ozlabs.org>

On Wed, 25 Sep 2013, Andrew Morton wrote:
> On Wed, 25 Sep 2013 11:06:43 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi Andrew,
> > 
> > After merging the akpm tree, linux-next builds (powerpc allmodconfig)
> > fail like this:
> 
> I can't get powerpc to build at all at present:
> 
>   CHK     include/config/kernel.release
>   CHK     include/generated/uapi/linux/version.h
>   CHK     include/generated/utsrelease.h
>   CC      arch/powerpc/kernel/asm-offsets.s
> In file included from include/linux/vtime.h:6,
>                  from include/linux/hardirq.h:7,
>                  from include/linux/memcontrol.h:24,
>                  from include/linux/swap.h:8,
>                  from include/linux/suspend.h:4,
>                  from arch/powerpc/kernel/asm-offsets.c:24:
> arch/powerpc/include/generated/asm/vtime.h:1:31: error: asm-generic/vtime.h: No such file or directory

That caught me too: include/asm-generic/vtime.h is a patch-unfriendly
0-length file in the git tree; I wonder what use it's supposed to have.

(And I'm not very keen on the growing trend for symlinks in the git tree.)

Hugh
