From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Subject: [net 1/6] i40e: Fix missing uapi/linux/dcbnl.h include in i40e_fcoe.c
Date: Tue, 12 Aug 2014 01:38:22 -0700
Message-ID: <1407832707-26034-2-git-send-email-jeffrey.t.kirsher@intel.com>
References: <1407832707-26034-1-git-send-email-jeffrey.t.kirsher@intel.com>
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1407832707-26034-1-git-send-email-jeffrey.t.kirsher@intel.com>
Sender: netdev-owner@vger.kernel.org
To: davem@davemloft.net
Cc: Lucas Tanure <tanure@linux.com>, netdev@vger.kernel.org, nhorman@redhat.com, sassmann@redhat.com, rdunlap@infradead.org, sfr@canb.auug.org.au, linux-next@vger.kernel.org, Jeff Kirsher <jeffrey.t.kirsher@intel.com>
List-Id: linux-next.vger.kernel.org

From: Lucas Tanure <tanure@linux.com>

Fix missing include in Intel i40e driver. Without this include linux next
tree won't compile.

Signed-off-by: Lucas Tanure <tanure@linux.com>
Tested-by:  Jim Young <jamesx.m.young@intel.com>
Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
---
 drivers/net/ethernet/intel/i40e/i40e_fcoe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/intel/i40e/i40e_fcoe.c b/drivers/net/ethernet/intel/i40e/i40e_fcoe.c
index 6938fc1..5d01db1 100644
--- a/drivers/net/ethernet/intel/i40e/i40e_fcoe.c
+++ b/drivers/net/ethernet/intel/i40e/i40e_fcoe.c
@@ -33,6 +33,7 @@
 #include <scsi/fc/fc_fcoe.h>
 #include <scsi/libfc.h>
 #include <scsi/libfcoe.h>
+#include <uapi/linux/dcbnl.h>
 
 #include "i40e.h"
 #include "i40e_fcoe.h"
-- 
1.9.3
