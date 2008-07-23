From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: ttydev tree build failure
Date: Wed, 23 Jul 2008 17:49:13 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0807231748250.20868@anakin>
References: <20080723171743.1436cf2a.sfr@canb.auug.org.au>
 <Pine.LNX.4.64.0807231436310.1185@anakin> <20080723154610.348ffc07@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from monty.telenet-ops.be ([195.130.132.56]:56847 "EHLO
	monty.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752581AbYGWPtP (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 23 Jul 2008 11:49:15 -0400
In-Reply-To: <20080723154610.348ffc07@lxorguk.ukuu.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Linux/m68k <linux-m68k@vger.kernel.org>

	Hi Alan,

On Wed, 23 Jul 2008, Alan Cox wrote:
> On Wed, 23 Jul 2008 14:39:08 +0200 (CEST)
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Wed, 23 Jul 2008, Stephen Rothwell wrote:
> > > Today's linux-next build (m68k defconfig) failed like this:
> > > 
> > > drivers/char/vme_scc.c:186: error: 'struct gs_port' has no member named 'open_wait'
> > 
> > Not just in linux-next, also in mainline, while these problems have been
> > reported before.
> 
> And at the time I asked if anyone was using this hardware and if so would
> they send patches. Shall I send Linus patches to delete them or is anyone
> actually using this stuff ?

Sorry, I did not see that question.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
