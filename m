From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the net tree
Date: Fri, 21 Nov 2008 13:29:41 +1100
Message-ID: <20081121132941.87c9eacc.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58416 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752132AbYKUC3w (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 20 Nov 2008 21:29:52 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Jesse Brandeburg <jesse.brandeburg@intel.com>, Jeff Garzik <jgarzik@redhat.com>, Jeff Kirsher <jeffrey.t.kirsher@intel.com>, Alexey Dobriyan <adobriyan@gmail.com>

Hi Dave,

Today's linux-next merge of the net tree got a conflict in
drivers/net/ixgbe/ixgbe_main.c between commit
79aefa45b20940cbb9104464548ff74f80f2395e ("ixgbe: fix compilation with
gcc-3.4") from the net-current tree and commit
0befdb3e0a26a8949063915274e1bec8873c526b ("ixgbe: add device support for
82598AT (copper 10GbE) adapters") from the net tree.

I fixed it up (see below) and assume you will do something similar.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/net/ixgbe/ixgbe_main.c
index 36f2bb6,6fb8738..0000000
--- a/drivers/net/ixgbe/ixgbe_main.c
+++ b/drivers/net/ixgbe/ixgbe_main.c
@@@ -1287,34 -1301,7 +1301,36 @@@ static void ixgbe_set_itr(struct ixgbe_
  	return;
  }
  
 -static inline void ixgbe_irq_enable(struct ixgbe_adapter *adapter);
 +/**
 + * ixgbe_irq_disable - Mask off interrupt generation on the NIC
 + * @adapter: board private structure
 + **/
 +static inline void ixgbe_irq_disable(struct ixgbe_adapter *adapter)
 +{
 +	IXGBE_WRITE_REG(&adapter->hw, IXGBE_EIMC, ~0);
 +	IXGBE_WRITE_FLUSH(&adapter->hw);
 +	if (adapter->flags & IXGBE_FLAG_MSIX_ENABLED) {
 +		int i;
 +		for (i = 0; i < adapter->num_msix_vectors; i++)
 +			synchronize_irq(adapter->msix_entries[i].vector);
 +	} else {
 +		synchronize_irq(adapter->pdev->irq);
 +	}
 +}
 +
 +/**
 + * ixgbe_irq_enable - Enable default interrupt generation settings
 + * @adapter: board private structure
 + **/
 +static inline void ixgbe_irq_enable(struct ixgbe_adapter *adapter)
 +{
 +	u32 mask;
 +	mask = IXGBE_EIMS_ENABLE_MASK;
++	if (adapter->flags & IXGBE_FLAG_FAN_FAIL_CAPABLE)
++		mask |= IXGBE_EIMS_GPI_SDP1;
 +	IXGBE_WRITE_REG(&adapter->hw, IXGBE_EIMS, mask);
 +	IXGBE_WRITE_FLUSH(&adapter->hw);
 +}
  
  /**
   * ixgbe_intr - legacy mode Interrupt Handler
