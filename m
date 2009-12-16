From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] nfs: fix ISO C90 warning
Date: Wed, 16 Dec 2009 14:23:34 -0800
Message-ID: <20091216142334.6a0ba115.randy.dunlap@oracle.com>
References: <20091215165309.58e98eea.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20091215165309.58e98eea.sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Trond Myklebust <Trond.Myklebust-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>
Cc: linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-next.vger.kernel.org

From: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>

Fix gcc ISO C90 warning:

fs/nfs/callback.c:356: warning: ISO C90 forbids mixed declarations and code

Signed-off-by: Randy Dunlap <randy.dunlap-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
---
 fs/nfs/callback.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20091215.orig/fs/nfs/callback.c
+++ linux-next-20091215/fs/nfs/callback.c
@@ -352,8 +352,8 @@ static int check_gss_callback_principal(
 static int nfs_callback_authenticate(struct svc_rqst *rqstp)
 {
 	struct nfs_client *clp;
-	RPC_IFDEBUG(char buf[RPC_MAX_ADDRBUFLEN]);
 	int ret = SVC_OK;
+	RPC_IFDEBUG(char buf[RPC_MAX_ADDRBUFLEN]);
 
 	/* Don't talk to strangers */
 	clp = nfs_find_client(svc_addr(rqstp), 4);
--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
