From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] staging: fix arlan build-braces
Date: Thu, 6 May 2010 16:43:03 -0700
Message-ID: <20100506164303.510040dd.randy.dunlap@oracle.com>
References: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:29194 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751773Ab0EFXpC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 6 May 2010 19:45:02 -0400
In-Reply-To: <20100506151502.f97afe54.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, gregkh@suse.de
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@driverdev.osuosl.org

From: Randy Dunlap <randy.dunlap@oracle.com>

The braces on the writeControlRegister() macro are not sufficient
(at least for one version of gcc):

drivers/staging/arlan/arlan-main.c:230: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:236: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:242: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:250: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:298: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:324: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:348: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:362: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:367: error: 'else' without a previous 'if'
drivers/staging/arlan/arlan-main.c:372: error: 'else' without a previous 'if'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 drivers/staging/arlan/arlan.h |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- linux-next-20100506.orig/drivers/staging/arlan/arlan.h
+++ linux-next-20100506/drivers/staging/arlan/arlan.h
@@ -461,10 +461,11 @@ struct arlan_private {
    int cr;   \
    \
    cr = readControlRegister(dev);\
-   if (cr & ARLAN_CHANNEL_ATTENTION) \
+   if (cr & ARLAN_CHANNEL_ATTENTION) { \
       writeControlRegister(dev, (cr & ~ARLAN_CHANNEL_ATTENTION));\
-   else \
+   } else { \
       writeControlRegister(dev, (cr | ARLAN_CHANNEL_ATTENTION));\
+   } \
 }
 
 #define clearChannelAttention(dev) { \
