From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] nfs: fix stub return type warnings
Date: Fri, 27 Jul 2012 11:49:26 -0700
Message-ID: <5012E2B6.5010009@xenotime.net>
References: <20120727142126.15a52335cda4c39d5c120c49@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy10-pub.bluehost.com ([67.222.39.61]:39370 "HELO
	oproxy10-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1752237Ab2G0Suc (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 27 Jul 2012 14:50:32 -0400
In-Reply-To: <20120727142126.15a52335cda4c39d5c120c49@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-nfs@vger.kernel.org, Trond Myklebust <Trond.Myklebust@netapp.com>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix numerous repeated warnings by making the stub function
void instead of non-void:

fs/nfs/nfs4_fs.h: In function 'nfs4_unregister_sysctl':
fs/nfs/nfs4_fs.h:385:1: warning: no return statement in function returning non-void

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	Trond Myklebust <Trond.Myklebust@netapp.com>
---
 fs/nfs/nfs4_fs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120727.orig/fs/nfs/nfs4_fs.h
+++ linux-next-20120727/fs/nfs/nfs4_fs.h
@@ -380,7 +380,7 @@ static inline int nfs4_register_sysctl(v
 	return 0;
 }
 
-static inline int nfs4_unregister_sysctl(void)
+static inline void nfs4_unregister_sysctl(void)
 {
 }
 #endif
