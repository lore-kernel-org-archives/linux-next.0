From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the timers tree
Date: Fri, 12 Sep 2008 16:57:34 +1000
Message-ID: <20080912165734.a8f8e64f.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:51583 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752013AbYILG5m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 12 Sep 2008 02:57:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, Robert Richter <robert.richter@amd.com>, Olaf Dabrunz <od@suse.de>

Hi all,

Today's linux-next merge of the timers tree got a conflict in
include/linux/pci_ids.h between commit
ca1af29a733629b9158a4a32a927d16ff9009a95 ("x86, pci: add northbridge pci
ids for fam 0x11 processors") from the x86 tree and commit
021f8b75e78f9da67421a2c2e320e8934a90914a ("x86: add PCI IDs for AMD
Barcelona PCI devices") from the timers tree.

Just overlapping additions.  I fixed it up (see below) and can carry the
fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/pci_ids.h
index 58bb4bc,f719d91..0000000
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@@ -497,11 -497,11 +497,16 @@@
  #define PCI_DEVICE_ID_AMD_K8_NB_ADDRMAP	0x1101
  #define PCI_DEVICE_ID_AMD_K8_NB_MEMCTL	0x1102
  #define PCI_DEVICE_ID_AMD_K8_NB_MISC	0x1103
+ #define PCI_DEVICE_ID_AMD_10H_NB_HT	0x1200
+ #define PCI_DEVICE_ID_AMD_10H_NB_MAP	0x1201
+ #define PCI_DEVICE_ID_AMD_10H_NB_DRAM	0x1202
+ #define PCI_DEVICE_ID_AMD_10H_NB_MISC	0x1203
+ #define PCI_DEVICE_ID_AMD_10H_NB_LINK	0x1204
 +#define PCI_DEVICE_ID_AMD_11H_NB_HT	0x1300
 +#define PCI_DEVICE_ID_AMD_11H_NB_MAP	0x1301
 +#define PCI_DEVICE_ID_AMD_11H_NB_DRAM	0x1302
 +#define PCI_DEVICE_ID_AMD_11H_NB_MISC	0x1303
 +#define PCI_DEVICE_ID_AMD_11H_NB_LINK	0x1304
  #define PCI_DEVICE_ID_AMD_LANCE		0x2000
  #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
  #define PCI_DEVICE_ID_AMD_SCSI		0x2020
