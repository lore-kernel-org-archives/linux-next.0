From: Stanislaw Gruszka <sgruszka@redhat.com>
Subject: [PATCH linux-next] iwlegacy: debug.c needs export.h
Date: Tue, 22 Nov 2011 08:59:34 +0100
Message-ID: <20111122075933.GC2199@redhat.com>
References: <20111122142502.ca68d0a1640b2a8480d51ad2@canb.auug.org.au>
 <20111122075640.GB2199@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:12882 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754117Ab1KVH5a (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 22 Nov 2011 02:57:30 -0500
Content-Disposition: inline
In-Reply-To: <20111122075640.GB2199@redhat.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: "John W. Linville" <linville@tuxdriver.com>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

Fix:

drivers/net/wireless/iwlegacy/debug.c:1395:1: warning: data definition has no type or storage class [enabled by default]
drivers/net/wireless/iwlegacy/debug.c:1395:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
drivers/net/wireless/iwlegacy/debug.c:1395:1: warning: parameter names (without types) in function declaration [enabled by default]
drivers/net/wireless/iwlegacy/debug.c:1410:1: warning: data definition has no type or storage class [enabled by default]
drivers/net/wireless/iwlegacy/debug.c:1410:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL' [-Wimplicit-int]
drivers/net/wireless/iwlegacy/debug.c:1410:1: warning: parameter names (without types) in function declaration [enabled by default]

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
---
This is linux-next patch only, in wireless-next we do not have
include/linux/export.h file.

 drivers/net/wireless/iwlegacy/debug.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/wireless/iwlegacy/debug.c b/drivers/net/wireless/iwlegacy/debug.c
index 928bdbb..b1b8926 100644
--- a/drivers/net/wireless/iwlegacy/debug.c
+++ b/drivers/net/wireless/iwlegacy/debug.c
@@ -26,6 +26,7 @@
  * Intel Corporation, 5200 N.E. Elam Young Parkway, Hillsboro, OR 97124-6497
  *****************************************************************************/
 #include <linux/ieee80211.h>
+#include <linux/export.h>
 #include <net/mac80211.h>
 
 #include "common.h"
-- 
1.7.1
