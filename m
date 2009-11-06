From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] kmemleak: fix kconfig for crc32 build error
Date: Fri, 06 Nov 2009 15:33:45 -0800
Message-ID: <4AF4B259.8030506@oracle.com>
References: <20091106181330.80bca052.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet12.oracle.com ([148.87.113.124]:65305 "EHLO
	rgminet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932704AbZKFWdN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2009 17:33:13 -0500
In-Reply-To: <20091106181330.80bca052.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>

From: Randy Dunlap <randy.dunlap@oracle.com>

kmemleak uses crc32 functions so it needs to select CRC32.
Fixes build error:

kmemleak.c:(.text+0x7ce62): undefined reference to `crc32_le'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 lib/Kconfig.debug |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20091106.orig/lib/Kconfig.debug
+++ linux-next-20091106/lib/Kconfig.debug
@@ -372,6 +372,7 @@ config DEBUG_KMEMLEAK
 	select DEBUG_FS if SYSFS
 	select STACKTRACE if STACKTRACE_SUPPORT
 	select KALLSYMS
+	select CRC32
 	help
 	  Say Y here if you want to enable the memory leak
 	  detector. The memory allocation/freeing is traced in a way
