From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] x86: perf_event_intel.c needs export.h
Date: Tue, 11 Oct 2011 11:26:19 -0700
Message-ID: <4E948A4B.3010009@xenotime.net>
References: <20111011201127.455df266dcbffb1d621f8576@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20111011201127.455df266dcbffb1d621f8576@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, x86 maintainers <x86@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Paul Gortmaker <paul.gortmaker@windriver.com>
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <rdunlap@xenotime.net>

Add <linux/export.h> to fix build warnings:

arch/x86/kernel/cpu/perf_event_intel.c:1323:1: warning: data definition has no type or storage class
arch/x86/kernel/cpu/perf_event_intel.c:1323:1: warning: type defaults to 'int' in declaration of 'EXPORT_SYMBOL_GPL'
arch/x86/kernel/cpu/perf_event_intel.c:1323:1: warning: parameter names (without types) in function declaration

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
---
 arch/x86/kernel/cpu/perf_event_intel.c |    1 +
 1 file changed, 1 insertion(+)

--- next-2011-1011.orig/arch/x86/kernel/cpu/perf_event_intel.c
+++ next-2011-1011/arch/x86/kernel/cpu/perf_event_intel.c
@@ -7,6 +7,7 @@
 
 #include <linux/stddef.h>
 #include <linux/types.h>
+#include <linux/export.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 
