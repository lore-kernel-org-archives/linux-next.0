From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warnings after merge of the pci tree
Date: Mon, 20 Jun 2016 11:52:13 +1000
Message-ID: <20160620115213.07231836@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39879 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751357AbcFTBwe (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Jun 2016 21:52:34 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Bjorn,

After merging the pci tree, today's linux-next build (arm
multi_v7_defconfig) produced these warnings:

drivers/pci/host/pci-host-common.c: In function 'gen_pci_init':
drivers/pci/host/pci-host-common.c:88:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
   return err;
          ^
drivers/pci/host/pci-host-common.c:93:10: warning: return makes pointer from integer without a cast [-Wint-conversion]
   return PTR_ERR(cfg);
          ^
drivers/pci/host/pci-host-common.c:108:9: warning: return makes pointer from integer without a cast [-Wint-conversion]
  return err;
         ^

Introduced by commit

  3f8dcfc3fbba ("PCI: generic: Free resource list close to where it's allocated")

-- 
Cheers,
Stephen Rothwell
