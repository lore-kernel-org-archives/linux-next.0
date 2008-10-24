From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Fw: [PATCH] nfsctl: credentials error
Date: Fri, 24 Oct 2008 16:55:24 +1100
Message-ID: <20081024165524.1a1ff01c.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56847 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750784AbYJXFza (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 24 Oct 2008 01:55:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Howells <dhowells@redhat.com>, James Morris <jmorris@namei.org>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>

[Added recipients]

I have added this patch to today's linux-next.

Begin forwarded message:

Date: Thu, 23 Oct 2008 18:17:01 -0700
From: Randy Dunlap <randy.dunlap@oracle.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, akpm <akpm@linux-foundation.org>
Subject: [PATCH] nfsctl: credentials error


From: Randy Dunlap <randy.dunlap@oracle.com>

Needs headers help for current_cred:

Adding only cred.h wasn't enough.

linux-next-20081023/fs/nfsctl.c:45: error: implicit declaration of function 'current_cred'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
---
 fs/nfsctl.c |    2 ++
 1 file changed, 2 insertions(+)

--- linux-next-20081023.orig/fs/nfsctl.c
+++ linux-next-20081023/fs/nfsctl.c
@@ -10,6 +10,8 @@
 #include <linux/sunrpc/svc.h>
 #include <linux/nfsd/nfsd.h>
 #include <linux/nfsd/syscall.h>
+#include <linux/cred.h>
+#include <linux/sched.h>
 #include <linux/linkage.h>
 #include <linux/namei.h>
 #include <linux/mount.h>



-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
