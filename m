From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: linux-next: manual merge of sparc tree
Date: Tue, 17 Jun 2008 23:16:53 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0806172316140.8377@anakin>
References: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
 <20080617.003534.193689527.davem@davemloft.net> <Pine.LNX.4.64.0806172231100.8377@anakin>
 <20080617210342.GA25911@cs181133002.pp.htv.fi>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-next-owner@vger.kernel.org>
Received: from wilson.telenet-ops.be ([195.130.132.42]:58649 "EHLO
	wilson.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753340AbYFQVQz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Jun 2008 17:16:55 -0400
In-Reply-To: <20080617210342.GA25911@cs181133002.pp.htv.fi>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Adrian Bunk <bunk@stusta.de>
Cc: David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>

On Wed, 18 Jun 2008, Adrian Bunk wrote:
> On Tue, Jun 17, 2008 at 10:32:01PM +0200, Geert Uytterhoeven wrote:
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
> Sorry for this mess, I'm in the unlucky position of having made both 
> conflicting commits.  :-(
>
> Below is the part of the commit that caused this conflict.

IC...

> m68k: remove stale ARCH_SUN4 #define

Thx, queued for 2.6.27.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
