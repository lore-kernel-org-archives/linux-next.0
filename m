From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of sparc tree
Date: Wed, 18 Jun 2008 09:34:40 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806180933110.8377@anakin>
References: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
 <20080617.003534.193689527.davem@davemloft.net> <Pine.LNX.4.64.0806172231100.8377@anakin>
 <20080617.223707.49467656.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from harold.telenet-ops.be ([195.130.133.65]:44459 "EHLO
	harold.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752922AbYFRHen (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Jun 2008 03:34:43 -0400
In-Reply-To: <20080617.223707.49467656.davem@davemloft.net>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, bunk@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Tue, 17 Jun 2008, David Miller wrote:
> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Date: Tue, 17 Jun 2008 22:32:01 +0200 (CEST)
> 
> > On Tue, 17 Jun 2008, David Miller wrote:
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 17 Jun 2008 17:21:50 +1000
> > > 
> > > > Today's linux-next merge of the sparc tree got a trivial contextual
> > > > conflict in include/asm-m68k/sbus.h between commit
> > > > 69edc57f65f2d0bf63485cba4567876a1cfa3dae ("m68k/sun3/: possible
> > > > cleanups") from the m68k tree and commit
> > > > 878e7a6e498bec55f10a163197c41554fb078416 ("sparc: remove CONFIG_SUN4")
> > > > from the sparc tree.
> > > > 
> > > > It was just close changes to the same file.  I fixed it up.
> > 
> > If you want your change to include/asm-m68k/sbus.h to go in through the
> > m68k tree, please send me the patch.
> 
> It's part of a tree-wide removal of CONFIG_SUN4.  If Stephen doesn't

For sparc it is. For m68k, it's the removal of something that was
blindly copied and never needed.

> mind making this minor merge fixup all the time, it's probably
> best to keep it in the sparc tree.

Never mind, I already added it to my tree. Probably yours will be
integrated in mainline earlier, so I'll just drop it at that time.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
