From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH] nfs41: get rid of unused struct nfs41_exchange_id_res members
Date: Fri,  1 May 2009 23:14:46 +0300
Message-ID: <1241208886-5748-1-git-send-email-bhalevy@panasas.com>
References: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:24441 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757449AbZEAUPI (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 1 May 2009 16:15:08 -0400
In-Reply-To: <89c397150905010756h503498d4n9fd2f8bb3ce403c3@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, Benny Halevy <bhalevy@panasas.com>

struct nfs41_exchange_id_res is currently allocated on the stack
insanely taking over 2K of stack space due to the NFS4_OPAQUE_LIMIT (1K(
byte arrays embedded in server_owner and server_scope.
Since these are not in use yet, this patch gets rid of them for the
time being.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c        |   27 ++++++++++++++-------------
 include/linux/nfs_xdr.h |    3 ---
 2 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index 80af0ae..3350d19 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -4185,8 +4185,8 @@ static int decode_delegreturn(struct xdr_stream *xdr)
 static int decode_exchange_id(struct xdr_stream *xdr,
 			      struct nfs41_exchange_id_res *res)
 {
-	uint32_t *p;
-	int status, dummy;
+	uint32_t *p, dummy;
+	int status;
 	struct nfs_client *clp = res->client;
 
 	status = decode_op_hdr(xdr, OP_EXCHANGE_ID);
@@ -4204,25 +4204,26 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 	if (dummy != SP4_NONE)
 		return -EIO;
 
-	/* minor_id */
+	/* Throw away minor_id */
 	READ_BUF(8);
-	READ64(res->server_owner.minor_id);
+	p += 8;
 
-	/* Major id */
+	/* Throw away Major id */
 	READ_BUF(4);
-	READ32(res->server_owner.major_id_sz);
-	READ_BUF(res->server_owner.major_id_sz);
-	COPYMEM(res->server_owner.major_id, res->server_owner.major_id_sz);
+	READ32(dummy);
+	READ_BUF(dummy);
+	p += XDR_QUADLEN(dummy);
 
-	/* server_scope */
+	/* Throw away server_scope */
 	READ_BUF(4);
-	READ32(res->server_scope.server_scope_sz);
-	READ_BUF(res->server_scope.server_scope_sz);
-	COPYMEM(res->server_scope.server_scope,
-		res->server_scope.server_scope_sz);
+	READ32(dummy);
+	READ_BUF(dummy);
+	p += XDR_QUADLEN(dummy);
+
 	/* Throw away Implementation id array */
 	READ_BUF(4);
 	READ32(dummy);
+	READ_BUF(dummy);
 	p += XDR_QUADLEN(dummy);
 
 	return 0;
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
