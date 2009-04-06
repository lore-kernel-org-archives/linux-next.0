From: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/3] SQUASHME: nfs41: move nfs4_session_set_rwsize into CONFIG_NFS_V4
Date: Mon,  6 Apr 2009 10:49:58 +0300
Message-ID: <1239004198-8708-1-git-send-email-bhalevy@panasas.com>
References: <49D9B2B9.5010401@panasas.com>
Return-path: <linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49D9B2B9.5010401-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
Sender: linux-nfs-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Trond Myklebust <trond.myklebust-41N18TsMXrtuMpJDpNschA@public.gmane.org>
Cc: Andy Adamson <andros-HgOvQuBEEgTQT0dZR+AlfA@public.gmane.org>, Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, "J. Bruce Fields" <bfields-uC3wQj2KruNg9hUCZPvPmw@public.gmane.org>, linux-next-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, pnfs-6DNke4IJHB0gsBAKwltoeQ@public.gmane.org, linux-nfs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-next.vger.kernel.org

fix compiler warning:
fs/nfs/client.c:554: warning: 'nfs4_session_set_rwsize' defined but not used

Reported-by: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>
Signed-off-by: Benny Halevy <bhalevy-C4P08NqkoRlBDgjK7y7TUQ@public.gmane.org>
---
 fs/nfs/client.c |   30 +++++++++++++++---------------
 1 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/fs/nfs/client.c b/fs/nfs/client.c
index eb341d3..9999f13 100644
--- a/fs/nfs/client.c
+++ b/fs/nfs/client.c
@@ -551,21 +551,6 @@ int nfs4_check_client_ready(struct nfs_client *clp)
 }
 
 /*
- * Session has been established, and the client marked ready.
- * Set the mount rsize and wsize with negotiated fore channel
- * attributes which will be bound checked in nfs_server_set_fsinfo.
- */
-static void nfs4_session_set_rwsize(struct nfs_server *server)
-{
-#ifdef CONFIG_NFS_V4_1
-	if (!nfs4_has_session(server->nfs_client))
-		return;
-	server->rsize = server->nfs_client->cl_session->fc_attrs.max_resp_sz;
-	server->wsize = server->nfs_client->cl_session->fc_attrs.max_rqst_sz;
-#endif /* CONFIG_NFS_V4_1 */
-}
-
-/*
  * Initialise the timeout values for a connection
  */
 static void nfs_init_timeout_values(struct rpc_timeout *to, int proto,
@@ -1246,6 +1231,21 @@ static void nfs4_init_session(struct nfs_client *clp,
 }
 
 /*
+ * Session has been established, and the client marked ready.
+ * Set the mount rsize and wsize with negotiated fore channel
+ * attributes which will be bound checked in nfs_server_set_fsinfo.
+ */
+static void nfs4_session_set_rwsize(struct nfs_server *server)
+{
+#ifdef CONFIG_NFS_V4_1
+	if (!nfs4_has_session(server->nfs_client))
+		return;
+	server->rsize = server->nfs_client->cl_session->fc_attrs.max_resp_sz;
+	server->wsize = server->nfs_client->cl_session->fc_attrs.max_rqst_sz;
+#endif /* CONFIG_NFS_V4_1 */
+}
+
+/*
  * Create a version 4 volume record
  */
 static int nfs4_init_server(struct nfs_server *server,
-- 
1.6.2.1

--
To unsubscribe from this list: send the line "unsubscribe linux-nfs" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
