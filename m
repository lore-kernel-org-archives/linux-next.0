From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree with the net-current tree
Date: Mon, 23 Nov 2009 12:00:43 +1100
Message-ID: <20091123120043.24cf5c12.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:60255 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753460AbZKWBAk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 22 Nov 2009 20:00:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Amit Kumar Salecha <amit@netxen.com>

Hi all,

Today's linux-next merge of the net tree got a conflict in
drivers/net/netxen/netxen_nic_init.c between commit
5d521fd36de4e61ab16a358df54c5babe153396c ("netxen: fix memory
initialization") from the net-current tree and commit
0be367bd5d10634c0836f57a684432fee935d929 ("netxen: reset sequence
changes") from the net tree.

Just context changes. I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/net/netxen/netxen_nic_init.c
index 8a09043,6ee27a6..0000000
--- a/drivers/net/netxen/netxen_nic_init.c
+++ b/drivers/net/netxen/netxen_nic_init.c
@@@ -544,9 -528,8 +528,10 @@@ int netxen_pinit_from_rom(struct netxen
  				continue;
  			if (off == (ROMUSB_GLB + 0x1c)) /* MS clock */
  				continue;
 +			if ((off & 0x0ff00000) == NETXEN_CRB_DDR_NET)
 +				continue;
- 			if (off == (NETXEN_CRB_PEG_NET_1 + 0x18))
+ 			if (off == (NETXEN_CRB_PEG_NET_1 + 0x18) &&
+ 				!NX_IS_REVISION_P3P(adapter->ahw.revision_id))
  				buf[i].data = 0x1020;
  			/* skip the function enable register */
  			if (off == NETXEN_PCIE_REG(PCIE_SETUP_FUNCTION))
