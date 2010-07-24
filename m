From: Tejun Heo <tj@kernel.org>
Subject: [PATCH wq#for-next] fscache: fix build on !CONFIG_SYSCTL
Date: Sat, 24 Jul 2010 11:14:17 +0200
Message-ID: <4C4AAEE9.8050903@kernel.org>
References: <20100723164931.7bf2160f.sfr@canb.auug.org.au> <20100723090831.6af4a288.randy.dunlap@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:36763 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753577Ab0GXJO0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 24 Jul 2010 05:14:26 -0400
In-Reply-To: <20100723090831.6af4a288.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Commit 8b8edefa (fscache: convert object to use workqueue instead of
slow-work) made fscache_exit() call unregister_sysctl_table()
unconditionally breaking build when sysctl is disabled.  Fix it by
putting it inside CONFIG_SYSCTL.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: David Howells <dhowells@redhat.com>
---
This should fix it.  Thanks.

 fs/fscache/main.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/fs/fscache/main.c b/fs/fscache/main.c
index 500936d..f9d8567 100644
--- a/fs/fscache/main.c
+++ b/fs/fscache/main.c
@@ -186,7 +186,9 @@ static void __exit fscache_exit(void)

 	kobject_put(fscache_root);
 	kmem_cache_destroy(fscache_cookie_jar);
+#ifdef CONFIG_SYSCTL
 	unregister_sysctl_table(fscache_sysctl_header);
+#endif
 	fscache_proc_cleanup();
 	destroy_workqueue(fscache_op_wq);
 	destroy_workqueue(fscache_object_wq);
-- 
1.7.1
