From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 3/6] nfs41: get rid of unused struct nfs41_exchange_id_res members
Date: Thu,  7 May 2009 19:00:39 +0300
Message-ID: <1241712039-30415-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:13277 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1760277AbZEGQAp (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:00:45 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

struct nfs41_exchange_id_res is currently allocated on the stack
insanely taking over 2K of stack space due to the NFS4_OPAQUE_LIMIT (1K)
byte arrays embedded in server_owner and server_scope.
Since these are not in use yet, this patch gets rid of them for the
time being.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c        |   22 ++++++++++------------
 include/linux/nfs_xdr.h |    3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index b7cfd36..d0fa05b 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -4186,7 +4186,8 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 			      struct nfs41_exchange_id_res *res)
 {
 	__be32 *p;
-	int status, dummy;
+	uint32_t dummy;
+	int status;
 	struct nfs_client *clp = res->client;
 
 	status = decode_op_hdr(xdr, OP_EXCHANGE_ID);
@@ -4204,22 +4205,19 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 	if (dummy != SP4_NONE)
 		return -EIO;
 
-	/* minor_id */
+	/* Throw away minor_id */
 	READ_BUF(8);
-	READ64(res->server_owner.minor_id);
 
-	/* Major id */
+	/* Throw away Major id */
 	READ_BUF(4);
-	READ32(res->server_owner.major_id_sz);
-	READ_BUF(res->server_owner.major_id_sz);
-	COPYMEM(res->server_owner.major_id, res->server_owner.major_id_sz);
+	READ32(dummy);
+	READ_BUF(dummy);
 
-	/* server_scope */
+	/* Throw away server_scope */
 	READ_BUF(4);
-	READ32(res->server_scope.server_scope_sz);
-	READ_BUF(res->server_scope.server_scope_sz);
-	COPYMEM(res->server_scope.server_scope,
-		res->server_scope.server_scope_sz);
+	READ32(dummy);
+	READ_BUF(dummy);
+
 	/* Throw away Implementation id array */
 	READ_BUF(4);
 	READ32(dummy);
diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
index 071a6d1..62f63fb 100644
--- a/include/linux/nfs_xdr.h
+++ b/include/linux/nfs_xdr.h
@@ -925,9 +925,6 @@ struct server_scope {
 struct nfs41_exchange_id_res {
 	struct nfs_client		*client;
 	u32				flags;
-	struct server_owner		server_owner;
-	struct server_scope		server_scope;
-	struct nfs_impl_id4		impl_id;
 };
 
 struct nfs41_create_session_args {
-- 
1.6.2.1
