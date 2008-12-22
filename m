From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] m68k: Kill several external declarations in source files
 (was: Re: linux-next: boot-params tree build failure)
Date: Mon, 22 Dec 2008 08:30:34 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0812220830170.3499@anakin>
References: <20081217165557.b4898a4b.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0812170915400.29433@anakin> <Pine.LNX.4.64.0812211205270.3499@anakin>
 <200812220851.44880.rusty@rustcorp.com.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from nelson.telenet-ops.be ([195.130.133.66]:57847 "EHLO
	nelson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752356AbYLVHak (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 22 Dec 2008 02:30:40 -0500
In-Reply-To: <200812220851.44880.rusty@rustcorp.com.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>, Linux Kernel Development <linux-kernel@vger.kernel.org>

On Mon, 22 Dec 2008, Rusty Russell wrote:
> On Sunday 21 December 2008 21:42:44 Geert Uytterhoeven wrote:
> > Shall I cherry pick this into my for-next branch (breaking Rusty's changes),
> > or wait until the current linux-next has been merged by Linus (and maybe
> > postpone to .30)?
> 
> Good q.  I can take the just setup.c changes and roll them into the
> boot-params tree if you want?

Fine for me! Thx!

> ie. something like:
> 
> Subject: m68k: Use asm/sections.h in kernel/setup.c

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
