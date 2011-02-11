From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the edac-amd tree with the tip tree
Date: Fri, 11 Feb 2011 14:28:35 +1100
Message-ID: <20110211142835.5ef24abe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Borislav Petkov <borislav.petkov@amd.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hans Rosenfeld <hans.rosenfeld@amd.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
List-Id: linux-next.vger.kernel.org

Hi Borislav,

Today's linux-next merge of the edac-amd tree got a conflict in
include/linux/pci_ids.h between commit
41b2610c3443e6c4760e61fc10eef73f96f9f6a5 ("x86, amd: Extend AMD
northbridge caching code to support "Link Control" devices") from the tip
tree and commit 3d019f87099415f5f0a2f75b6f828db17e6e9445 ("PCI: Rename
CPU PCI id define") from the edac-amd tree.

Just context changes.  I fixed it up (see below) and can carry the fix as
necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc include/linux/pci_ids.h
index 5aaf45e,5411e7b..0000000
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@@ -517,8 -517,7 +517,8 @@@
  #define PCI_DEVICE_ID_AMD_11H_NB_DRAM	0x1302
  #define PCI_DEVICE_ID_AMD_11H_NB_MISC	0x1303
  #define PCI_DEVICE_ID_AMD_11H_NB_LINK	0x1304
- #define PCI_DEVICE_ID_AMD_15H_NB_MISC	0x1603
+ #define PCI_DEVICE_ID_AMD_15H_NB_F3	0x1603
 +#define PCI_DEVICE_ID_AMD_15H_NB_LINK	0x1604
  #define PCI_DEVICE_ID_AMD_CNB17H_F3	0x1703
  #define PCI_DEVICE_ID_AMD_LANCE		0x2000
  #define PCI_DEVICE_ID_AMD_LANCE_HOME	0x2001
