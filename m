From: Adrian Bunk <bunk@stusta.de>
Subject: Re: linux-next: manual merge of sparc tree
Date: Wed, 18 Jun 2008 00:03:42 +0300
Message-ID: <20080617210342.GA25911@cs181133002.pp.htv.fi>
References: <20080617172150.9ef1ea69.sfr@canb.auug.org.au> <20080617.003534.193689527.davem@davemloft.net> <Pine.LNX.4.64.0806172231100.8377@anakin>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp6.pp.htv.fi ([213.243.153.40]:47791 "EHLO smtp6.pp.htv.fi"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755792AbYFQVFM (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 17 Jun 2008 17:05:12 -0400
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0806172231100.8377@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Miller <davem@davemloft.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org

On Tue, Jun 17, 2008 at 10:32:01PM +0200, Geert Uytterhoeven wrote:
> On Tue, 17 Jun 2008, David Miller wrote:
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Tue, 17 Jun 2008 17:21:50 +1000
> > 
> > > Today's linux-next merge of the sparc tree got a trivial contextual
> > > conflict in include/asm-m68k/sbus.h between commit
> > > 69edc57f65f2d0bf63485cba4567876a1cfa3dae ("m68k/sun3/: possible
> > > cleanups") from the m68k tree and commit
> > > 878e7a6e498bec55f10a163197c41554fb078416 ("sparc: remove CONFIG_SUN4")
> > > from the sparc tree.
> > > 
> > > It was just close changes to the same file.  I fixed it up.
> 
> If you want your change to include/asm-m68k/sbus.h to go in through the
> m68k tree, please send me the patch.

Sorry for this mess, I'm in the unlucky position of having made both 
conflicting commits.  :-(

Below is the part of the commit that caused this conflict.

> Gr{oetje,eeting}s,
> 
> 						Geert

cu
Adrian


<--  snip  -->


m68k: remove stale ARCH_SUN4 #define

Signed-off-by: Adrian Bunk <bunk@kernel.org>

--- a/include/asm-m68k/sbus.h
+++ b/include/asm-m68k/sbus.h
@@ -12,8 +12,6 @@ struct sbus_dev {
 	} reg_addrs[1];
 };
 
-#define ARCH_SUN4  0
-
 /* sbus IO functions stolen from include/asm-sparc/io.h for the serial driver */
 /* No SBUS on the Sun3, kludge -- sam */
 

