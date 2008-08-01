From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: m68k build failure
Date: Fri, 1 Aug 2008 15:52:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0808011551120.30950@anakin>
References: <20080730175233.02dbf021.sfr@canb.auug.org.au>
 <20080730.010234.193703201.davem@davemloft.net> <20080730084935.GA18545@uranus.ravnborg.org>
 <20080801153710.815bbb74.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:57889 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751612AbYHANw0 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 Aug 2008 09:52:26 -0400
In-Reply-To: <20080801153710.815bbb74.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Linux/m68k <linux-m68k@vger.kernel.org>

	Hi Stephen,

On Fri, 1 Aug 2008, Stephen Rothwell wrote:
> On Wed, 30 Jul 2008 10:49:35 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Full list of relevant files:
> > include/asm-m68k/contregs.h:#include <asm-sparc/contregs.h>
> > include/asm-m68k/fbio.h:#include <asm-sparc/fbio.h>
> > include/asm-m68k/idprom.h:#include <asm-sparc/idprom.h>
> 
> I applied the following patch to today's linux-next.

Thanks!

BTW, is there a (good) way to have this without duplicating those header files?

I hope to move to arch/m68k/include soon, too.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
