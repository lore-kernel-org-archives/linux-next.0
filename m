From: Mike Frysinger <vapier@gentoo.org>
Subject: Re: linux-next: build failure after merge of the final tree
Date: Fri, 27 May 2011 10:47:00 -0400
Message-ID: <BANLkTi=x=M4wwOxKjDvfiXwu6Ay0SxmkKA@mail.gmail.com>
References: <20110527151135.cd6f758a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61802 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922Ab1E0OrV (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 May 2011 10:47:21 -0400
In-Reply-To: <20110527151135.cd6f758a.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Linus <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>

On Fri, May 27, 2011 at 01:11, Stephen Rothwell wrote:
> After merging the final tree, today's linux-next build (sparc32 defconfig)
> failed like this:
>
> drivers/misc/kgdbts.c: In function 'check_and_rewind_pc':
> drivers/misc/kgdbts.c:307: error: implicit declaration of function 'instruction_pointer_set'
>
> Caused by commit 63ab25ebbc50 ("kgdbts: unify/generalize gdb breakpoint
> adjustment") from Linus' tree.
>
> Lots of architectures do not use asm-generic/ptrace.h where
> instruction_pointer_set() is defined.

yes, but lots of arches dont implement kgdb, so it doesnt matter :).
i thought i got all of them, but i must have missed some, or new
arches showed up since i wrote the patches.  i'll take a look later
today and send out a fix.
-mike
