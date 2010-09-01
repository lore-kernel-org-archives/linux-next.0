From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH next&mainline] oprofile: fix build when CONFIG_PM is
 disabled
Date: Wed, 1 Sep 2010 09:41:32 -0700
Message-ID: <20100901094132.e734ad94.randy.dunlap@oracle.com>
References: <20100901133614.2580f238.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet10.oracle.com ([148.87.113.121]:40764 "EHLO
	rcsinet10.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753273Ab0IAQn2 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 1 Sep 2010 12:43:28 -0400
In-Reply-To: <20100901133614.2580f238.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Robert Richter <robert.richter@amd.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>

From: Randy Dunlap <randy.dunlap@oracle.com>

Using do/while for a function-returning-a-value does not
make gcc happy, so change it to a static inline function.
(happens when CONFIG_PM is not enabled)

arch/x86/oprofile/nmi_int.c:784: error: expected expression before 'do'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 arch/x86/oprofile/nmi_int.c |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

--- linux-next-20100901.orig/arch/x86/oprofile/nmi_int.c
+++ linux-next-20100901/arch/x86/oprofile/nmi_int.c
@@ -585,7 +585,10 @@ static void exit_sysfs(void)
 }
 
 #else
-#define init_sysfs() do { } while (0)
+static inline int init_sysfs(void)
+{
+	return 0;
+}
 #define exit_sysfs() do { } while (0)
 #endif /* CONFIG_PM */
 
