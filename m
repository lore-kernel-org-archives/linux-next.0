From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Fri, 12 Sep 2008 17:10:21 +1000
Message-ID: <20080912171021.21046d9c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43212 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751752AbYILHK3 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 03:10:29 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Yinghai Lu <yhlu.kernel@gmail.com>, Johann Felix Soden <johfel@users.sourceforge.net>

Hi all,

Today's linux-next merge of the timers tree got a conflict in
drivers/pci/probe.c between commit
4ca8a7726fb0e8094fdb56f2ae2d69fcf9254eae ("PCI: Fix printk warnings in
probe.c") from the pci-current tree and commit
ca81beb4a340ee690803fcb1498f863d0e68843f ("pci: fix BAR print out") from
the timers tree.

Overlapping changes.  I fixed it up (see below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/probe.c
index 8e30dee,477fe9b..0000000
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@@ -383,9 -389,8 +389,9 @@@ void __devinit pci_read_bridge_bases(st
  			res->start = base;
  		if (!res->end)
  			res->end = limit + 0xfff;
- 		printk(KERN_INFO "PCI: bridge %s io port: [%llx, %llx]\n",
+ 		printk(KERN_DEBUG "PCI: bridge %s io port: [%llx, %llx]\n",
 -				 pci_name(dev), res->start, res->end);
 +			pci_name(dev), (unsigned long long) res->start,
 +			(unsigned long long) res->end);
  	}
  
  	res = child->resource[1];
@@@ -397,8 -402,8 +403,8 @@@
  		res->flags = (mem_base_lo & PCI_MEMORY_RANGE_TYPE_MASK) | IORESOURCE_MEM;
  		res->start = base;
  		res->end = limit + 0xfffff;
- 		printk(KERN_INFO "PCI: bridge %s 32bit mmio: [%llx, %llx]\n", pci_name(dev),
 -		printk(KERN_DEBUG "PCI: bridge %s 32bit mmio: [%llx, %llx]\n",
 -				 pci_name(dev), res->start, res->end);
++		printk(KERN_DEBUG "PCI: bridge %s 32bit mmio: [%llx, %llx]\n", pci_name(dev),
 +			(unsigned long long) res->start, (unsigned long long) res->end);
  	}
  
  	res = child->resource[2];
@@@ -434,9 -439,9 +440,9 @@@
  		res->flags = (mem_base_lo & PCI_MEMORY_RANGE_TYPE_MASK) | IORESOURCE_MEM | IORESOURCE_PREFETCH;
  		res->start = base;
  		res->end = limit + 0xfffff;
- 		printk(KERN_INFO "PCI: bridge %s %sbit mmio pref: [%llx, %llx]\n",
+ 		printk(KERN_DEBUG "PCI: bridge %s %sbit mmio pref: [%llx, %llx]\n",
 -				 pci_name(dev), (res->flags & PCI_PREF_RANGE_TYPE_64)?"64":"32",
 -				 res->start, res->end);
 +			pci_name(dev), (res->flags & PCI_PREF_RANGE_TYPE_64) ? "64" : "32",
 +			(unsigned long long) res->start, (unsigned long long) res->end);
  	}
  }
  
