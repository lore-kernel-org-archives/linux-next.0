From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree.
Date: Mon, 20 Feb 2017 09:40:56 +1100
Message-ID: <20170220094056.449c28c4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33459 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751382AbdBSWlc (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 19 Feb 2017 17:41:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Bjorn,

Today's linux-next merge of the pci tree got conflicts in:

  drivers/pci/dwc/pcie-designware-host.c

I have no idea why? I see this file has been split out from another that
was itself moved from another directory, but that all happened in the
pci tree.

I fixed it up (I just used the pci tree version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

OK, I checked again ... it may be conflicting with commit

  a782b5f986c3 ("PCI: designware: Check for iATU unroll only on platforms that use ATU")

from Linus' tree (merged into v4.10-rc5), so my resolution above may be
incorrect.
-- 
Cheers,
Stephen Rothwell
