From: Benny Halevy <bhalevy@panasas.com>
Subject: [PATCH 2/6] nfs41: fix Xcode_exchange_id's xdr Xcoding pointer type
Date: Thu,  7 May 2009 19:00:31 +0300
Message-ID: <1241712031-30383-1-git-send-email-bhalevy@panasas.com>
References: <4A0304C7.2090003@panasas.com>
Return-path: <linux-next-owner@vger.kernel.org>
Received: from gw-ca.panasas.com ([209.116.51.66]:16858 "EHLO
	laguna.int.panasas.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1757173AbZEGQAi (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 7 May 2009 12:00:38 -0400
In-Reply-To: <4A0304C7.2090003@panasas.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Trond Myklebust <trond.myklebust@fys.uio.no>
Cc: Andy Adamson <andros@netapp.com>, pnfs@linux-nfs.org, linux-next@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, Benny Halevy <bhalevy@panasas.com>

should point to __be32, not uint43_t.

Signed-off-by: Benny Halevy <bhalevy@panasas.com>
---
 fs/nfs/nfs4xdr.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
index d682af4..b7cfd36 100644
--- a/fs/nfs/nfs4xdr.c
+++ b/fs/nfs/nfs4xdr.c
@@ -1546,7 +1546,7 @@ static void encode_exchange_id(struct xdr_stream *xdr,
 			       struct nfs41_exchange_id_args *args,
 			       struct compound_hdr *hdr)
 {
-	uint32_t *p;
+	__be32 *p;
 
 	RESERVE_SPACE(4 + sizeof(args->verifier->data));
 	WRITE32(OP_EXCHANGE_ID);
@@ -4185,7 +4185,7 @@ static int decode_delegreturn(struct xdr_stream *xdr)
 static int decode_exchange_id(struct xdr_stream *xdr,
 			      struct nfs41_exchange_id_res *res)
 {
-	uint32_t *p;
+	__be32 *p;
 	int status, dummy;
 	struct nfs_client *clp = res->client;
 
-- 
1.6.2.1
