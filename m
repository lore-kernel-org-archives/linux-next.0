From: Jeremy Kerr <jk@ozlabs.org>
Subject: [PATCH v2] powerpc: pseries/dtl.c should include asm/firmware.h
Date: Wed, 15 Apr 2009 10:35:55 +1000
Message-ID: <1239755755.553226.808801509343.1.gpush@pingu>
References: <<49D3419E.7000005@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bilbo.ozlabs.org ([203.10.76.25]:54140 "EHLO bilbo.ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751823AbZDOAgT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2009 20:36:19 -0400
In-Reply-To: <<49D3419E.7000005@in.ibm.com>>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linuxppc-dev@ozlabs.org, linux-next@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Cc: Michael Neuling <mikey@neuling.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin Sant <sachinp@in.ibm.com>, Subrata Modak <subrata@linux.vnet.ibm.com>

From: Sachin Sant <sachinp@in.ibm.com>

A randconfig build on powerpc failed with:

dtl.c: In function 'dtl_init':
dtl.c:238: error: implicit declaration of function 'firmware_has_feature'
dtl.c:238: error: 'FW_FEATURE_SPLPAR' undeclared (first use in this function)

- We need firmware.h for these definitions.

Signed-off-by: Sachin Sant <sachinp@in.ibm.com>
Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
v2: This time without the non-ascii quotes

---
 arch/powerpc/platforms/pseries/dtl.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/dtl.c b/arch/powerpc/platforms/pseries/dtl.c
index fafcaa0..ab69925 100644
--- a/arch/powerpc/platforms/pseries/dtl.c
+++ b/arch/powerpc/platforms/pseries/dtl.c
@@ -25,6 +25,7 @@
 #include <asm/smp.h>
 #include <asm/system.h>
 #include <asm/uaccess.h>
+#include <asm/firmware.h>
 
 #include "plpar_wrappers.h"
 
