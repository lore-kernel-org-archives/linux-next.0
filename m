From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Wed, 15 Nov 2017 16:01:30 +1100
Message-ID: <20171115160130.032695df@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35473 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750788AbdKOFBc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 15 Nov 2017 00:01:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Desnes Augusto Nunes do Rosario <desnesn@linux.vnet.ibm.com>, Thomas Falcon <tlfalcon@linux.vnet.ibm.com>

Hi all,

After merging the net-next tree, today's linux-next build (powerpc
allyesconfig) produced this warning:

In file included from drivers/net/ethernet/ibm/ibmvnic.c:52:0:
drivers/net/ethernet/ibm/ibmvnic.c: In function 'ibmvnic_open':
include/linux/dma-mapping.h:571:2: warning: 'dma_addr' may be used uninitialized in this function [-Wmaybe-uninitialized]
  debug_dma_mapping_error(dev, dma_addr);
  ^
drivers/net/ethernet/ibm/ibmvnic.c:852:13: note: 'dma_addr' was declared here
  dma_addr_t dma_addr;
             ^

Introduced by commit

  4e6759be28e4 ("ibmvnic: Feature implementation of Vital Product Data (VPD) for the ibmvnic driver")

-- 
Cheers,
Stephen Rothwell
