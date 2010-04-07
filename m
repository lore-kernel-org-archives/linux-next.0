From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with Linus' tree
Date: Wed, 7 Apr 2010 12:58:36 +1000
Message-ID: <20100407125836.3c7f1095.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:52313 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751212Ab0DGC6i (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 6 Apr 2010 22:58:38 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amerigo Wang <amwang@redhat.com>, Jiri Pirko <jpirko@redhat.com>

Hi all,

Today's linux-next merge of the net tree got a conflict in
drivers/net/bonding/bond_main.c between commit
9e2e61fbf8ad016d24e4af0afff13505f3dd2a2a ("bonding: fix potential
deadlock in bond_uninit()") from Linus' tree and commit
22bedad3ce112d5ca1eaf043d4990fa2ed698c87 ("net: convert multicast list to
list_head") from the net tree.

Just context changes.  If fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/bonding/bond_main.c
index 0075514,22682f1..0000000
--- a/drivers/net/bonding/bond_main.c
+++ b/drivers/net/bonding/bond_main.c
@@@ -4550,9 -4476,10 +4508,7 @@@ static void bond_uninit(struct net_devi
  
  	bond_remove_proc_entry(bond);
  
- 	netif_addr_lock_bh(bond_dev);
- 	bond_mc_list_destroy(bond);
- 	netif_addr_unlock_bh(bond_dev);
 -	if (bond->wq)
 -		destroy_workqueue(bond->wq);
 -
+ 	__hw_addr_flush(&bond->mc_list);
  }
  
  /*------------------------- Module initialization ---------------------------*/
