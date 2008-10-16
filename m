From: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Subject: [PATCH] linux-next: Tree for October 16 - build failure at MAL
	support on powerpc
Date: Fri, 17 Oct 2008 00:53:20 +0530
Message-ID: <20081016192320.GA7534@linux.vnet.ibm.com>
References: <20081016211811.a523c8f2.sfr@canb.auug.org.au>
Reply-To: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Return-path: <linux-next-owner@vger.kernel.org>
Received: from E23SMTP04.au.ibm.com ([202.81.18.173]:50791 "EHLO
	e23smtp04.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753042AbYJPTXc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 16 Oct 2008 15:23:32 -0400
Content-Disposition: inline
In-Reply-To: <20081016211811.a523c8f2.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, benh@kernel.crashing.org, jwboyer@linux.vnet.ibm.com, apw@shadowen.org

Hi Stephen,

        next-20081016 kernel build fails on powerpc, with build error

drivers/net/ibm_newemac/mal.c: In function 'mal_txeob':
drivers/net/ibm_newemac/mal.c:284: error: implicit declaration of function 'mtdcri'
drivers/net/ibm_newemac/mal.c:284: error: 'SDR0' undeclared (first use in this function)
drivers/net/ibm_newemac/mal.c:284: error: (Each undeclared identifier is reported only once
drivers/net/ibm_newemac/mal.c:284: error: for each function it appears in.)
drivers/net/ibm_newemac/mal.c:285: error: implicit declaration of function 'mfdcri'
drivers/net/ibm_newemac/mal.c: In function 'mal_rxeob':
drivers/net/ibm_newemac/mal.c:302: error: 'SDR0' undeclared (first use in this function)
make[3]: *** [drivers/net/ibm_newemac/mal.o] Error 1

Signed-off-by: Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>
---
 drivers/net/ibm_newemac/mal.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/net/ibm_newemac/mal.c b/drivers/net/ibm_newemac/mal.c
index 1839d3f..c5f91a6 100644
--- a/drivers/net/ibm_newemac/mal.c
+++ b/drivers/net/ibm_newemac/mal.c
@@ -29,6 +29,7 @@
 
 #include "core.h"
 #include <asm/dcr-regs.h>
+#include <asm/dcr-native.h>
 
 static int mal_count;
 
-- 
Thanks & Regards,
Kamalesh Babulal,
Linux Technology Center,
IBM, ISTL.
