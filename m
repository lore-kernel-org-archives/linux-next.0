From: Dean Nelson <dcn@sgi.com>
Subject: [PATCH] add reverse dependency of CONFIG_SGI_XP upon CONFIG_SGI_GRU
Date: Fri, 1 Aug 2008 09:55:26 -0500
Message-ID: <20080801145526.GA29354@sgi.com>
References: <20080731175854.09ea35c8.sfr@canb.auug.org.au> <20080731223758.b5985dd7.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from relay1.sgi.com ([192.48.171.29]:51889 "EHLO relay.sgi.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750984AbYHAOz2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 1 Aug 2008 10:55:28 -0400
Content-Disposition: inline
In-Reply-To: <20080731223758.b5985dd7.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Jack Steiner <steiner@sgi.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Add a reverse dependency of CONFIG_SGI_XP upon CONFIG_SGI_GRU to Kconfig.

Signed-off-by: Dean Nelson <dcn@sgi.com>

---

 drivers/misc/Kconfig |    1 +
 1 file changed, 1 insertion(+)

Index: linux/drivers/misc/Kconfig
===================================================================
--- linux.orig/drivers/misc/Kconfig	2008-07-31 12:34:08.000000000 -0500
+++ linux/drivers/misc/Kconfig	2008-08-01 09:16:53.000000000 -0500
@@ -429,6 +429,7 @@ config SGI_XP
 	depends on IA64_GENERIC || IA64_SGI_SN2 || IA64_SGI_UV || (X86_64 && SMP)
 	select IA64_UNCACHED_ALLOCATOR if IA64_GENERIC || IA64_SGI_SN2
 	select GENERIC_ALLOCATOR if IA64_GENERIC || IA64_SGI_SN2
+	select SGI_GRU if IA64_GENERIC || IA64_SGI_UV || (X86_64 && SMP)
 	---help---
 	  An SGI machine can be divided into multiple Single System
 	  Images which act independently of each other and have
