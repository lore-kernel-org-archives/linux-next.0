From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH] coda: fix creds reference
Date: Wed, 19 Nov 2008 11:15:56 -0800
Message-ID: <20081119111556.b20c9895.randy.dunlap@oracle.com>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:37143 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754061AbYKSTRi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:17:38 -0500
In-Reply-To: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, jaharkes@cs.cmu.edu, dhowells@redhat.com
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>


I guess that Stephen carried this patch for a few weeks, but now
he has stopped carrying linux-next build patches.
Still broken.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From: Randy Dunlap <randy.dunlap@oracle.com>

Needs a header file for credentials struct:

linux-next-20081023/fs/coda/file.c:177: error: dereferencing pointer to incomplete type

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
cc: Jan Harkes <jaharkes@cs.cmu.edu>
---
 fs/coda/file.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20081119.orig/fs/coda/file.c
+++ linux-next-20081119/fs/coda/file.c
@@ -13,6 +13,7 @@
 #include <linux/file.h>
 #include <linux/fs.h>
 #include <linux/stat.h>
+#include <linux/cred.h>
 #include <linux/errno.h>
 #include <linux/smp_lock.h>
 #include <linux/string.h>
