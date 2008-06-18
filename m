From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: manual merge of sparc tree
Date: Tue, 17 Jun 2008 22:37:07 -0700 (PDT)
Message-ID: <20080617.223707.49467656.davem@davemloft.net>
References: <20080617172150.9ef1ea69.sfr@canb.auug.org.au>
	<20080617.003534.193689527.davem@davemloft.net>
	<Pine.LNX.4.64.0806172231100.8377@anakin>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:43892
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1754672AbYFRFhH (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Wed, 18 Jun 2008 01:37:07 -0400
In-Reply-To: <Pine.LNX.4.64.0806172231100.8377@anakin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: geert@linux-m68k.org
Cc: sfr@canb.auug.org.au, linux-next@vger.kernel.org, bunk@kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2008 22:32:01 +0200 (CEST)

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

It's part of a tree-wide removal of CONFIG_SUN4.  If Stephen doesn't
mind making this minor merge fixup all the time, it's probably
best to keep it in the sparc tree.

Let me know if you disagree :-)
