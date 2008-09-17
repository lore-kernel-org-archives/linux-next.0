From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree
Date: Wed, 17 Sep 2008 15:24:02 +1000
Message-ID: <20080917152402.eedd825b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50724 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751025AbYIQFYL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 17 Sep 2008 01:24:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>
Cc: linux-next@vger.kernel.org, Suresh Siddha <suresh.b.siddha@intel.com>, Ingo Molnar <mingo@elte.hu>, "Kay, Allen M" <allen.m.kay@intel.com>

Hi Avi,

Today's linux-next merge of the kvm tree got a trivial conflict in
drivers/pci/dmar.c between commit
fe962e90cb17a8426e144dee970e77ed789d98ee ("x64, x2apic/intr-remap: Queued
invalidation infrastructure (part of VT-d)") from the x86 tree and commit
14f776b8e0aa6724069a35bf4e172d93be74ba90 ("VT-d: Changes to support KVM")
from the kvm tree.

The former just changed the context of the latter.  I fixed it up (see
below) and can carry the fix.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc drivers/pci/dmar.c
index 9527405,1df28ea..0000000
--- a/drivers/pci/dmar.c
+++ b/drivers/pci/dmar.c
@@@ -28,9 -26,8 +28,9 @@@
  
  #include <linux/pci.h>
  #include <linux/dmar.h>
 +#include <linux/timer.h>
- #include "iova.h"
- #include "intel-iommu.h"
+ #include <linux/iova.h>
+ #include <linux/intel-iommu.h>
  
  #undef PREFIX
  #define PREFIX "DMAR:"
