From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm-arm tree with the iommu tree
Date: Thu, 29 Jun 2017 13:30:15 +1000
Message-ID: <20170629133015.5330f0ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:59595 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751548AbdF2Da2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Jun 2017 23:30:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <marc.zyngier@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Daney <david.daney@cavium.com>, Linu Cherian <linu.cherian@cavium.com>, Will Deacon <will.deacon@arm.com>, Geetha Sowjanya <geethasowjanya.akula@cavium.com>

Hi all,

Today's linux-next merge of the kvm-arm tree got a conflict in:

  Documentation/arm64/silicon-errata.txt

between commits:

  e5b829de053d ("iommu/arm-smmu-v3: Add workaround for Cavium ThunderX2 erratum #74")
  f935448acf46 ("iommu/arm-smmu-v3: Add workaround for Cavium ThunderX2 erratum #126")

from the iommu tree and commit:

  690a341577f9 ("arm64: Add workaround for Cavium Thunder erratum 30115")

from the kvm-arm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc Documentation/arm64/silicon-errata.txt
index 856479525776,f5f93dca54b7..000000000000
--- a/Documentation/arm64/silicon-errata.txt
+++ b/Documentation/arm64/silicon-errata.txt
@@@ -62,8 -62,7 +62,9 @@@ stable kernels
  | Cavium         | ThunderX GICv3  | #23154          | CAVIUM_ERRATUM_23154        |
  | Cavium         | ThunderX Core   | #27456          | CAVIUM_ERRATUM_27456        |
  | Cavium         | ThunderX SMMUv2 | #27704          | N/A                         |
+ | Cavium         | ThunderX Core   | #30115          | CAVIUM_ERRATUM_30115        |
 +| Cavium         | ThunderX2 SMMUv3| #74             | N/A                         |
 +| Cavium         | ThunderX2 SMMUv3| #126            | N/A                         |
  |                |                 |                 |                             |
  | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
  |                |                 |                 |                             |
