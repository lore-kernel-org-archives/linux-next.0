From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree
Date: Thu, 4 Dec 2008 10:44:18 +1100
Message-ID: <20081204104418.97f848b4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:34033 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754570AbYLCXo0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Dec 2008 18:44:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>, Kumar Gala <galak@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@ozlabs.org

Hi Greg,

Today's linux-next merge of the driver-core tree got a conflict in
arch/powerpc/platforms/85xx/mpc85xx_mds.c between commit
24a99596f7465274a8e65ddd29a7d9028969b9f9 ("powerpc/85xx: Fix compile
warnings in mpc85xx_mds.c") from the galak tree and commit
f58f23751464d095f9942304bc5f6072b79a2cc3 ("powerpc: struct device -
replace bus_id with dev_name(), dev_set_name()") from the driver-core
tree.

I fixed it up (see below) and can carry the fix as necessary.

Paul, maybe you should apply the patch from the driver-core tree as it
was cc'd to you and all its prerequisites are upstream.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/powerpc/platforms/85xx/mpc85xx_mds.c
index b915bf5,80c55a5..0000000
--- a/arch/powerpc/platforms/85xx/mpc85xx_mds.c
+++ b/arch/powerpc/platforms/85xx/mpc85xx_mds.c
@@@ -241,15 -241,13 +241,15 @@@ static int __init board_fixups(void
  		mdio = of_find_compatible_node(NULL, NULL, compstrs[i]);
  
  		of_address_to_resource(mdio, 0, &res);
- 		snprintf(phy_id, BUS_ID_SIZE, "%llx:%02x",
 -		snprintf(phy_id, sizeof(phy_id), "%x:%02x", res.start, 1);
++		snprintf(phy_id, sizeof(phy_id), "%llx:%02x",
 +			(unsigned long long)res.start, 1);
  
  		phy_register_fixup_for_id(phy_id, mpc8568_fixup_125_clock);
  		phy_register_fixup_for_id(phy_id, mpc8568_mds_phy_fixups);
  
  		/* Register a workaround for errata */
- 		snprintf(phy_id, BUS_ID_SIZE, "%llx:%02x",
 -		snprintf(phy_id, sizeof(phy_id), "%x:%02x", res.start, 7);
++		snprintf(phy_id, sizeof(phy_id), "%llx:%02x",
 +			(unsigned long long)res.start, 7);
  		phy_register_fixup_for_id(phy_id, mpc8568_mds_phy_fixups);
  
  		of_node_put(mdio);
