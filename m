From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the slave-dma tree
Date: Thu, 6 Aug 2015 12:22:03 +1000
Message-ID: <20150806122203.64e25587@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36742 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751867AbbHFCWG convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 5 Aug 2015 22:22:06 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Vinod Koul <vinod.koul@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maxime Ripard <maxime.ripard@free-electrons.com>, Cyrille Pitchen <cyrille.pitchen@atmel.com>

Hi Vinod,

After merging the slave-dma tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

drivers/dma/at_hdmac.c: In function 'atc_prep_dma_memset':
drivers/dma/at_hdmac.c:960:6: error: 'struct at_desc' has no member named 'tx_width'
  desc->tx_width = 2;
      ^

Caused by commit

  25fed8c2fff1 ("dmaengine: hdmac: Add memset capabilities")

interacting with commit

  93dce3a6434f ("dmaengine: at_hdmac: fix residue computation")

>From Linus' tree (v4.2-rc5).  This should have been fixed up in commit

  fa362949e874 ("Merge branch 'for-linus' into next")

I have used the slave-dma tree from next-20150805 for today.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
