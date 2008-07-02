From: Lennert Buytenhek <buytenh@wantstofly.org>
Subject: Re: inux-next 0701 mv643xx_eth powerpc build failure
Date: Wed, 2 Jul 2008 10:21:18 +0200
Message-ID: <20080702082117.GA18989@xi.wantstofly.org>
References: <20080702011434.6fb403d5.sfr@canb.auug.org.au> <20080702031111.GA26752@nineveh.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1756614AbYGBIVj@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080702031111.GA26752@nineveh.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Jul 01, 2008 at 11:11:12PM -0400, Joseph Fannin wrote:

> I'm getting a build failure on 32bit powerpc in -next, but not in mainline:
> 
> drivers/net/mv643xx_eth.c: In function 'mv643xx_eth_netpoll':
> drivers/net/mv643xx_eth.c:2115: error: 'INT_CAUSE_EXT' undeclared
> (first use in this function)
> drivers/net/mv643xx_eth.c:2115: error: (Each undeclared identifier is
> reported only once
> drivers/net/mv643xx_eth.c:2115: error: for each function it appears in.)

Does this fix it for you?


Index: linux-2.6.26-rc8/drivers/net/mv643xx_eth.c
===================================================================
--- linux-2.6.26-rc8.orig/drivers/net/mv643xx_eth.c
+++ linux-2.6.26-rc8/drivers/net/mv643xx_eth.c
@@ -2184,7 +2184,7 @@ static void mv643xx_eth_netpoll(struct n
 
 	mv643xx_eth_irq(dev->irq, dev);
 
-	wrl(mp, INT_MASK(mp->port_num), INT_TX_END | INT_RX | INT_CAUSE_EXT);
+	wrl(mp, INT_MASK(mp->port_num), INT_TX_END | INT_RX | INT_EXT);
 }
 #endif
 


> I haven't investigated any further than a quick check if this hardware
> even makes sense on 32bit powerpc -- it seems it does.

It does -- it is used on ARM, PPC and MIPS.
