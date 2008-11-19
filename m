From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next resend] nfsctl: add headers for credentials
Date: Wed, 19 Nov 2008 11:33:52 -0800
Message-ID: <20081119113352.a92b5640.randy.dunlap@oracle.com>
References: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from acsinet12.oracle.com ([141.146.126.234]:18283 "EHLO
	acsinet12.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752029AbYKSTfN (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 19 Nov 2008 14:35:13 -0500
In-Reply-To: <20081119175917.7d21cf77.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, dhowells@redhat.com, akpm <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Randy Dunlap <randy.dunlap@oracle.com>

Needs headers help for current_cred:

Adding only cred.h wasn't enough.

linux-next-20081023/fs/nfsctl.c:45: error: implicit declaration of function 'current_cred'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/nfsctl.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20081119.orig/fs/nfsctl.c
+++ linux-next-20081119/fs/nfsctl.c
@@ -10,6 +10,8 @@
 #include <linux/sunrpc/svc.h>
 #include <linux/nfsd/nfsd.h>
 #include <linux/nfsd/syscall.h>
+#include <linux/cred.h>
+#include <linux/sched.h>
 #include <linux/linkage.h>
 #include <linux/namei.h>
 #include <linux/mount.h>
