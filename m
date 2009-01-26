From: David Miller <davem@davemloft.net>
Subject: Re: linux-next: net tree build failure
Date: Sun, 25 Jan 2009 21:17:55 -0800 (PST)
Message-ID: <20090125.211755.242252297.davem@davemloft.net>
References: <20090126135307.e4630fc7.sfr@canb.auug.org.au>
	<20090125.204623.137022547.davem@davemloft.net>
	<20090126161523.3be36393.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 74-93-104-97-Washington.hfc.comcastbusiness.net ([74.93.104.97]:52133
	"EHLO sunset.davemloft.net" rhost-flags-OK-FAIL-OK-OK)
	by vger.kernel.org with ESMTP id S1750728AbZAZFRw (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Mon, 26 Jan 2009 00:17:52 -0500
In-Reply-To: <20090126161523.3be36393.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sfr@canb.auug.org.au
Cc: linux-next@vger.kernel.org, shemminger@linux-foundation.org

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 26 Jan 2009 16:15:23 +1100

> On Sun, 25 Jan 2009 20:46:23 -0800 (PST) David Miller <davem@davemloft.net> wrote:
> >
> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > Date: Mon, 26 Jan 2009 13:53:07 +1100
> > 
> > > Today's linux-next build (x86_64 allmodconfig) failed like this:
> > > 
> > > ERROR: "com20020_netdev_ops" [drivers/net/arcnet/com20020-pci.ko] undefined!
> > > 
> > > We are not winning with this one :-(
> > 
> > I don't understand this.  If I mark it extern, as I did, it
> > should only be defined in one object file.
> 
> It needs an EXPORT_SYMBOL() where it is defined (in com20020.c).

Ahh, I see.  Can you possibly give this a try before I
push it out?

com0020: Add missing symbol export for com20020_netdev_ops.

Thanks to Stephen Rothwell.

Signed-off-by: David S. Miller <davem@davemloft.net>
---
 drivers/net/arcnet/com20020.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/arcnet/com20020.c b/drivers/net/arcnet/com20020.c
index bbe8f2c..651275a 100644
--- a/drivers/net/arcnet/com20020.c
+++ b/drivers/net/arcnet/com20020.c
@@ -348,6 +348,7 @@ static void com20020_set_mc_list(struct net_device *dev)
     defined(CONFIG_ARCNET_COM20020_CS_MODULE)
 EXPORT_SYMBOL(com20020_check);
 EXPORT_SYMBOL(com20020_found);
+EXPORT_SYMBOL(com20020_netdev_ops);
 #endif
 
 MODULE_LICENSE("GPL");
-- 
1.6.1.15.g159c88
