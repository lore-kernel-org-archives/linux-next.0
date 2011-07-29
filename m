From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86: files need export.h
Date: Fri, 29 Jul 2011 12:07:34 -0700
Message-ID: <20110729120734.cec5168f.rdunlap@xenotime.net>
References: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:45153 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752253Ab1G2THj (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 29 Jul 2011 15:07:39 -0400
In-Reply-To: <20110729173827.716f57ff6e00095a3efc6449@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, x86@kernel.org
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix multiple build errors due to missing export.h header file.

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/kernel/e820.c    |    1 +
 arch/x86/kernel/pci-dma.c |    1 +
 arch/x86/kernel/rtc.c     |    1 +
 3 files changed, 3 insertions(+)

--- linux-next-20110729.orig/arch/x86/kernel/e820.c
+++ linux-next-20110729/arch/x86/kernel/e820.c
@@ -16,6 +16,7 @@
 #include <linux/pfn.h>
 #include <linux/suspend.h>
 #include <linux/acpi.h>
+#include <linux/export.h>
 #include <linux/firmware-map.h>
 #include <linux/memblock.h>
 #include <linux/sort.h>
--- linux-next-20110729.orig/arch/x86/kernel/pci-dma.c
+++ linux-next-20110729/arch/x86/kernel/pci-dma.c
@@ -1,6 +1,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dma-debug.h>
 #include <linux/dmar.h>
+#include <linux/export.h>
 #include <linux/bootmem.h>
 #include <linux/gfp.h>
 #include <linux/pci.h>
--- linux-next-20110729.orig/arch/x86/kernel/rtc.c
+++ linux-next-20110729/arch/x86/kernel/rtc.c
@@ -5,6 +5,7 @@
 #include <linux/mc146818rtc.h>
 #include <linux/acpi.h>
 #include <linux/bcd.h>
+#include <linux/export.h>
 #include <linux/pnp.h>
 #include <linux/of.h>
 
