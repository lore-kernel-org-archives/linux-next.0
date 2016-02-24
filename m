From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the pci tree with the pci-current tree
Date: Wed, 24 Feb 2016 11:02:09 +1100
Message-ID: <20160224110209.424b22bd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jake Oshins <jakeo@microsoft.com>
List-Id: linux-next.vger.kernel.org

Hi Bjorn,

Today's linux-next merge of the pci tree got a conflict in:

  drivers/pci/probe.c

between commit:

  788858ebc49a ("PCI: Look up IRQ domain by fwnode_handle")

from the pci-current tree and commit:

  5bd28338d681 ("PCI: Remove includes of empty asm-generic/pci-bridge.h")

from the pci tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell

diff --cc drivers/pci/probe.c
index 1e34d211389a,5eb378fbe849..000000000000
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@@ -15,8 -15,6 +15,7 @@@
  #include <linux/pci-aspm.h>
  #include <linux/aer.h>
  #include <linux/acpi.h>
 +#include <linux/irqdomain.h>
- #include <asm-generic/pci-bridge.h>
  #include "pci.h"
  
  #define CARDBUS_LATENCY_TIMER	176	/* secondary latency timer */
