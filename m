From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] coda: credentials error
Date: Thu, 23 Oct 2008 18:17:45 -0700
Message-ID: <20081023181745.7991a823.randy.dunlap@oracle.com>
References: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from rcsinet13.oracle.com ([148.87.113.125]:23820 "EHLO
	rgminet13.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759129AbYJXBSo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 23 Oct 2008 21:18:44 -0400
In-Reply-To: <20081023213637.eff9b414.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Needs a header file for credentials struct:

linux-next-20081023/fs/coda/file.c:177: error: dereferencing pointer to incomplete type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/coda/file.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20081023.orig/fs/coda/file.c
+++ linux-next-20081023/fs/coda/file.c
@@ -13,6 +13,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/stat.h>
+#include <linux/cred.h>
 #include <linux/errno.h>
 #include <linux/smp_lock.h>
 #include <linux/string.h>
