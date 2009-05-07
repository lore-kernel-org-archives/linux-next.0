From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 5/6] nfs41: refactor decoding of channel attributes
Date: Thu,  7 May 2009 19:00:54 +0300
Message-ID: <1241712054-30480-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:5000 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1758912AbZEGQBC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:01:02 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

Also, verify ca_rdma_ird value and print a warning if > 1.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c |   60 +++++++++++++++++++++++++----------------------------
 1 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index ea16df2..e4c0209 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -4226,12 +4226,35 @@ static int decode_exchange_id(struct xdr_stream *xdr,
 	return 0;
 }
 
+static int decode_chan_attrs(struct xdr_stream *xdr,
+			     struct nfs4_channel_attrs *attrs)
+{
+	__be32 *p;
+	u32 nr_attrs;
+
+	READ_BUF(28);
+	READ32(attrs->headerpadsz);
+	READ32(attrs->max_rqst_sz);
+	READ32(attrs->max_resp_sz);
+	READ32(attrs->max_resp_sz_cached);
+	READ32(attrs->max_ops);
+	READ32(attrs->max_reqs);
+	READ32(nr_attrs);
+	if (unlikely(nr_attrs > 1)) {
+		printk(KERN_WARNING "%s: Invalid rdma channel attrs count %u\n",
+			__func__, nr_attrs);
+		return -EINVAL;
+	}
+	if (nr_attrs == 1)
+		READ_BUF(4); /* skip rdma_attrs */
+	return 0;
+}
+
 static int decode_create_session(struct xdr_stream *xdr,
 				 struct nfs41_create_session_res *res)
 {
 	__be32 *p;
 	int status;
-	u32 nr_attrs;
 	struct nfs_client *clp = res->client;
 	struct nfs4_session *session = clp->cl_session;
 
@@ -4250,37 +4273,10 @@ static int decode_create_session(struct xdr_stream *xdr,
 	READ32(session->flags);
 
 	/* Channel attributes */
-	/* fore channel */
-	READ_BUF(24);
-	READ32(session->fc_attrs.headerpadsz);
-	READ32(session->fc_attrs.max_rqst_sz);
-	READ32(session->fc_attrs.max_resp_sz);
-	READ32(session->fc_attrs.max_resp_sz_cached);
-	READ32(session->fc_attrs.max_ops);
-	READ32(session->fc_attrs.max_reqs);
-	READ_BUF(4);
-	READ32(nr_attrs);
-	if (nr_attrs == 1) {
-		READ_BUF(4);
-		p++; /* skip rdma_attrs */
-	}
-
-	/* back channel */
-	READ_BUF(24);
-	READ32(session->bc_attrs.headerpadsz);
-	READ32(session->bc_attrs.max_rqst_sz);
-	READ32(session->bc_attrs.max_resp_sz);
-	READ32(session->bc_attrs.max_resp_sz_cached);
-	READ32(session->bc_attrs.max_ops);
-	READ32(session->bc_attrs.max_reqs);
-	READ_BUF(4);
-	READ32(nr_attrs);
-	if (nr_attrs == 1) {
-		READ_BUF(4);
-		p++; /* skip rdma_attrs */
-	}
-
-	return 0;
+	status = decode_chan_attrs(xdr, &session->fc_attrs);
+	if (!status)
+		status = decode_chan_attrs(xdr, &session->bc_attrs);
+	return status;
 }
 
 static int decode_destroy_session(struct xdr_stream *xdr, void *dummy)
-- 
1.6.2.1
