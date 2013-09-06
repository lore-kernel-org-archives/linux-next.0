From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: build warning after merge of the final tree (Linus'
 tree related - vai vfs tree)
Date: Fri, 6 Sep 2013 10:52:52 +0200
Message-ID: <CAMuHMdXib30o3-70EuYj3to0==b7LfwPbivF9DaBrpHPejsDFg@mail.gmail.com>
References: <20130906171916.41b5f48d1aaccca594d1e760@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f41.google.com ([209.85.220.41]:46924 "EHLO
	mail-pa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788Ab3IFIwx (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Sep 2013 04:52:53 -0400
In-Reply-To: <20130906171916.41b5f48d1aaccca594d1e760@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Al Viro <viro@zeniv.linux.org.uk>, Linux-Next <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>

On Fri, Sep 6, 2013 at 9:19 AM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> After merging the final tree, today's linux-next build (arm defconfig)
> produced this warning:
>
> fs/direct-io.c: In function 'sb_init_dio_done_wq':
> fs/direct-io.c:557:2: warning: value computed is not used [-Wunused-value]
>
> This is:
>
>         cmpxchg(&sb->s_dio_done_wq, NULL, wq);
>
> Introduced by commit 7b7a8665edd8 ("direct-io: Implement generic deferred
> AIO completions").

This happens for include/asm-generic/cmpxchg.h and several other
arch-specific implementations that cast the return value of cmpxchg()
like

#define cmpxchg(ptr, o, n)   ((__typeof__(*(ptr)))__cmpxchg(....

If the caller of cmpxchg() doesn't use the return value, we get a
compiler warning,
at least with some versions of gcc.

Any idea how to fix this once and for good?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
