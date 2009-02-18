From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH v2] module: fix build for CONFIG_SYSFS=n
Date: Wed, 18 Feb 2009 10:35:20 -0800
Message-ID: <499C54E8.7060004@oracle.com>
References: <20090218191640.0b023029.sfr@canb.auug.org.au> <499C4D35.9000104@oracle.com> <20090218180932.GC19995@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:27398 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756606AbZBRSex (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 18 Feb 2009 13:34:53 -0500
In-Reply-To: <20090218180932.GC19995@elte.hu>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Rusty Russell <rusty@rustcorp.com.au>

> Is destroy_params() dependent on SYSFS? If yes then it would be 

Yes.

> far cleaner if there was a NOP destroy_params() inline for the 
> !SYSFS case.




From: Randy Dunlap <randy.dunlap@oracle.com>

Fix this build error when CONFIG_SYSFS=n:

kernel/built-in.o: In function `free_module':
module.c:(.text+0x4f8a2): undefined reference to `destroy_params'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Rusty Russell <rusty@rustcorp.com.au>
---
 kernel/params.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- linux-next-20090218.orig/kernel/params.c
+++ linux-next-20090218/kernel/params.c
@@ -761,6 +761,12 @@ static int __init param_sysfs_init(void)
 }
 subsys_initcall(param_sysfs_init);
 
+#else	/* !CONFIG_SYSFS */
+
+inline void destroy_params(const struct kernel_param *params, unsigned num)
+{
+}
+
 #endif /* CONFIG_SYSFS */
 
 EXPORT_SYMBOL(param_set_byte);
