From: Randy Dunlap <rdunlap@xenotime.net>
Subject: [PATCH -next] nfsd: fix nfs4recover.f printk format warning
Date: Thu, 19 Apr 2012 16:15:04 -0700
Message-ID: <4F909C78.7000008@xenotime.net>
References: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy8-pub.bluehost.com ([69.89.22.20]:60092 "HELO
	oproxy8-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1751577Ab2DSXOa (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 19 Apr 2012 19:14:30 -0400
In-Reply-To: <20120419164643.d9f918d44c890722b7707508@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>, linux-nfs@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

From: Randy Dunlap <rdunlap@xenotime.net>

Fix printk format warnings -- both items are size_t,
so use %zu to print them.

fs/nfsd/nfs4recover.c:580:3: warning: format '%lu' expects type 'long unsigned int', but argument 3 has type 'size_t'
fs/nfsd/nfs4recover.c:580:3: warning: format '%lu' expects type 'long unsigned int', but argument 4 has type 'unsigned int'

Signed-off-by: Randy Dunlap <rdunlap@xenotime.net>
Cc:	"J. Bruce Fields" <bfields@fieldses.org>
Cc:	linux-nfs@vger.kernel.org
---
 fs/nfsd/nfs4recover.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20120419.orig/fs/nfsd/nfs4recover.c
+++ linux-next-20120419/fs/nfsd/nfs4recover.c
@@ -577,7 +577,7 @@ cld_pipe_downcall(struct file *filp, con
 	struct cld_net *cn = nn->cld_net;
 
 	if (mlen != sizeof(*cmsg)) {
-		dprintk("%s: got %lu bytes, expected %lu\n", __func__, mlen,
+		dprintk("%s: got %zu bytes, expected %zu\n", __func__, mlen,
 			sizeof(*cmsg));
 		return -EINVAL;
 	}
