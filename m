From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Wed, 27 Jul 2016 16:15:33 +1000
Message-ID: <20160727161533.5c5d1702@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34422 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750868AbcG0GPg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 27 Jul 2016 02:15:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, netdev@vger.kernel.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Iyappan Subramanian <isubramanian@apm.com>

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

drivers/net/ethernet/apm/xgene/xgene_enet_hw.c: In function 'xgene_enet_phy_connect':
drivers/net/ethernet/apm/xgene/xgene_enet_hw.c:759:22: warning: unused variable 'adev' [-Wunused-variable]
  struct acpi_device *adev;
                      ^

Introduced by commit

  8089a96f601b ("drivers: net: xgene: Add backward compatibility")
(CONFIG_ACPI si not set for tis build)

-- 
Cheers,
Stephen Rothwell
