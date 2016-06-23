From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the pci tree
Date: Thu, 23 Jun 2016 11:51:54 +1000
Message-ID: <20160623115154.62730f7f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46761 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751832AbcFWBv4 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 22 Jun 2016 21:51:56 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

Hi Bjorn,

After merging the pci tree, today's linux-next build (x86_64 allmodconfig)
produced this warning:

drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_remove':
drivers/misc/genwqe/card_base.c:1155:6: warning: unused variable 'bars' [-Wunused-variable]
  int bars;
      ^
drivers/misc/genwqe/card_base.c: In function 'genwqe_pci_setup':
drivers/misc/genwqe/card_base.c:1143:2: warning: 'bars' may be used uninitialized in this function [-Wmaybe-uninitialized]
  pci_release_selected_regions(pci_dev, bars);
  ^

Introduced by commit

  370b01694826 ("GenWQE: Use pci_(request|release)_mem_regions")

-- 
Cheers,
Stephen Rothwell
