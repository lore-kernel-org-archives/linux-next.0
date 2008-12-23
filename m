From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Wed, 24 Dec 2008 10:19:34 +1100
Message-ID: <20081224101934.0da26dab.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37028 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752008AbYLWXTl (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 23 Dec 2008 18:19:41 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, James Chapman <jchapman@katalix.com>, Cyrill Gorcunov <gorcunov@openvz.org>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/ppp_generic.c between commit
739840d529eb7505d3cbfe9d468bf1440c9a8e27 ("ppp: fix segfaults introduced
by netdev_priv changes") from the net-current tree and commit
7a95d267fb62cd6b80ef73be0592bbbe1dbd5df7 ("net: ppp_generic - use idr
technique instead of cardmaps") from the net tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/ppp_generic.c
index 714a230,c832d60..0000000
--- a/drivers/net/ppp_generic.c
+++ b/drivers/net/ppp_generic.c
@@@ -2498,17 -2484,19 +2484,17 @@@ init_ppp_file(struct ppp_file *pf, int 
   */
  static void ppp_shutdown_interface(struct ppp *ppp)
  {
 -	struct net_device *dev;
 -
  	mutex_lock(&all_ppp_mutex);
 -	ppp_lock(ppp);
 -	dev = ppp->dev;
 -	ppp->dev = NULL;
 -	ppp_unlock(ppp);
  	/* This will call dev_close() for us. */
 -	if (dev) {
 -		unregister_netdev(dev);
 -		free_netdev(dev);
 -	}
 +	ppp_lock(ppp);
 +	if (!ppp->closing) {
 +		ppp->closing = 1;
 +		ppp_unlock(ppp);
 +		unregister_netdev(ppp->dev);
 +	} else
 +		ppp_unlock(ppp);
 +
- 	cardmap_set(&all_ppp_units, ppp->file.index, NULL);
+ 	unit_put(&ppp_units_idr, ppp->file.index);
  	ppp->file.dead = 1;
  	ppp->owner = NULL;
  	wake_up_interruptible(&ppp->file.rwait);
