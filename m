From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with Linus' tree
Date: Thu, 21 Jan 2016 10:33:40 +1100
Message-ID: <20160121103340.26eaed5b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48704 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756294AbcATXdm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 20 Jan 2016 18:33:42 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jakub Kicinski <jakub.kicinski@netronome.com>, "David S. Miller" <davem@davemloft.net>, "Jason S. McMullan" <jason.mcmullan@netronome.com>

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  include/linux/pci_ids.h

between commit:

  2d1e0254ef83 ("pci_ids: add Netronome Systems vendor")

from Linus' tree and commit:

  a755e169031d ("PCI: Add Netronome vendor and device IDs")

from the pci tree.

I fixed it up (the latter is just a superset of the former) and can
carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
