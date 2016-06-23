From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Thu, 23 Jun 2016 11:44:29 +1000
Message-ID: <20160623114429.1815794f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43384 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751000AbcFWBoc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jun 2016 21:44:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>, Jens Axboe <axboe@fb.com>

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/nvme/host/pci.c

between commit:

  edb50a5403d2 ("NVMe: Only release requested regions")

from Linus' tree and commit:

  a1f447b35b72 ("NVMe: Use pci_(request|release)_mem_regions")

from the pci tree.

I fixed it up (I just used the pci tree version of this file) and can
carry the fix as necessary. This is now fixed as far as linux-next is
concerned, but any non trivial conflicts should be mentioned to your
upstream maintainer when your tree is submitted for merging.  You may
also want to consider cooperating with the maintainer of the conflicting
tree to minimise any particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell
